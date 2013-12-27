using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public interface IPerson
    {
       string FirstName { get; set; }
         string LastName { get; set; }
         int Age { get; set; }
         string Sex { get; set; }

        
       
    }
}