//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EduInstitutesApp.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ServiceOrganization
    {
        public int ServiceOrganizationId { get; set; }
        public int ServiceId { get; set; }
        public int OrganizationId { get; set; }
    
        public virtual Organization Organization { get; set; }
        public virtual Service Service { get; set; }
    }
}
