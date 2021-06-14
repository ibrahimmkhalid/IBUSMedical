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
    public partial class UserSignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AttemptUserSignUp(object sender, EventArgs e)
        {
            String personCNIC = InputPersonCNIC.Text;
            String personName = InputPersonName.Text;
            String personPhoneNo = InputPersonPhoneNo.Text;
            String personDOB = InputPersonDOB.Text;
            String personSex = InputPersonSex.Text;
            DataTable DT = new DataTable();
            IBUSMedicalDAL objDAL = new IBUSMedicalDAL();
            objDAL.AttemptLoginPerson(personCNIC, ref DT);
            if (DT.Rows.Count >= 1)
            {
                Response.Redirect("Appointments.aspx?CNIC=" + personCNIC);
            }
            else
            {
                objDAL.AttemptUserSignUp(personCNIC, personName, personPhoneNo, personDOB, personSex);
                Response.Redirect("Appointments.aspx?CNIC=" + personCNIC);
            }
        }
    }
}