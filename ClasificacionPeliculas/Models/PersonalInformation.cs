using System;
using System.Collections.Generic;

namespace ClasificacionPeliculas.Models;

public partial class PersonalInformation
{
    public int Id { get; set; }

    public long GeonameidCity { get; set; }

    public string Name { get; set; } = null!;

    public DateTime DateOfBirth { get; set; }

    public string Email { get; set; } = null!;

    public string PhoneNumber { get; set; } = null!;

    public string? Address { get; set; }

    public virtual City GeonameidCityNavigation { get; set; } = null!;

    public virtual ICollection<Vote> Votes { get; } = new List<Vote>();
}
