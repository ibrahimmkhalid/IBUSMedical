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
    public partial class Appointments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // SelectDoctorDropDownList
            if (!IsPostBack)
            {
                DataTable DT = new DataTable();
                IBUSMedicalDAL objDAL = new IBUSMedicalDAL();
                objDAL.GetDoctorsForAppointmentPage(ref DT);
                SelectDoctorDropDownList.DataTextField = DT.Columns["DoctorTitle"].ToString();
                SelectDoctorDropDownList.DataValueField = DT.Columns["staffID"].ToString();
                SelectDoctorDropDownList.DataSource = DT;
                SelectDoctorDropDownList.DataBind();
            }
        }

        protected void CreateAppointment(object sender, EventArgs e)
        {
            String personCNIC = Request.QueryString["CNIC"];
            String appointmentDetails = InputAppointmentDeatils.Text;
            String appointmentDate = InputAppointmentDate.Text;
            String appointmentTime = InputAppointmentTime.Text;
            String staffID = SelectDoctorDropDownList.SelectedValue;
            IBUSMedicalDAL objDAL = new IBUSMedicalDAL();
            objDAL.CreateAppointment(personCNIC,appointmentDetails,appointmentDate,appointmentTime,staffID);
        }
    }
}