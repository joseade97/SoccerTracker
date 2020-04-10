﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Proyecto.Modelos
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Objects;
    using System.Data.Objects.DataClasses;
    using System.Linq;
    
    public partial class ProyectoBD : DbContext
    {
        public ProyectoBD()
            : base("name=ProyectoBD")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Campeonato> Campeonatos { get; set; }
        public DbSet<Cantone> Cantones { get; set; }
        public DbSet<Distrito> Distritos { get; set; }
        public DbSet<Equipos> Equipos { get; set; }
        public DbSet<Equipos_x_Campeonato> Equipos_x_Campeonato { get; set; }
        public DbSet<Evento> Eventos { get; set; }
        public DbSet<Eventos_x_Partido> Eventos_x_Partido { get; set; }
        public DbSet<Jugadore> Jugadores { get; set; }
        public DbSet<Partido> Partidos { get; set; }
        public DbSet<Persona> Personas { get; set; }
        public DbSet<Posicione> Posiciones { get; set; }
        public DbSet<Provincia> Provincias { get; set; }
        public DbSet<Usuario> Usuarios { get; set; }
    
        public virtual int sp_EliminaCanton(Nullable<int> id_canton)
        {
            var id_cantonParameter = id_canton.HasValue ?
                new ObjectParameter("id_canton", id_canton) :
                new ObjectParameter("id_canton", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_EliminaCanton", id_cantonParameter);
        }
    
        public virtual int sp_InsertaCanton(Nullable<int> id_provincia, string nombre, Nullable<int> id_canton_inec)
        {
            var id_provinciaParameter = id_provincia.HasValue ?
                new ObjectParameter("id_provincia", id_provincia) :
                new ObjectParameter("id_provincia", typeof(int));
    
            var nombreParameter = nombre != null ?
                new ObjectParameter("nombre", nombre) :
                new ObjectParameter("nombre", typeof(string));
    
            var id_canton_inecParameter = id_canton_inec.HasValue ?
                new ObjectParameter("id_canton_inec", id_canton_inec) :
                new ObjectParameter("id_canton_inec", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_InsertaCanton", id_provinciaParameter, nombreParameter, id_canton_inecParameter);
        }
    
        public virtual int sp_ModificaCanton(Nullable<int> id_canton, Nullable<int> id_provincia, string nombre, Nullable<int> id_canton_inec)
        {
            var id_cantonParameter = id_canton.HasValue ?
                new ObjectParameter("id_canton", id_canton) :
                new ObjectParameter("id_canton", typeof(int));
    
            var id_provinciaParameter = id_provincia.HasValue ?
                new ObjectParameter("id_provincia", id_provincia) :
                new ObjectParameter("id_provincia", typeof(int));
    
            var nombreParameter = nombre != null ?
                new ObjectParameter("nombre", nombre) :
                new ObjectParameter("nombre", typeof(string));
    
            var id_canton_inecParameter = id_canton_inec.HasValue ?
                new ObjectParameter("id_canton_inec", id_canton_inec) :
                new ObjectParameter("id_canton_inec", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_ModificaCanton", id_cantonParameter, id_provinciaParameter, nombreParameter, id_canton_inecParameter);
        }
    
        public virtual ObjectResult<sp_RetornaCantones_Result> sp_RetornaCantones(string nombre, Nullable<int> id_provincia)
        {
            var nombreParameter = nombre != null ?
                new ObjectParameter("nombre", nombre) :
                new ObjectParameter("nombre", typeof(string));
    
            var id_provinciaParameter = id_provincia.HasValue ?
                new ObjectParameter("id_provincia", id_provincia) :
                new ObjectParameter("id_provincia", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_RetornaCantones_Result>("sp_RetornaCantones", nombreParameter, id_provinciaParameter);
        }
    
        public virtual ObjectResult<sp_RetornaCantonesid_canton_Result> sp_RetornaCantonesid_canton(Nullable<int> id_canton)
        {
            var id_cantonParameter = id_canton.HasValue ?
                new ObjectParameter("id_canton", id_canton) :
                new ObjectParameter("id_canton", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_RetornaCantonesid_canton_Result>("sp_RetornaCantonesid_canton", id_cantonParameter);
        }
    
        public virtual ObjectResult<sp_RetornaDistritos_Result> sp_RetornaDistritos(string nombre, Nullable<int> id_canton)
        {
            var nombreParameter = nombre != null ?
                new ObjectParameter("nombre", nombre) :
                new ObjectParameter("nombre", typeof(string));
    
            var id_cantonParameter = id_canton.HasValue ?
                new ObjectParameter("id_canton", id_canton) :
                new ObjectParameter("id_canton", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_RetornaDistritos_Result>("sp_RetornaDistritos", nombreParameter, id_cantonParameter);
        }
    
        public virtual ObjectResult<sp_RetornaProvincias_Result> sp_RetornaProvincias(string nombre, Nullable<int> id_provincia)
        {
            var nombreParameter = nombre != null ?
                new ObjectParameter("nombre", nombre) :
                new ObjectParameter("nombre", typeof(string));
    
            var id_provinciaParameter = id_provincia.HasValue ?
                new ObjectParameter("id_provincia", id_provincia) :
                new ObjectParameter("id_provincia", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_RetornaProvincias_Result>("sp_RetornaProvincias", nombreParameter, id_provinciaParameter);
        }
    
        public virtual ObjectResult<sp_RetornaUsuario_Result> sp_RetornaUsuario(string nombre_usuario, Nullable<int> id_Usuario)
        {
            var nombre_usuarioParameter = nombre_usuario != null ?
                new ObjectParameter("nombre_usuario", nombre_usuario) :
                new ObjectParameter("nombre_usuario", typeof(string));
    
            var id_UsuarioParameter = id_Usuario.HasValue ?
                new ObjectParameter("id_Usuario", id_Usuario) :
                new ObjectParameter("id_Usuario", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_RetornaUsuario_Result>("sp_RetornaUsuario", nombre_usuarioParameter, id_UsuarioParameter);
        }
    
        public virtual ObjectResult<sp_RetornaUsuarioID_Result> sp_RetornaUsuarioID(Nullable<int> id_usuario)
        {
            var id_usuarioParameter = id_usuario.HasValue ?
                new ObjectParameter("id_usuario", id_usuario) :
                new ObjectParameter("id_usuario", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_RetornaUsuarioID_Result>("sp_RetornaUsuarioID", id_usuarioParameter);
        }
    
        public virtual ObjectResult<sp_RetornaUsuarioNombrePwd_Result> sp_RetornaUsuarioNombrePwd(string nombre_usuario, string contrasena)
        {
            var nombre_usuarioParameter = nombre_usuario != null ?
                new ObjectParameter("nombre_usuario", nombre_usuario) :
                new ObjectParameter("nombre_usuario", typeof(string));
    
            var contrasenaParameter = contrasena != null ?
                new ObjectParameter("contrasena", contrasena) :
                new ObjectParameter("contrasena", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_RetornaUsuarioNombrePwd_Result>("sp_RetornaUsuarioNombrePwd", nombre_usuarioParameter, contrasenaParameter);
        }
    }
}