using System;
using System.Collections.Generic;

namespace ClasificacionPeliculas.Models;

public partial class Moviescategory
{
    public int Id { get; set; }

    public int MovieId { get; set; }

    public int CategoryId { get; set; }

    public virtual Category Category { get; set; } = null!;

    public virtual Movie Movie { get; set; } = null!;
}
