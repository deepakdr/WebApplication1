using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class DataGrid : System.Web.UI.Page
    {
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                 dt = new DataTable();
                dt.Columns.Add(new DataColumn("Id"));
                dt.Columns.Add(new DataColumn("Name"));
                dt.Columns.Add(new DataColumn("Phone"));

                dt.Rows.Add("0", "Deepak", "234234");
                dt.Rows.Add("1", "Sruthi", "464565");
                dt.Rows.Add("2", "Ram", "3453453");

                grdSample.DataSource = dt;
                grdSample.DataBind();

                //storing the data in viewstate because http is stateless and we need to persist the value
                ViewState["dataTable"] = dt;

            }
        }

        protected void lnkSelect_Click(object sender, EventArgs e)
        {
            //get the selected row and get the index of it
            GridViewRow row = (GridViewRow)((LinkButton)sender).NamingContainer;

            string id = (string)grdSample.DataKeys[row.RowIndex].Value;
            
            var selectedRow = ((DataTable)ViewState["dataTable"]).Rows[row.RowIndex];
         //   string id= selectedRow[0].ToString();
            string name = selectedRow[1].ToString();


        }
    }
}