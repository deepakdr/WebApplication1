using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.DAL;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class DetailsPage : System.Web.UI.Page
    {
        DataSet dsResults = new DataSet();
        EmployeeRepository empRepo = new EmployeeRepository();


        protected void Page_Load(object sender, EventArgs e)
        {

            string s = Request.QueryString["MyParameter"];
            //if it is a fresh load
            if (!IsPostBack)
            {
                //call PopulateGridWithData
               // PopulateGridWithData();
            }
        }

        protected void btnPopulateGrid_Click(object sender, EventArgs e)
        {
            PopulateGridWithData();

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            dsResults = (DataSet)ViewState["dsResults"];
            //grdDetailsView.DataSource = dsResults;
            //grdDetailsView.DataBind();
        }

        private void PopulateGridWithData()
        {
            /*call the repository, which is our DAL(Data Access Layer)
             * and get the data from the database
             * store this dataset in viewstate for future reference to avoid un-necessary database calls
             * 
             * */

            Thread.Sleep(3000);
            dsResults = empRepo.GetData();
            ViewState["dsResults"] = dsResults;


            //Uncomment this code if you are trying to use datagrid.
            //grdDetailsView.DataSource = dsResults;
            //grdDetailsView.DataBind();

            grdViewDetails.DataSource = dsResults;
            grdViewDetails.DataBind();



        }

        #region Old DataGirdCode
        protected void grdDetailsView_SortCommand(object source, DataGridSortCommandEventArgs e)
        {
            //assiging the sort expression to a local variable
            var sortExpression = e.SortExpression;

            //get the dataset from the viewstate
            dsResults = (DataSet)ViewState["dsResults"];

            //sort expressions using Select method of Table
            //firstNameasc is not what we want
            //firstName asc is what WE WANT
            var resultOfSort = dsResults.Tables[0].Select("", sortExpression + " asc");

            //create a new dataset to store the sorted result
            DataSet dsSortedResult = new DataSet();

            //create a clone of the existing datatable so that we can preserve
            //the column names and types
            DataTable dt = dsResults.Tables[0].Clone();

            //iterate thru the RowArray which is sorted and add it to the new
            //datatable created
            foreach (var item in resultOfSort)
            {
                dt.Rows.Add(item[0], item[1], item[2], item[3], item[4]);
            }

            //add the new datatable into the new dataset
            dsSortedResult.Tables.Add(dt);

            //bind it to the grid
            grdDetailsView.DataSource = dsSortedResult;
            grdDetailsView.DataBind();

        }
        #endregion

        #region GridView Events
        protected void GridViewRowEditingEvent(object sender, GridViewEditEventArgs e)
        {
            //enable the grid for editing, the edit index is available in the event args parameter 'e'
            grdViewDetails.EditIndex = e.NewEditIndex;

            PopulateGridWithData();

        }

        protected void GridViewCancelEditEvent(object sender, GridViewCancelEditEventArgs e)
        {
            
            grdViewDetails.EditIndex = -1;
            PopulateGridWithData();
        }

        protected void GridViewUpdateEditEvent(object sender, GridViewUpdateEventArgs e)
        {

            string fn;
            string ln;
            int age;
            string gender;
            int id;

            id = Convert.ToInt32(grdViewDetails.Rows[e.RowIndex].Cells[0].Text);
            fn = (string)e.NewValues[0];
            ln = (string)e.NewValues[1];
            age = Convert.ToInt32(e.NewValues[2]);


            gender = ((DropDownList)grdViewDetails.Rows[e.RowIndex].Cells[4].Controls[1]).SelectedValue;



            Employee employee = new Employee(id, fn, ln, age, gender);

            empRepo.Update(employee);


            grdViewDetails.EditIndex = -1;

            PopulateGridWithData();
        }

        protected void GridViewDeleting(object sender, GridViewDeleteEventArgs e)
        {

            string id = grdViewDetails.Rows[e.RowIndex].Cells[0].Text;

            empRepo.Delete(Convert.ToInt32(id));

            PopulateGridWithData();

        }

        protected void GridViewRowDataBound(object sender, GridViewRowEventArgs e)
        {


            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                if ((e.Row.RowState & DataControlRowState.Edit)>0)
                {
                    DataTable dt = new DataTable();
                    dt.Columns.Add("OptionValue");
                    dt.Columns.Add("OptionText");

                    dt.Rows.Add("M", "Male");
                    dt.Rows.Add("F", "Female");
                    var genderData = ((System.Data.DataRowView)(e.Row.DataItem)).Row.ItemArray[4].ToString();

                    var ddl = ((DropDownList)e.Row.Cells[4].Controls[1]);
                    ddl.DataTextField = "OptionText";
                    ddl.DataValueField = "OptionValue";

                    ddl.DataSource = dt;
                    ddl.DataBind();
                    ddl.SelectedValue = genderData;

                    
                }
                //to ensure that only datarow is being affected
                if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
                {

                    ((ImageButton)e.Row.Cells[6].Controls[0]).Attributes["onclick"] = "if(!confirm('Are you certain you want to delete this person ?')) return false;";
                }
            }

        }

        protected void GridViewSortingEvent(object sender, GridViewSortEventArgs e)
        {
            //assiging the sort expression to a local variable
            var sortExpression = e.SortExpression;

            //get the dataset from the viewstate
            PopulateDatasetFromViewState();

            //sort expressions using Select method of Table
            //firstNameasc is not what we want
            //firstName asc is what WE WANT
            var resultOfSort = dsResults.Tables[0].Select("", sortExpression + " asc");

            //create a new dataset to store the sorted result
            DataSet dsSortedResult = new DataSet();

            //create a clone of the existing datatable so that we can preserve
            //the column names and types
            DataTable dt = dsResults.Tables[0].Clone();

            //iterate thru the RowArray which is sorted and add it to the new
            //datatable created
            foreach (var item in resultOfSort)
            {
                dt.Rows.Add(item[0], item[1], item[2], item[3], item[4]);
            }

            //add the new datatable into the new dataset
            dsSortedResult.Tables.Add(dt);

            ViewState["dsResults"] = dsSortedResult;

            //bind it to the grid
            grdViewDetails.DataSource = dsSortedResult;
            grdViewDetails.DataBind();
        }

        protected void GridViewPaginationEvent(object sender, GridViewPageEventArgs e)
        {
            grdViewDetails.PageIndex = e.NewPageIndex;
            PopulateDatasetFromViewState();

            grdViewDetails.DataSource = dsResults;


            grdViewDetails.DataBind();
        }

        #endregion GridView Events

        public void PopulateDatasetFromViewState()
        {
            dsResults = (DataSet)ViewState["dsResults"];
        }

        protected void btnRefreshGrid_Click(object sender, EventArgs e)
        {
            PopulateGridWithData();
        }

        protected void tmrCount_Tick(object sender, EventArgs e)
        {
         //Get the count of records which are available in employees and display
            //that in a label
            //19
            //20
            string newCount = empRepo.GetCount().ToString();
            if (!string.IsNullOrEmpty(lblCount.Text))
            {

                if (lblCount.Text == newCount)
                {
                    lblCount.ForeColor = Color.Black;
                    lblCount.Font.Bold = false;
                }
                else
                {
                    lblCount.ForeColor = Color.Red;
                    lblCount.Font.Bold = true;
                }
            }


            lblCount.Text = empRepo.GetCount().ToString();
      

            lblLastUpdate.Text = "Last Update Time: " +DateTime.Now.ToLongTimeString();



        }




    }
}