using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.DAL;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class DeeHome : System.Web.UI.Page
    {
        EmployeeRepository empRepo = new EmployeeRepository();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    btnSubmit.Click += btnSubmit_Click;    
            //}
            
            //empRepo.GetData();r


            //non efficient
            string samplestr = "Hello";
            samplestr = samplestr + "World";


            //efficient 
            StringBuilder sb = new StringBuilder();
            sb.Append("Hello");
            sb.Append("World");
            sb.Remove(5, 5);
            string result = sb.ToString();


         

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            try
            {

                int age = 0;

                //txtAge.Text - s32
                var isConversionSuccess = int.TryParse(txtAge.Text, out age);

                var sx= rbM.Checked ? "Male" : "Female";
               // throw new DeeException();
                Employee emp = new Employee(txtFName.Text, txtName.Text, age, "ISG", sx );

            

                var something = (IPerson)emp;

                Employees.AddEmployee(emp);
               // btnSubmit.Click -= btnSubmit_Click;
            }
            catch (Exception ex)
            {
               
                lblError.Text = "Oops! Something went wrong!";
                lblError.Visible = true;
            }
            




        }
        private void PopulateCountryDetails(string country)
        {
            
            string path = Server.MapPath("~/Country.xml");
            DataTable dt = new DataTable("rootStateIndividual");

            //Add Columns in datatable - Column names must match XML File nodes 
            dt.Columns.Add("State", typeof(System.String));
            dt.Columns.Add("Capital", typeof(System.String));


            // Reading the XML file and display data in the gridview         
            dt.ReadXml(path);


            DataTable dtState = new DataTable("rootStateIndividual");
            //Add Columns in datatable - Column names must match XML File nodes 
            dtState.Columns.Add("State", typeof(System.String));

            // Reading the XML file and display data in the dropdown list box
            dtState.ReadXml(path);

            // Create a DataView on DataTable & pass the column name to check for duplicates as array into table method of DataView.
            DataView dView = new DataView(dtState);
            string[] arrColumns = { "State" };
            ddlState.DataSource = dView.ToTable(true, arrColumns);
            ddlState.DataValueField = "State";
            ddlState.DataBind();
            dt.Columns["State"].ColumnName = "State";
            dt.Columns["Capital"].ColumnName = "Capital";





        }

       

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                if (!String.IsNullOrEmpty(ddlCountry.SelectedValue))
                {
                    PopulateCountryDetails(ddlCountry.SelectedValue);
                }
            }
        }

        protected void UpdateDBButtonClick(object sender, EventArgs e)
        {
            try
            {
                empRepo.SubmitData(Employees.GetAllEmployees());
            }
            catch (Exception ex)
            {
                Response.Redirect("http://localhost:64081/ErrorPage.aspx");
            }



        }
    }
    public class StateData
    {
        public string State;
        public string Capital;
        public string Description;

    }
}