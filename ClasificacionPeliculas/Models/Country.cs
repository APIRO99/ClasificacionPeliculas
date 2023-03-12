using System;
using System.Collections.Generic;

namespace ClasificacionPeliculas.Models;

public partial class Country
{
    public long Geonameid { get; set; }

    public string Alpha2Code { get; set; } = null!;

    public string Alpha3Code { get; set; } = null!;

    public string Name { get; set; } = null!;

    public string Capital { get; set; } = null!;

    public string? Region { get; set; }

    public string? Subregion { get; set; }

    public long? Population { get; set; }

    public string? Demonym { get; set; }

    public string? NumericCode { get; set; }

    public string? FlagUrl { get; set; }

    public string? Neighbours { get; set; }

    public string Userlastmodified { get; set; } = null!;

    public DateTime Timecreated { get; set; }

    public DateTime? Timemodified { get; set; }

    public virtual ICollection<Region> Regions { get; } = new List<Region>();
}
