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
    
    public partial class Campeonato
    {
        public Campeonato()
        {
            this.Equipos_x_Campeonato = new HashSet<Equipos_x_Campeonato>();
        }
    
        public int id { get; set; }
        public Nullable<System.DateTime> fec_inicio { get; set; }
        public Nullable<System.DateTime> fec_fin { get; set; }
        public int cant_equipos { get; set; }
        public int id_dedicado { get; set; }
    
        public virtual Persona Persona { get; set; }
        public virtual ICollection<Equipos_x_Campeonato> Equipos_x_Campeonato { get; set; }
    }
}
