using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebApplication1
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            dt.Columns.Add(new DataColumn("FirstName"));
            dt.Columns.Add(new DataColumn("Age"));
            dt.Columns.Add(new DataColumn("Email"));
            ds.Tables.Add(dt);
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            
            
        }
    }
}