//------------------------------------------------------------------------------
// <auto-generated>
//    Este código se generó a partir de una plantilla.
//
//    Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//    Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Proyecto.Modelos
{
    using System;
    using System.Collections.Generic;
    
    public partial class Jugadore
    {
        public Jugadore()
        {
            this.Eventos_x_Partido = new HashSet<Eventos_x_Partido>();
            this.Campeonatos = new HashSet<Campeonato>();
        }
    
        public int id { get; set; }
        public int id_persona { get; set; }
        public int id_equipo { get; set; }
        public int id_posicion { get; set; }
    
        public virtual Equipos Equipos { get; set; }
        public virtual ICollection<Eventos_x_Partido> Eventos_x_Partido { get; set; }
        public virtual Persona Persona { get; set; }
        public virtual Posicione Posicione { get; set; }
        public virtual ICollection<Campeonato> Campeonatos { get; set; }
    }
}
