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
    
    public partial class Distrito
    {
        public Distrito()
        {
            this.Equipos = new HashSet<Equipos>();
            this.Personas = new HashSet<Persona>();
        }
    
        public int id_distrito { get; set; }
        public string nombre { get; set; }
        public string usuario_creacion { get; set; }
        public System.DateTime fecha_creacion { get; set; }
        public string usuario_modificacion { get; set; }
        public Nullable<System.DateTime> fecha_ult_mod { get; set; }
        public string vc_estado { get; set; }
        public int id_distrito_inec { get; set; }
        public int id_canton { get; set; }
    
        public virtual Cantone Cantone { get; set; }
        public virtual Cantone Cantone1 { get; set; }
        public virtual ICollection<Equipos> Equipos { get; set; }
        public virtual ICollection<Persona> Personas { get; set; }
    }
}
