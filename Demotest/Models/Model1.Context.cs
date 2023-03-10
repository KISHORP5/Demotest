//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Demotest.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class demotest2023Entities : DbContext
    {
        public demotest2023Entities()
            : base("name=demotest2023Entities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<City> Cities { get; set; }
        public virtual DbSet<Member> Members { get; set; }
        public virtual DbSet<State> States { get; set; }
    
        public virtual int sp_Addmember(string name, string email, string phoneNo, string address, Nullable<int> stateId, Nullable<int> cityId, Nullable<bool> agree)
        {
            var nameParameter = name != null ?
                new ObjectParameter("Name", name) :
                new ObjectParameter("Name", typeof(string));
    
            var emailParameter = email != null ?
                new ObjectParameter("Email", email) :
                new ObjectParameter("Email", typeof(string));
    
            var phoneNoParameter = phoneNo != null ?
                new ObjectParameter("PhoneNo", phoneNo) :
                new ObjectParameter("PhoneNo", typeof(string));
    
            var addressParameter = address != null ?
                new ObjectParameter("Address", address) :
                new ObjectParameter("Address", typeof(string));
    
            var stateIdParameter = stateId.HasValue ?
                new ObjectParameter("StateId", stateId) :
                new ObjectParameter("StateId", typeof(int));
    
            var cityIdParameter = cityId.HasValue ?
                new ObjectParameter("CityId", cityId) :
                new ObjectParameter("CityId", typeof(int));
    
            var agreeParameter = agree.HasValue ?
                new ObjectParameter("Agree", agree) :
                new ObjectParameter("Agree", typeof(bool));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Addmember", nameParameter, emailParameter, phoneNoParameter, addressParameter, stateIdParameter, cityIdParameter, agreeParameter);
        }
    
        public virtual int sp_Deleteemember(Nullable<int> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("Id", id) :
                new ObjectParameter("Id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Deleteemember", idParameter);
        }
    
        public virtual ObjectResult<sp_GetaLLemembers_Result> sp_GetaLLemembers()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_GetaLLemembers_Result>("sp_GetaLLemembers");
        }
    
        public virtual ObjectResult<sp_GetememberById_Result> sp_GetememberById(Nullable<int> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("Id", id) :
                new ObjectParameter("Id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_GetememberById_Result>("sp_GetememberById", idParameter);
        }
    
        public virtual int sp_Updatemember(Nullable<int> id, string name, string email, string phoneNo, string address, Nullable<int> stateId, Nullable<int> cityId, Nullable<bool> agree)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("Id", id) :
                new ObjectParameter("Id", typeof(int));
    
            var nameParameter = name != null ?
                new ObjectParameter("Name", name) :
                new ObjectParameter("Name", typeof(string));
    
            var emailParameter = email != null ?
                new ObjectParameter("Email", email) :
                new ObjectParameter("Email", typeof(string));
    
            var phoneNoParameter = phoneNo != null ?
                new ObjectParameter("PhoneNo", phoneNo) :
                new ObjectParameter("PhoneNo", typeof(string));
    
            var addressParameter = address != null ?
                new ObjectParameter("Address", address) :
                new ObjectParameter("Address", typeof(string));
    
            var stateIdParameter = stateId.HasValue ?
                new ObjectParameter("StateId", stateId) :
                new ObjectParameter("StateId", typeof(int));
    
            var cityIdParameter = cityId.HasValue ?
                new ObjectParameter("CityId", cityId) :
                new ObjectParameter("CityId", typeof(int));
    
            var agreeParameter = agree.HasValue ?
                new ObjectParameter("Agree", agree) :
                new ObjectParameter("Agree", typeof(bool));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Updatemember", idParameter, nameParameter, emailParameter, phoneNoParameter, addressParameter, stateIdParameter, cityIdParameter, agreeParameter);
        }
    }
}
