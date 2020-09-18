using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Employee.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.VisualBasic;

namespace Employee.Controllers
{
    
    public class EmployeeController : Controller
    {
        EmployeeDAL _employeeDAL = new EmployeeDAL();
            
        public IActionResult Index()
        {
            List<Models.Employee> empList = new List<Models.Employee>();
            empList = _employeeDAL.GetEmployees().ToList();

            var _avgsal = _employeeDAL.AvgSal();
            ViewData["avgsal"] = _avgsal;
            var _avgage = _employeeDAL.AvgAge();
            ViewData["avgage"] = _avgage;


            int sal = Convert.ToInt32(TempData["sal"]);
            int age = Convert.ToInt32(TempData["age"]);
            string name = TempData["name"] as string;

            if (!string.IsNullOrEmpty(name))
            {
                if (sal > Convert.ToInt32(_avgsal))
                {
                    ViewData["salMessage"] = name + " is in above average salary";
                }
                else
                {
                    ViewData["salMessage"] = name + " is in below average salary";
                }
                if (age > Convert.ToInt32(_avgage))
                {
                    ViewData["ageMessage"] = name + " is in above average age";
                }
                else
                {
                    ViewData["ageMessage"] = name + " is in below average age";
                }
            }
            return View(empList);
        }
        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create([Bind] Models.Employee employee)
        {
            if (ModelState.IsValid)
            {
                _employeeDAL.AddEmployee(employee);

                TempData["sal"] = employee.Salary;
                TempData["age"] = employee.Age;
                TempData["name"] = employee.Name;

                return RedirectToAction("Index");
            }
            return View(employee);
        }

        public IActionResult Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            Models.Employee emp = _employeeDAL.GetEmployeeById(id);
            if (emp == null)
            {
                return NotFound();
            }
            return View(emp);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(int? id,[Bind] Models.Employee employee)
        {
            if (id == null)
            {
                return NotFound();
            }
            if (ModelState.IsValid)
            {
                _employeeDAL.UpdateEmployee(employee);
                return RedirectToAction("Index");

            }
            return View(_employeeDAL);
        }

        [HttpGet]
        public IActionResult Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            Models.Employee emp = _employeeDAL.GetEmployeeById(id);
            if (emp == null)
            {
                return NotFound();
            }
            return View(emp);
        }

        public IActionResult Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            Models.Employee emp = _employeeDAL.GetEmployeeById(id);
            if (emp == null)
            {
                return NotFound();
            }
            return View(emp);
        }

        [HttpPost,ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public IActionResult DeleteEmp(int? id)
        {
            _employeeDAL.DeleteEmployee(id);
            return RedirectToAction("Index");
        }
    }
}
