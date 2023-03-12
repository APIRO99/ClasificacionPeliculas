using System;
using System.Collections.Generic;

namespace ClasificacionPeliculas.Models;

public partial class City
{
    public long Geonameid { get; set; }

    public long GeonameidRegion { get; set; }

    public string Name { get; set; } = null!;

    public decimal? Longitude { get; set; }

    public decimal? Latitude { get; set; }

    public long? Population { get; set; }

    public string Userlastmodified { get; set; } = null!;

    public DateTime Timecreated { get; set; }

    public DateTime? Timemodified { get; set; }

    public virtual Region GeonameidRegionNavigation { get; set; } = null!;

    public virtual ICollection<PersonalInformation> PersonalInformations { get; } = new List<PersonalInformation>();
}
