using System;
using System.Collections.Generic;

namespace ClasificacionPeliculas.Models;

public partial class Region
{
    public long Geonameid { get; set; }

    public long GeonameidCountry { get; set; }

    public string Name { get; set; } = null!;

    public string? Name2 { get; set; }

    public decimal? Longitude { get; set; }

    public decimal? Latitude { get; set; }

    public virtual ICollection<City> Cities { get; } = new List<City>();

    public virtual Country GeonameidCountryNavigation { get; set; } = null!;
}
