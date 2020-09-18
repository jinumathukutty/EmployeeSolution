using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Employee.Models
{
    public class EmployeeDAL
    {
        string connectionString = "Data Source=TECHIE\\SQLEXPRESS;Initial Catalog=CRUDDB;User ID=sa;Password=vip";

        public IEnumerable<Employee> GetEmployees()
        {
            List<Employee> empList = new List<Employee>();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_GetAllEmployee", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    Employee emp = new Employee();
                    emp.id = Convert.ToInt32(dr["EmployeeID"].ToString());
                    emp.Name = dr["Name"].ToString();
                    emp.Address = dr["Address"].ToString();
                    emp.Salary = Convert.ToInt32(dr["Salary"].ToString());
                    emp.Age = Convert.ToInt32(dr["Age"].ToString());
                    empList.Add(emp);
                }
                con.Close();
            }
            return empList;
        }

        //To insert employee
        public void AddEmployee(Employee emp)
        {
            using(SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_InsertEmployee", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@name", emp.Name);
                cmd.Parameters.AddWithValue("@address", emp.Address);
                cmd.Parameters.AddWithValue("@age", emp.Age);
                cmd.Parameters.AddWithValue("@sal", emp.Salary);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

            }
        }

        //To update employee
        public void UpdateEmployee(Employee emp)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_UpdateEmployee", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@EmpId", emp.id);
                cmd.Parameters.AddWithValue("@name", emp.Name);
                cmd.Parameters.AddWithValue("@address", emp.Address);
                cmd.Parameters.AddWithValue("@age", emp.Age);
                cmd.Parameters.AddWithValue("@sal", emp.Salary);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

            }
        }

        //To Delete employee
        public void DeleteEmployee(int? empId)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_DeleteEmployee", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@EmpId", empId);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

            }
        }

        //Get Employee by ID
        public Employee GetEmployeeById(int? empId)
        {
            Employee emp = new Employee();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_GetEmployeeById", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@EmpId", empId);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    emp.id = Convert.ToInt32(dr["EmployeeID"].ToString());
                    emp.Name = dr["Name"].ToString();
                    emp.Address = dr["Address"].ToString();
                    emp.Salary = Convert.ToInt32(dr["Salary"].ToString());
                    emp.Age = Convert.ToInt32(dr["Age"].ToString());
                }
                con.Close();
            }
            return emp;
        }

        public double AvgSal()
        {
            double _sal = new double();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_AverageSal", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    _sal = Convert.ToDouble(dr["avgsal"].ToString());
                }
                con.Close();
            }
            return _sal;
        }

        public int AvgAge()
        {
            int _age = new int();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_AverageAge", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    _age = Convert.ToInt32(dr["avgage"].ToString());
                }
                con.Close();
            }
            return _age;
        }

    }
}
