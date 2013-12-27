using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class AjaxSample : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnUpdate1_Click(object sender, EventArgs e)
        {
            Thread.Sleep(3000);
            lbl1.Text = DateTime.Now.ToLongTimeString();
            lbl2.Text = DateTime.Now.ToLongTimeString();
        }
        protected void btnUpdate2_Click(object sender, EventArgs e)
        {
            Thread.Sleep(3000);
            lbl1.Text = DateTime.Now.ToLongTimeString();
            lbl2.Text = DateTime.Now.ToLongTimeString();
        }

        protected void btnWithoutUP_Click(object sender, EventArgs e)
        {
            Thread.Sleep(3000);
            lbl1.Text = DateTime.Now.ToLongTimeString();
            lbl2.Text = DateTime.Now.ToLongTimeString();
            
        }
    }
}