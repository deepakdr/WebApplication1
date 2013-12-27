using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class Employee : IPerson
    {
        public string Department { get; set; }

        private string _firstName;

        public Employee()
        {
                
        }

        public int ID { get; set; }

        public Employee(string fn, string ln, int age, string dept, string sx)
        {
            FirstName = fn;
            LastName = ln;
            Age = age;
            Department = dept;
            Sex = sx;
        }

        public Employee(int id, string fn, string ln, int age,  string sx)
        {

            FirstName = fn;
            LastName = ln;
            Age = age;
            ID = id;
            Sex = sx;
        }

        public string FirstName
        {
            get
            {
                return _firstName;
            }
            set
            {
                _firstName = value;
            }

        }

        public string LastName
        {
            get;
            set;
        }

        public int Age
        {
            get;
            set;
        }

        public string Sex
        {
            get;
            set;
        }

    }
}