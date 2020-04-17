//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class Persona
    {
        public Persona()
        {
            this.Campeonatos = new HashSet<Campeonato>();
            this.Equipos = new HashSet<Equipos>();
            this.Jugadores = new HashSet<Jugadore>();
            this.Usuarios = new HashSet<Usuario>();
        }
    
        public int id { get; set; }
        public string nombre { get; set; }
        public string ape1 { get; set; }
        public string ape2 { get; set; }
        public string correo { get; set; }
        public string num_identificacion { get; set; }
        public string tipo_identificacion { get; set; }
        public string genero { get; set; }
        public int telefono_principal { get; set; }
        public Nullable<int> telefono_secundario { get; set; }
        public string direccion_fisica { get; set; }
        public Nullable<System.DateTime> fec_nacimiento { get; set; }
        public int id_distrito { get; set; }
    
        public virtual ICollection<Campeonato> Campeonatos { get; set; }
        public virtual Distrito Distrito { get; set; }
        public virtual ICollection<Equipos> Equipos { get; set; }
        public virtual ICollection<Jugadore> Jugadores { get; set; }
        public virtual ICollection<Usuario> Usuarios { get; set; }
    }
}
