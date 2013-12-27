using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public static class Employees
    {
        static List<Employee> lstEmployees = new List<Employee>();
        public static void AddEmployee(Employee emp)
        {

            lstEmployees.Add(emp);
        }



        public static List<Employee> GetAllEmployees()
        {
            return lstEmployees;
        }
    }
}