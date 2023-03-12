using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ClasificacionPeliculas.Models;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Text.Json;

namespace ClasificacionPeliculas.Controllers
{
  public class PersonalInformationController : Controller
  {
    private readonly MoviesContext _context;

    public PersonalInformationController()
    {
      _context = new MoviesContext();
    }

    // GET: PersonalInformations
    public IActionResult Index()
    {
      IEnumerable<PersonalInformation> _personalInformations =
          (from pi in _context.PersonalInformations
           join c in _context.Cities on pi.GeonameidCity equals c.Geonameid
           select new PersonalInformation
           {
             Id = pi.Id,
             Name = pi.Name,
             DateOfBirth = pi.DateOfBirth,
             Email = pi.Email,
             PhoneNumber = pi.PhoneNumber,
             Address = pi.Address,
             GeonameidCity = pi.GeonameidCity,
             GeonameidCityNavigation = c
           }).ToList();
      return View(_personalInformations);
    }

    // GET: PersonalInformation/Details/5
    public IActionResult Details(int? id)
    {
      if (id == null || _context.PersonalInformations == null) return NotFound();
      var personalInformations = GetPersonalInformationWithCity(id);
      if (personalInformations == null) return NotFound();
      return View(personalInformations);
    }

    // GET: PersonalInformation/Create
    public IActionResult Create()
    {
      List<Region> regions = GetRegions();
      List<City> cities = (List<City>)GetCitiesFromRegion(regions[0].Geonameid).Value;
      ViewBag.regions = new SelectList(regions, "Geonameid", "Name", regions.Select(s => s.Geonameid).FirstOrDefault());
      ViewBag.cities = new SelectList(cities, "Geonameid", "Name", cities.Select(s => s.Geonameid).FirstOrDefault());
      return View();
    }


    // POST: PersonalInformation/Create
    // To protect from overposting attacks, enable the specific properties you want to bind to.
    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Create([Bind("Name,DateOfBirth,Email,PhoneNumber,Address,GeonameidCity")] PersonalInformation PersonalInformation)
    {
      if (ModelState.IsValid)
      {
        _context.Add(PersonalInformation);
        await _context.SaveChangesAsync();
        return RedirectToAction(nameof(Index));
      }
      return View(PersonalInformation);
    }

    // GET: PersonalInformation/Edit/5
    public IActionResult Edit(int? id)
    {
      if (id == null || _context.PersonalInformations == null) return NotFound();
      var personalInformations = GetPersonalInformationWithCity(id);
      if (personalInformations == null) return NotFound();

      List<Region> regions = GetRegions();
      SelectList regionsList = new SelectList(regions, "Geonameid", "Name", regions.Select(s => s.Geonameid).FirstOrDefault());
      regionsList.Where(x => x.Value == personalInformations.GeonameidCityNavigation.GeonameidRegion.ToString()).First().Selected = true;
      ViewBag.regions = regionsList;
      
      List<City> cities = (List<City>)GetCitiesFromRegion(personalInformations.GeonameidCityNavigation.GeonameidRegion).Value;
      ViewBag.cities = new SelectList(cities, "Geonameid", "Name", cities.Select(s => s.Geonameid).FirstOrDefault());

      return View(personalInformations);
    }

    // POST: PersonalInformation/Edit/5
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Edit(int id, [Bind("Id,Name,DateOfBirth,Email,PhoneNumber,Address,GeonameidCity")] PersonalInformation PersonalInformation)
    {
      if (id != PersonalInformation.Id) return NotFound();
      if (!ModelState.IsValid) View(PersonalInformation);
      try
      {
        _context.Update(PersonalInformation);
        await _context.SaveChangesAsync();
      }
      catch (DbUpdateConcurrencyException)
      {
        if (!MovieExists(PersonalInformation.Id)) return NotFound();
        else throw;
      }
      return RedirectToAction(nameof(Index));
    }

    // GET: PersonalInformation/Delete/5
    public IActionResult Delete(int? id)
    {
      if (id == null || _context.PersonalInformations == null) return NotFound();
      var personalInformations = GetPersonalInformationWithCity(id);
      if (personalInformations == null) return NotFound();
      return View(personalInformations);
    }

    // POST: PersonalInformation/Delete/5
    [HttpPost, ActionName("Delete")]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> DeleteConfirmed(int id)
    {
      if (_context.PersonalInformations == null)
        return Problem("Entity set 'MoviesContext.PersonalInformations'  is null.");

      var personalInformations = await _context.PersonalInformations.FindAsync(id);
      if (personalInformations != null) _context.PersonalInformations.Remove(personalInformations);
      await _context.SaveChangesAsync();
      return RedirectToAction(nameof(Index));
    }

    private bool MovieExists(int id)
    {
      return (_context.PersonalInformations?.Any(e => e.Id == id)).GetValueOrDefault();
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

    private PersonalInformation GetPersonalInformationWithCity(int? id)
    {
      if (id == null) return null;
      return (from pi in _context.PersonalInformations
              join c in _context.Cities on pi.GeonameidCity equals c.Geonameid
              where pi.Id == id
              select new PersonalInformation
              {
                Id = pi.Id,
                Name = pi.Name,
                DateOfBirth = pi.DateOfBirth,
                Email = pi.Email,
                PhoneNumber = pi.PhoneNumber,
                Address = pi.Address,
                GeonameidCity = pi.GeonameidCity,
                GeonameidCityNavigation = c
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
