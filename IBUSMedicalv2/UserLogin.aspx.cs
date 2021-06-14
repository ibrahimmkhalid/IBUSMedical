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
    public partial class UserLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AttemptLoginPerson(object sender, EventArgs e)
        {
            String personCNIC = InputCNIC.Text;
            DataTable DT = new DataTable();
            IBUSMedicalDAL objDAL = new IBUSMedicalDAL();
            objDAL.AttemptLoginPerson(personCNIC, ref DT);
            if (DT.Rows.Count >= 1)
            {
                Response.Redirect("Appointments.aspx?CNIC=" + personCNIC);
            }
            else
            {
                Response.Redirect("UserLogin.aspx");
            }
        }
    }
}