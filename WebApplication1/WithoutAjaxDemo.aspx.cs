using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WithoutAjaxDemo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            //simulate a delay of 3 seconds using thread sleep.
            Thread.Sleep(5000);
            lblDateTime.Text = DateTime.Now.ToLongTimeString();
            //lets say you have a very huge logic, which is time consuming


        }
    }
}