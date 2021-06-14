using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using IBUSMedicalv2.DAL;

namespace IBUSMedicalv2
{
    public partial class SuperUserPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Load_Grid_Staff(object sender, EventArgs e)
        {
            DataTable DT = new DataTable();
            IBUSMedicalDAL objDAL = new IBUSMedicalDAL();
            objDAL.GetStaffForStaffLogin(ref DT);
            ItemGrid.DataSource = objDAL.GetPersonForStaffLogin(ref DT);//seting data source for this Grid
            ItemGrid.DataBind(); //bind the data source to this grid
        }

        protected void SelectTableNameForDisplay(object sender, EventArgs e)
        {
            string tableName = SelectDatabaseTables.SelectedValue;

            DataTable DT = new DataTable();
            IBUSMedicalDAL objDAL = new IBUSMedicalDAL();

            switch (tableName)
            {

                case "Person":
                    ItemGrid.DataSource = objDAL.GetPersonForStaffLogin(ref DT);//seting data source for this Grid
                    ItemGrid.DataBind(); //bind the data source to this grid
                    break;

                case "Staff":
                    ItemGrid.DataSource = objDAL.GetStaffForStaffLogin(ref DT);//seting data source for this Grid
                    ItemGrid.DataBind(); //bind the data source to this grid
                    break;

                case "Patient":
                    ItemGrid.DataSource = objDAL.GetPatientForStaffLogin(ref DT);//seting data source for this Grid
                    ItemGrid.DataBind(); //bind the data source to this grid
                    break;

                case "Doctor":
                    ItemGrid.DataSource = objDAL.GetDoctorForStaffLogin(ref DT);//seting data source for this Grid
                    ItemGrid.DataBind(); //bind the data source to this grid
                    break;

                case "Ward":
                    ItemGrid.DataSource = objDAL.GetWardForStaffLogin(ref DT);//seting data source for this Grid
                    ItemGrid.DataBind(); //bind the data source to this grid
                    break;

                case "Reports":
                    ItemGrid.DataSource = objDAL.GetReportsForStaffLogin(ref DT);//seting data source for this Grid
                    ItemGrid.DataBind(); //bind the data source to this grid
                    break;

                case "Appointment":
                    ItemGrid.DataSource = objDAL.GetAppointmentForStaffLogin(ref DT);//seting data source for this Grid
                    ItemGrid.DataBind(); //bind the data source to this grid
                    break;

                case "Department":
                    ItemGrid.DataSource = objDAL.GetDepartmentForStaffLogin(ref DT);//seting data source for this Grid
                    ItemGrid.DataBind(); //bind the data source to this grid
                    break;
            }
        }
    }
}