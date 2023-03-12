using ClasificacionPeliculas.Models;
using ClasificacionPeliculasModel;
using Google.Protobuf.WellKnownTypes;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace ClasificacionPeliculas.Controllers
{
    public class MoviescategoryController : Controller
    {
        public IActionResult Index()
        {
            MoviesContext _moviesContext = new MoviesContext();
            IEnumerable<ClasificacionPeliculasModel.Moviescategory> moviescategories =
                (from mc in _moviesContext.Moviescategories
                 join m in _moviesContext.Movies on mc.MovieId equals m.Id
                 join c in _moviesContext.Categories on mc.CategoryId equals c.Id
                 select new ClasificacionPeliculasModel.Moviescategory
                 {
                     Id = mc.Id,
                     MovieName = m.Title,
                     CategoryName = c.Name
                 }).ToList();
            return View(moviescategories);
        }

        public IActionResult Create()
        {
            MoviesContext _moviesContext = new MoviesContext();
            IEnumerable<ClasificacionPeliculasModel.Movie> movies = (from mc in _moviesContext.Movies
                                                                     select new ClasificacionPeliculasModel.Movie
                                                                     {
                                                                         Id = mc.Id,
                                                                         Title = mc.Title,
                                                                     }).ToList();

            IEnumerable<ClasificacionPeliculasModel.Category> categories = (from c in _moviesContext.Categories
                                                                            select new ClasificacionPeliculasModel.Category
                                                                            {
                                                                                Id = c.Id,
                                                                                Name = c.Name
                                                                            }).ToList();
            ClasificacionPeliculasModel.Moviescategory moviescategory = new ClasificacionPeliculasModel.Moviescategory();
            moviescategory.Categories = categories.Select(s => new SelectListItem()
            {
                Value = s.Id.ToString(),
                Text = s.Name
            }).ToList();
            moviescategory.Movies = movies.Select(s => new SelectListItem()
            {
                Value = s.Id.ToString(),
                Text = s.Title
            }).ToList();
            moviescategory.Movie = (from m in _moviesContext.Movies
                                    where m.Id == movies.FirstOrDefault().Id
                                    select new ClasificacionPeliculasModel.Movie
                                    {
                                        Title = m.Title,
                                        ReleaseDate = m.ReleaseDate,
                                        Duration = m.Duration,
                                        Director = m.Director,
                                        Actors = m.Actors

                                    }).FirstOrDefault();
            return View(moviescategory);
        }
        [HttpPost]
        public IActionResult Create(int MovieId, int CategoryId)
        {
            Models.Moviescategory moviescategory = new Models.Moviescategory
            {
                MovieId = MovieId,
                CategoryId = CategoryId
            };
            MoviesContext _moviesContext = new MoviesContext();
            _moviesContext.Moviescategories.Add(moviescategory);
            _moviesContext.SaveChanges();
            return RedirectToAction("Index");
        }

        public IActionResult Edit(int id)
        {
            MoviesContext _moviesContext = new MoviesContext();
            Models.Moviescategory moviescategory = _moviesContext.Moviescategories.FirstOrDefault(s => s.Id == id);
            ClasificacionPeliculasModel.Moviescategory CPMmoviescategory = new ClasificacionPeliculasModel.Moviescategory
            {
                CategoryId = moviescategory.CategoryId,
                MovieId = moviescategory.MovieId,
                Id = moviescategory.Id
            };
            IEnumerable<ClasificacionPeliculasModel.Movie> movies = (from mc in _moviesContext.Movies
                                                                     select new ClasificacionPeliculasModel.Movie
                                                                     {
                                                                         Id = mc.Id,
                                                                         Title = mc.Title,
                                                                     }).ToList();
            IEnumerable<ClasificacionPeliculasModel.Category> categories = (from c in _moviesContext.Categories
                                                                            select new ClasificacionPeliculasModel.Category
                                                                            {
                                                                                Id = c.Id,
                                                                                Name = c.Name
                                                                            }).ToList();

            CPMmoviescategory.Categories = categories.Select(s => new SelectListItem()
            {
                Value = s.Id.ToString(),
                Text = s.Name,
                Selected = (s.Id == CPMmoviescategory.CategoryId)
            }).ToList();
            ViewBag.Movies = movies.Select(s => new SelectListItem()
            {
                Value = s.Id.ToString(),
                Text = s.Title,
                Selected = (s.Id == CPMmoviescategory.MovieId)
            }).ToList();
            return View(CPMmoviescategory);
        }
        [HttpPost]
        public IActionResult Edit(int Id, int MovieId, int CategoryId)
        {
            MoviesContext _moviesContext = new MoviesContext();
            Models.Moviescategory moviescategory = _moviesContext.Moviescategories.FirstOrDefault(s => s.Id == Id);
            moviescategory.CategoryId = CategoryId;
            moviescategory.MovieId = MovieId;
            _moviesContext.Moviescategories.Update(moviescategory);
            _moviesContext.SaveChanges();
            return RedirectToAction("Index");
        }
        public IActionResult Details(int id)
        {
            MoviesContext _moviesContext = new MoviesContext();
            Models.Moviescategory moviescategory = _moviesContext.Moviescategories.FirstOrDefault(s => s.Id == id);
            ClasificacionPeliculasModel.Moviescategory CPMmoviescategory = new ClasificacionPeliculasModel.Moviescategory
            {
                CategoryId = moviescategory.CategoryId,
                MovieId = moviescategory.MovieId,
                Id = moviescategory.Id
            };
            IEnumerable<ClasificacionPeliculasModel.Movie> movies = (from mc in _moviesContext.Movies
                                                                     select new ClasificacionPeliculasModel.Movie
                                                                     {
                                                                         Id = mc.Id,
                                                                         Title = mc.Title,
                                                                     }).ToList();
            IEnumerable<ClasificacionPeliculasModel.Category> categories = (from c in _moviesContext.Categories
                                                                            select new ClasificacionPeliculasModel.Category
                                                                            {
                                                                                Id = c.Id,
                                                                                Name = c.Name
                                                                            }).ToList();

            CPMmoviescategory.Categories = categories.Select(s => new SelectListItem()
            {
                Value = s.Id.ToString(),
                Text = s.Name,
                Selected = (s.Id == CPMmoviescategory.CategoryId)
            }).ToList();
            CPMmoviescategory.Movies = movies.Select(s => new SelectListItem()
            {
                Value = s.Id.ToString(),
                Text = s.Title,
                Selected = (s.Id == CPMmoviescategory.MovieId)
            }).ToList();
            return View(CPMmoviescategory);
        }

        
    }
}
