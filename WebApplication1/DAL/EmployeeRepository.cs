using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplication1.Models;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Text;

namespace WebApplication1.DAL
{
    public class EmployeeRepository
    {
        string connString = ConfigurationManager.ConnectionStrings["LocalDB"].ConnectionString.ToString();
        SqlConnection conn = new SqlConnection(); 

        public void SubmitData(List<Employee> lstemps)
        {


            try
            {

          

            string insertQuery="";

            StringBuilder sbInsertQuery = new StringBuilder();

            foreach (var item in lstemps)
            {
                sbInsertQuery.Append(" insert into dbo.employees values ('");
                sbInsertQuery.Append(item.FirstName);
                sbInsertQuery.Append("','");
                sbInsertQuery.Append(item.LastName);
                sbInsertQuery.Append("','");
                sbInsertQuery.Append(item.Age);
                sbInsertQuery.Append("','");
                sbInsertQuery.Append(item.Sex);
                sbInsertQuery.Append("')");

                string gender;
                if (item.Sex == "Female")
                {
                    gender = "F";
                }
                else
                {
                    gender = "M";
                }


                //the below code will work, but too many string operations and that is not efficient
                 //insertQuery = insertQuery + " insert into dbo.employees values ('"+item.FirstName+"','"+
                 //   item.LastName +"','"+item.Age+','"+item.Sex+"')";
               
                insertQuery = string.Format("insert into dbo.employees values ('{0}','{1}','{2}','{3}')",
                    item.FirstName, item.LastName, item.Age, gender);


                //insertQuery = insertQuery + " insert into dbo.employees values ('"+item.FirstName+"','"+
                //   item.LastName +"','"+item.Age+"','"+item.Sex+"')";


            }

            //to establish and open the connection to the database
            conn.ConnectionString = connString;
            conn.Open();

            //write a sql command to insert the datat
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = sbInsertQuery.ToString();
            cmd.ExecuteScalar();
            conn.Close();
            }
            catch (Exception ex)
            {
                throw;
                //to redirect the user to the error page with the error message in the query string.
            }
        }

        public DataSet GetData()
        {
           
            conn.ConnectionString = connString;
            conn.Open();
            string sqlTextQuery="select * from employees";
            //SqlCommand cmd = new SqlCommand(sqlTextQuery, conn);
            SqlDataAdapter dap = new SqlDataAdapter(sqlTextQuery, conn);

            DataSet dsResults = new DataSet();
            dap.Fill(dsResults);

            
            //var resultReader = cmd.ExecuteReader();
            conn.Close();

            return dsResults;

        }

        public void Update(Employee emp)
        {
            conn.ConnectionString = connString;
            conn.Open();


            string query = string.Format("Update Employees set FirstName='{0}', LastName = '{1}',Age = {2},Sex = '{3}' where Id={4}",emp.FirstName, emp.LastName, emp.Age, emp.Sex, emp.ID );

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.ExecuteScalar();

            conn.Close();
            


        }

        public int GetCount()
        {
            SqlConnection connectCount = new SqlConnection();
            connectCount.ConnectionString = connString;

       
            connectCount.Open();

            string query = "select count(*) from employees";


            SqlCommand cmd = new SqlCommand(query, connectCount);
            var result = cmd.ExecuteScalar();

            int cnt = Convert.ToInt32(result);

            connectCount.Close();


            return cnt;
            //select count(*) from employees
        }
        
        public void Delete(int id)
        {
            conn.ConnectionString = connString;
            conn.Open();

            string query = string.Format("delete employees where id={0}", id);

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.ExecuteScalar();

            conn.Close();


            //delete employees where id=11
        }

    }
}