using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class AjaxDemo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool toCheckAJAX = scMgrDemo.IsInAsyncPostBack;
            bool toCheckNormalPostBack = IsPostBack;

            string strSourceElementID = scMgrDemo.AsyncPostBackSourceElementID;


            //IsPostBack==false is equal to !IsPostBack
            if (IsPostBack==false)
            {
                PopulateTextInUP1();
                PopulateTextInUP2();
            }

            if (toCheckAJAX)
            {
                if (strSourceElementID == "btnSubmitUP1")
                {
                    PopulateTextInUP1();
                }
                else if (strSourceElementID == "btnSubmitUP2")
                {
                    PopulateTextInUP2();
                }
            }
        }

        private void PopulateTextInUP2()
        {
           // Thread.Sleep(3000);
            txtDemo.Text = "Hey I am in Update Panel2";
        }

        private void PopulateTextInUP1()
        {
           // Thread.Sleep(2000);
            lblDateTime.Text = "Hey I am there";
        }

        protected void submitClickUP1(object sender, EventArgs e)
        {
            
            //simulate a delay of 3 seconds using thread sleep.
           Thread.Sleep(4000);
            lblDateTime.Text = DateTime.Now.ToLongTimeString();
            lblUP3.Text = DateTime.Now.ToLongTimeString();
           


          //  txtDemo.Text = "I was changed by UP1";
            //upPanel2.Update();

            //lets say you have a very huge logic, which is time consuming
            
            
        }

        protected void submitClickUP2(object sender, EventArgs e)
        {
            txtDemo.Text = "Yipee! I changed";
        }

        protected void ddlFrom_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblUP3.Text = "From DDL";
        }

        protected void btnUP3_Click(object sender, EventArgs e)
        {
            lblUP3.Text = DateTime.Now.ToLongTimeString();
           lblNestedUP4.Text = DateTime.Now.ToLongTimeString(); 
        }

        protected void btnUPNested4_Click(object sender, EventArgs e)
        {
            lblUP3.Text = DateTime.Now.ToLongTimeString();
            lblNestedUP4.Text = DateTime.Now.ToLongTimeString();
        }
    }
}