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
    
    public partial class Equipos_x_Campeonato
    {
        public int id { get; set; }
        public int id_equipo { get; set; }
        public int id_campeonato { get; set; }
    
        public virtual Campeonato Campeonato { get; set; }
        public virtual Equipos Equipos { get; set; }
    }
}