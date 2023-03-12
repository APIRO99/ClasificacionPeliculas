using ClasificacionPeliculas.Models;
using Microsoft.AspNetCore.Mvc;

namespace ClasificacionPeliculas.Controllers
{
    public class CategoriesController : Controller
    {
        public IActionResult Index()
        {
            MoviesContext _moviesContext = new MoviesContext();
            IEnumerable<ClasificacionPeliculasModel.Category> categories = (from c in _moviesContext.Categories
                                                                                //join mc in _moviesContext.Moviescategories on c.Id equals mc.CategoryId
                                                                                //where c.Id == 0
                                                                            select new ClasificacionPeliculasModel.Category
                                                                            {
                                                                                Id = c.Id,
                                                                                Name = c.Name
                                                                            }).OrderBy(s => s.Name).ToList();
            return View(categories);
        }
        [HttpGet]
        public IActionResult Create()
        {

            return View();
        }
        [HttpPost]
        public IActionResult Create(string Name)
        {
            MoviesContext _moviesContext = new MoviesContext();
            Models.Category category = new Models.Category
            {
                Name = Name
            };
            _moviesContext.Categories.Add(category);
            _moviesContext.SaveChanges();
            ClasificacionPeliculasModel.Category categoryResult = new ClasificacionPeliculasModel.Category
            {
                Name = Name,
                Id = category.Id,
                Result = new ClasificacionPeliculasModel.GeneralResult
                {
                    Result = true
                }
            };
            ViewBag.Resultado = true;
            return View(categoryResult);
        }
        [HttpGet]
        public IActionResult Edit(int id)
        {
            MoviesContext _moviesContext = new MoviesContext();
            Models.Category category = _moviesContext.Categories.FirstOrDefault(s => s.Id == id);
            ClasificacionPeliculasModel.Category categoryResult = new ClasificacionPeliculasModel.Category
            {
                Id = category.Id,
                Name = category.Name,
            };
            return View(categoryResult);
        }
        [HttpPost]
        public IActionResult Edit(int id, string Name)
        {
            MoviesContext _moviesContext = new MoviesContext();
            Models.Category category = _moviesContext.Categories.FirstOrDefault(s => s.Id == id);
            category.Name = Name;
            _moviesContext.Categories.Update(category);
            _moviesContext.SaveChanges();
            ClasificacionPeliculasModel.Category categoryResult = new ClasificacionPeliculasModel.Category
            {
                Name = Name,
                Id = category.Id,
                Result = new ClasificacionPeliculasModel.GeneralResult
                {
                    Result = true
                }
            };
            ViewBag.Resultado = true;
            return View(categoryResult);
        }
        [HttpGet]
        public IActionResult Details(int id)
        {
            MoviesContext _moviesContext = new MoviesContext();
            Models.Category category = _moviesContext.Categories.FirstOrDefault(s => s.Id == id);
            ClasificacionPeliculasModel.Category categoryResult = new ClasificacionPeliculasModel.Category
            {
                Id = category.Id,
                Name = category.Name,
            };
            return View(categoryResult);
        }
    }
}
