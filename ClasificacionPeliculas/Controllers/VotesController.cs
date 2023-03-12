using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ClasificacionPeliculas.Models;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Text.Json;

namespace ClasificacionPeliculas.Controllers
{
  public class VotesController : Controller
  {
    private readonly MoviesContext _context;

    public VotesController()
    {
      _context = new MoviesContext();
    }

    // GET: Votess
    public IActionResult Index()
    {
      IEnumerable<Vote> _votes =
          (from v in _context.Votes
           join pi in _context.PersonalInformations on v.PiId equals pi.Id
           join mo in _context.Movies on v.MoviesId equals mo.Id
           select new Vote
           {
              Id = v.Id,
              PiId = v.PiId,
              MoviesId = v.MoviesId,
              Rate = v.Rate,
              RowCreationTime = v.RowCreationTime,
              Movies = mo,
              Pi = pi
           }).ToList();
      return View(_votes);
    }

    // GET: Vote/Details/5
    public IActionResult Details(int? id)
    {
      if (id == null || _context.Votes == null) return NotFound();
      var votes = GetVoteWithPIAndMovie(id);
      if (votes == null) return NotFound();
      return View(votes);
    }

    // GET: Vote/Create
    public IActionResult Create()
    {
      List<Region> regions = GetRegions();
      List<City> cities = (List<City>)GetCitiesFromRegion(regions[0].Geonameid).Value;
      ViewBag.persons = new SelectList(regions, "Geonameid", "Name", regions.Select(s => s.Geonameid).FirstOrDefault());
      ViewBag.movies= new SelectList(cities, "Geonameid", "Name", cities.Select(s => s.Geonameid).FirstOrDefault());
      return View();
    }


    // POST: Vote/Create
    // To protect from overposting attacks, enable the specific properties you want to bind to.
    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Create([Bind("Name,DateOfBirth,Email,PhoneNumber,Address,GeonameidCity")] Vote Vote)
    {
      if (ModelState.IsValid)
      {
        _context.Add(Vote);
        await _context.SaveChangesAsync();
        return RedirectToAction(nameof(Index));
      }
      return View(Vote);
    }

    // GET: Vote/Edit/5
    // public IActionResult Edit(int? id)
    // {
    //   if (id == null || _context.Votes == null) return NotFound();
    //   var votes = GetVoteWithCity(id);
    //   if (votes == null) return NotFound();

    //   List<Region> regions = GetRegions();
    //   SelectList regionsList = new SelectList(regions, "Geonameid", "Name", regions.Select(s => s.Geonameid).FirstOrDefault());
    //   regionsList.Where(x => x.Value == votes.GeonameidCityNavigation.GeonameidRegion.ToString()).First().Selected = true;
    //   ViewBag.regions = regionsList;
      
    //   List<City> cities = (List<City>)GetCitiesFromRegion(votes.GeonameidCityNavigation.GeonameidRegion).Value;
    //   ViewBag.cities = new SelectList(cities, "Geonameid", "Name", cities.Select(s => s.Geonameid).FirstOrDefault());

    //   return View(votes);
    // }

    // POST: Vote/Edit/5
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Edit(int id, [Bind("Id,Name,DateOfBirth,Email,PhoneNumber,Address,GeonameidCity")] Vote Vote)
    {
      if (id != Vote.Id) return NotFound();
      if (!ModelState.IsValid) View(Vote);
      try
      {
        _context.Update(Vote);
        await _context.SaveChangesAsync();
      }
      catch (DbUpdateConcurrencyException)
      {
        if (!MovieExists(Vote.Id)) return NotFound();
        else throw;
      }
      return RedirectToAction(nameof(Index));
    }

    // GET: Vote/Delete/5
    public IActionResult Delete(int? id)
    {
      if (id == null || _context.Votes == null) return NotFound();
      var votes = GetVoteWithPIAndMovie(id);
      if (votes == null) return NotFound();
      return View(votes);
    }

    // POST: Vote/Delete/5
    [HttpPost, ActionName("Delete")]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> DeleteConfirmed(int id)
    {
      if (_context.Votes == null)
        return Problem("Entity set 'MoviesContext.Votes'  is null.");

      var votes = await _context.Votes.FindAsync(id);
      if (votes != null) _context.Votes.Remove(votes);
      await _context.SaveChangesAsync();
      return RedirectToAction(nameof(Index));
    }

    private bool MovieExists(int id)
    {
      return (_context.Votes?.Any(e => e.Id == id)).GetValueOrDefault();
    }

    private List<Region> GetRegions()
    {
      return (
        from r in _context.Regions
        select new Region
        {
          Geonameid = r.Geonameid,
          Name = r.Name
        }
      )
      .OrderBy(r => r.Name)
      .ToList();
    }

    private Vote GetVoteWithPIAndMovie(int? id)
    {
      if (id == null) return null;
      return 
      (from v in _context.Votes
       join pi in _context.PersonalInformations on v.PiId equals pi.Id
       join mo in _context.Movies on v.MoviesId equals mo.Id
       where v.Id == id
       select new Vote
       {
          Id = v.Id,
          PiId = v.PiId,
          MoviesId = v.MoviesId,
          Rate = v.Rate,
          RowCreationTime = v.RowCreationTime,
          Movies = mo,
          Pi = pi
       }).FirstOrDefault();
    }

    // AUX ------------------------------------------------------------------------

    public JsonResult GetCitiesFromRegion(long regionID)
    {
      List<City> cities = (
        from c in _context.Cities
        where c.GeonameidRegion == regionID
        select new City
        {
          Geonameid = c.Geonameid,
          Name = c.Name
        }
      )
      .OrderBy(r => r.Name)
      .ToList();
      return Json(cities);
    }
  }
}
