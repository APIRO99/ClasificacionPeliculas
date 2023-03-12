using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace ClasificacionPeliculas.Models;

public partial class MoviesContext : DbContext
{
    public MoviesContext()
    {
    }

    public MoviesContext(DbContextOptions<MoviesContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Category> Categories { get; set; }

    public virtual DbSet<City> Cities { get; set; }

    public virtual DbSet<Country> Countries { get; set; }

    public virtual DbSet<Movie> Movies { get; set; }

    public virtual DbSet<Moviescategory> Moviescategories { get; set; }

    public virtual DbSet<PersonalInformation> PersonalInformations { get; set; }

    public virtual DbSet<Region> Regions { get; set; }

    public virtual DbSet<Vote> Votes { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseMySQL("server=127.0.0.1;userid=Peliculas;password='jskadhf;oiaseufpoaiwsf@';database=movies;TreatTinyAsBoolean=False");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Category>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.ToTable("categories");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .HasColumnName("name");
        });

        modelBuilder.Entity<City>(entity =>
        {
            entity.HasKey(e => e.Geonameid).HasName("PRIMARY");

            entity.ToTable("city");

            entity.HasIndex(e => e.GeonameidRegion, "FK_GEONAMEIDREGION_WCITY_W_REGION");

            entity.HasIndex(e => new { e.Geonameid, e.GeonameidRegion }, "UK_GEONAMEID_GEONAMEIDREGION_W_CITY").IsUnique();

            entity.Property(e => e.Geonameid).HasColumnName("geonameid");
            entity.Property(e => e.GeonameidRegion).HasColumnName("geonameidRegion");
            entity.Property(e => e.Latitude)
                .HasPrecision(15, 8)
                .HasColumnName("latitude");
            entity.Property(e => e.Longitude)
                .HasPrecision(15, 8)
                .HasColumnName("longitude");
            entity.Property(e => e.Name)
                .HasMaxLength(64)
                .HasColumnName("name");
            entity.Property(e => e.Population).HasColumnName("population");
            entity.Property(e => e.Timecreated)
                .HasColumnType("datetime")
                .HasColumnName("timecreated");
            entity.Property(e => e.Timemodified)
                .HasColumnType("datetime")
                .HasColumnName("timemodified");
            entity.Property(e => e.Userlastmodified)
                .HasMaxLength(32)
                .HasColumnName("userlastmodified");

            entity.HasOne(d => d.GeonameidRegionNavigation).WithMany(p => p.Cities)
                .HasForeignKey(d => d.GeonameidRegion)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_GEONAMEIDREGION_WCITY_W_REGION");
        });

        modelBuilder.Entity<Country>(entity =>
        {
            entity.HasKey(e => e.Geonameid).HasName("PRIMARY");

            entity.ToTable("country");

            entity.HasIndex(e => e.Alpha2Code, "UK_ALPHA2CODE_W_COUNTRY").IsUnique();

            entity.HasIndex(e => e.Alpha3Code, "UK_ALPHA3CODE_W_COUNTRY").IsUnique();

            entity.HasIndex(e => e.Name, "UK_NAME_W_COUNTRY").IsUnique();

            entity.Property(e => e.Geonameid).HasColumnName("geonameid");
            entity.Property(e => e.Alpha2Code)
                .HasMaxLength(2)
                .IsFixedLength()
                .HasColumnName("alpha2Code");
            entity.Property(e => e.Alpha3Code)
                .HasMaxLength(3)
                .IsFixedLength()
                .HasColumnName("alpha3Code");
            entity.Property(e => e.Capital)
                .HasMaxLength(64)
                .HasColumnName("capital");
            entity.Property(e => e.Demonym)
                .HasMaxLength(64)
                .HasColumnName("demonym");
            entity.Property(e => e.FlagUrl)
                .HasColumnType("text")
                .HasColumnName("flag_url");
            entity.Property(e => e.Name)
                .HasMaxLength(64)
                .HasColumnName("name");
            entity.Property(e => e.Neighbours)
                .HasColumnType("text")
                .HasColumnName("neighbours");
            entity.Property(e => e.NumericCode)
                .HasMaxLength(15)
                .HasColumnName("numericCode");
            entity.Property(e => e.Population).HasColumnName("population");
            entity.Property(e => e.Region)
                .HasMaxLength(32)
                .HasColumnName("region");
            entity.Property(e => e.Subregion)
                .HasMaxLength(64)
                .HasColumnName("subregion");
            entity.Property(e => e.Timecreated)
                .HasColumnType("datetime")
                .HasColumnName("timecreated");
            entity.Property(e => e.Timemodified)
                .HasColumnType("datetime")
                .HasColumnName("timemodified");
            entity.Property(e => e.Userlastmodified)
                .HasMaxLength(32)
                .HasColumnName("userlastmodified");
        });

        modelBuilder.Entity<Movie>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.ToTable("movies");

            entity.HasIndex(e => e.ImdbId, "imdb_id").IsUnique();

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Actors)
                .HasColumnType("text")
                .HasColumnName("actors");
            entity.Property(e => e.Director)
                .HasMaxLength(255)
                .HasColumnName("director");
            entity.Property(e => e.Duration).HasColumnName("duration");
            entity.Property(e => e.ImdbId)
                .HasMaxLength(10)
                .HasColumnName("imdb_id");
            entity.Property(e => e.Plot)
                .HasColumnType("text")
                .HasColumnName("plot");
            entity.Property(e => e.PosterUrl)
                .HasMaxLength(255)
                .HasColumnName("poster_url");
            entity.Property(e => e.Rating)
                .HasPrecision(3, 1)
                .HasColumnName("rating");
            entity.Property(e => e.ReleaseDate)
                .HasColumnType("date")
                .HasColumnName("release_date");
            entity.Property(e => e.Title)
                .HasMaxLength(255)
                .HasColumnName("title");
            entity.Property(e => e.Votes).HasColumnName("votes");
        });

        modelBuilder.Entity<Moviescategory>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.ToTable("moviescategories");

            entity.HasIndex(e => e.CategoryId, "category_id");

            entity.HasIndex(e => e.MovieId, "movie_id");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.CategoryId).HasColumnName("category_id");
            entity.Property(e => e.MovieId).HasColumnName("movie_id");

            entity.HasOne(d => d.Category).WithMany(p => p.Moviescategories)
                .HasForeignKey(d => d.CategoryId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("moviescategories_ibfk_2");

            entity.HasOne(d => d.Movie).WithMany(p => p.Moviescategories)
                .HasForeignKey(d => d.MovieId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("moviescategories_ibfk_1");
        });

        modelBuilder.Entity<PersonalInformation>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.ToTable("personal_information");

            entity.HasIndex(e => e.GeonameidCity, "FK_GEONAMEIDCITY_WCITY_personal_information");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Address)
                .HasMaxLength(255)
                .HasColumnName("address");
            entity.Property(e => e.DateOfBirth)
                .HasColumnType("date")
                .HasColumnName("date_of_birth");
            entity.Property(e => e.Email)
                .HasMaxLength(255)
                .HasColumnName("email");
            entity.Property(e => e.GeonameidCity).HasColumnName("geonameidCity");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .HasColumnName("name");
            entity.Property(e => e.PhoneNumber)
                .HasMaxLength(20)
                .HasColumnName("phone_number");

            entity.HasOne(d => d.GeonameidCityNavigation).WithMany(p => p.PersonalInformations)
                .HasForeignKey(d => d.GeonameidCity)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_GEONAMEIDCITY_WCITY_personal_information");
        });

        modelBuilder.Entity<Region>(entity =>
        {
            entity.HasKey(e => e.Geonameid).HasName("PRIMARY");

            entity.ToTable("region");

            entity.HasIndex(e => e.GeonameidCountry, "FK_GEONAMEIDCOUNTRY_W_REGION_W_COUNTRY");

            entity.HasIndex(e => new { e.Geonameid, e.GeonameidCountry }, "UK_GEONAMEID_GEONAMEIDCOUNTRY_W_REGION").IsUnique();

            entity.Property(e => e.Geonameid).HasColumnName("geonameid");
            entity.Property(e => e.GeonameidCountry).HasColumnName("geonameidCountry");
            entity.Property(e => e.Latitude)
                .HasPrecision(15, 8)
                .HasColumnName("latitude");
            entity.Property(e => e.Longitude)
                .HasPrecision(15, 8)
                .HasColumnName("longitude");
            entity.Property(e => e.Name)
                .HasMaxLength(128)
                .HasColumnName("name");
            entity.Property(e => e.Name2)
                .HasMaxLength(128)
                .HasColumnName("name2");

            entity.HasOne(d => d.GeonameidCountryNavigation).WithMany(p => p.Regions)
                .HasForeignKey(d => d.GeonameidCountry)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_GEONAMEIDCOUNTRY_W_REGION_W_COUNTRY");
        });

        modelBuilder.Entity<Vote>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.ToTable("votes");

            entity.HasIndex(e => e.PiId, "FK_PI_VOTES");

            entity.HasIndex(e => e.MoviesId, "FK_movies_votes");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.MoviesId).HasColumnName("movies_id");
            entity.Property(e => e.PiId).HasColumnName("pi_id");
            entity.Property(e => e.RowCreationTime)
                .HasColumnType("datetime")
                .HasColumnName("row_creation_time");
            entity.Property(e => e.Rate)
                .HasPrecision(4, 2)
                .HasColumnName("rate");

            entity.HasOne(d => d.Movies).WithMany(p => p.VotesNavigation)
                .HasForeignKey(d => d.MoviesId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_movies_votes");

            entity.HasOne(d => d.Pi).WithMany(p => p.Votes)
                .HasForeignKey(d => d.PiId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PI_VOTES");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
