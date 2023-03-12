using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClasificacionPeliculasModel
{
    public class Category
    {        
        public int Id { get; set; }

        [Required(ErrorMessage ="El nombre es requerido")]
        [DisplayName("Nombre")]
        public string Name { get; set; } = null!;
        public GeneralResult Result { get; set; }
    }
}
