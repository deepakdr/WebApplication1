using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class DemoViewState : System.Web.UI.Page
    {
        string name;
        protected void Page_Load(object sender, EventArgs e)
        {
            var isPB = IsPostBack;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            name = txtDemo.Text;
            ViewState["Name"] = name; //key & value
            txtDemo.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            name = (string)ViewState["Name"];
            string storeName = name;
        }
    }
}