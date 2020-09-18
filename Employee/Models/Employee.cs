using Microsoft.AspNetCore.Authentication;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Employee.Models
{
    public class Employee
    {
        public int id { get; set; }
        [Required]
        public string Name { get; set; }
        public string Address { get; set; }
        [Required]
        public int Age { get; set; }
        [Required]
        public int Salary { get; set; }


    }

    public class AverageDetails
    {
        public int Age { get; set; }
        public int Salary { get; set; }
    }
}
