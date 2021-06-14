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
    public partial class Reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loadReport(object sender, EventArgs e)
        {
            String reportID = SearchReportID.Text;
            DataTable DT = new DataTable();
            IBUSMedicalDAL objDAL = new IBUSMedicalDAL();
            objDAL.GetReports(reportID, ref DT);
            if(DT.Rows.Count >= 1) 
            {
                string html = "<table class=\"table\">";
                for (int i = 0; i < DT.Columns.Count; i++)
                {
                    html += "<tr>";
                    html += "<td class=\"col-xs-5 col-md-3\">" + DT.Columns[i].ColumnName + "</td>";
                    html += "<td class=\"col-xs-7 col-md-9\">" + DT.Rows[0][i].ToString() + "</td>";
                    html += "</tr>";
                }
                html += "</table>";
                htmlReplaceReport.InnerHtml = html;
            }
            else
            {
                string html = "No report record found for id number " + reportID + "\nPlease try again.";
                htmlReplaceReport.InnerHtml = html;
            }
            

        }

    }
}