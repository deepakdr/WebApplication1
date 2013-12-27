using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;


namespace WebApplication1
{
    public partial class SampleDGV : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                string connString = ConfigurationManager.ConnectionStrings["LocalDB"].ConnectionString.ToString();
                SqlConnection conn = new SqlConnection(connString);
                conn.Open();
                string sqlTextQuery = "select * from employees";
                SqlCommand cmd = new SqlCommand(sqlTextQuery, conn);
                SqlDataAdapter dap = new SqlDataAdapter(sqlTextQuery, conn);

                DataSet dsResults = new DataSet();
                dap.Fill(dsResults);

                grdSample.DataSource = dsResults;
                grdSample.DataBind();
                //var resultReader = cmd.ExecuteReader();
                conn.Close();


                //DataSet ds = new DataSet();
                //DataTable dt = new DataTable();
                //dt.Columns.Add(new DataColumn("Name"));
                //dt.Columns.Add(new DataColumn("Department"));
                //dt.Columns.Add(new DataColumn("DOJ"));

                //dt.Rows.Add("Ghousia", "R&D", "25-04-12");
                //dt.Rows.Add("Dee", "R&D", "25-04-12");
                //dt.Rows.Add("Ram", "R&D", "25-04-12");
                //dt.Rows.Add("Faisel", "R&D", "25-04-12");

                //ds.Tables.Add(dt);

                //grdSample.DataSource = ds;
                //grdSample.DataBind();
            }
        }
    }
}