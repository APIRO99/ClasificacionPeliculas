using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClasificacionPeliculasModel
{
    public class Moviescategory
    {
        public int Id { get; set; }
        public string? MovieName { get; set; }
        public string? CategoryName { get; set; }
        public int? CategoryId { get; set; }
        public int? MovieId { get; set; }
        public List<SelectListItem>? Movies { get; set; }
        public List<SelectListItem>? Categories { get; set; }
        public Movie Movie { get; set; }      
    }
}
