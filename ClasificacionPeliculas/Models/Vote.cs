using System;
using System.Collections.Generic;

namespace ClasificacionPeliculas.Models;

public partial class Vote
{
    public int Id { get; set; }

    public int PiId { get; set; }

    public int MoviesId { get; set; }

    public float Rate { get; set; }

    public DateTime RowCreationTime { get; set; }

    public virtual Movie Movies { get; set; } = null!;

    public virtual PersonalInformation Pi { get; set; } = null!;
}
