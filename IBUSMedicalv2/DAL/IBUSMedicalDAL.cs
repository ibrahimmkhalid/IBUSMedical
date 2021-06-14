using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace IBUSMedicalv2.DAL
{
    public class IBUSMedicalDAL
    {
        private static readonly string connString =
            System.Configuration.ConfigurationManager.ConnectionStrings["IBUSMedicalSQL"].ConnectionString;

        public void GetReports(String id, ref DataTable DT)
        {
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(connString);
            String query = @"select 
			Reports.Report_ID as 'Report ID',
			Patient.CNIC as 'Patient CNIC',
			p1.Name as 'Patient Name',
			convert(varchar, p1.DOB, 107) as 'Patient Date of Birth',
			p1.Sex as 'Sex',
			concat('+92',p1.phoneNo) as 'Patient Phone Number',
			p2.Name as 'Doctor Name',
			concat('+92',p2.phoneNo) as 'Doctor Phone Number',
			Doctor.specialization as 'Specialization',
			Patient.Ward_ID as 'Ward of Stay',
			Patient.Length_of_stay as 'Length of Stay',
			Ward.Room_rate * Patient.Length_of_stay as 'Cost of Stay',
			Patient.Disease as 'Diagnosed Disease',
			Reports.Details as  'Details'
			from Reports
			join Patient on Reports.Patient_CNIC=Patient.CNIC
			join Person p1 on Patient.CNIC = p1.CNIC
			join Doctor on Reports.staffID=Doctor.staffID
			join Staff on Doctor.staffID=Staff.staffID
			join Person p2 on Staff.CNIC=p2.CNIC
			join Ward on Patient.Ward_ID=Ward.Ward_ID
			where Report_ID=" + id;
            SqlCommand cmd = new SqlCommand(query, con);
            try
            {
				con.Open();
				cmd.ExecuteNonQuery();
				using(SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
					da.Fill(ds);
                }
				DT = ds.Tables[0];
			}
			finally
            {
				con.Close();
            }
        }

		public void AttemptLoginPerson(String personCNIC, ref DataTable DT)
		{
			DataSet ds = new DataSet();
			SqlConnection con = new SqlConnection(connString);
			String query = "select * from Person where Person.CNIC=" + personCNIC;
			SqlCommand cmd = new SqlCommand(query, con);
			try
			{
				con.Open();
				cmd.ExecuteNonQuery();
				using (SqlDataAdapter da = new SqlDataAdapter(cmd))
				{
					da.Fill(ds);
				}
				DT = ds.Tables[0];
			}
			finally
			{
				con.Close();
			}
		}

		public void AttemptUserSignUp(String personCNIC, String personName, String personPhoneNo, String personDOB, String personSex)
		{
			SqlConnection con = new SqlConnection(connString);
			String query = "INSERT [dbo].[Person] ([CNIC], [phoneNo], [Name], [DOB], [Sex]) " +
				"VALUES (N'" + personCNIC + "', " +
				"N'" + personPhoneNo + "', " +
				"N'" + personName + "', " +
				"CAST(N'" + personDOB + "' AS Date), " +
				"N'" + personSex + "')";
			SqlCommand cmd = new SqlCommand(query, con);
			try
			{
				con.Open();
				cmd.ExecuteNonQuery();
			}
			finally
			{
				con.Close();
			}
		}

		public void CreateAppointment(String personCNIC, String appointmentDetails, String appointmentDate, String appointmentTime, String staffID)
		{
			int appointmentID = 0;
			SqlConnection con = new SqlConnection(connString);
			String query = "select top 1 Appointment_ID from Appointment order by Appointment_ID desc";
			DataSet ds = new DataSet();
			SqlCommand cmd = new SqlCommand(query, con);
			try
			{
				con.Open();
				cmd.ExecuteNonQuery();
				using (SqlDataAdapter da = new SqlDataAdapter(cmd))
				{
					da.Fill(ds);
				}
				appointmentID = Convert.ToInt32(ds.Tables[0].Rows[0][0].ToString()) + 1;
			}
			finally
			{
				con.Close();
			}

			query = "INSERT [dbo].[Appointment] ([Appointment_ID], [Details], [Date], [Time], [staffID], [CNIC]) " +
				"VALUES (" + appointmentID + ", " +
				"N'" + appointmentDetails + "', " +
				"CAST(N'" + appointmentDate + "' AS Date), " +
				"CAST(N'" + appointmentTime + "' AS Time), " +
				"" + staffID + ", " +
				"N'" + personCNIC + "')";
			cmd = new SqlCommand(query, con);
			try
			{
				con.Open();
				cmd.ExecuteNonQuery();
			}
			finally
			{
				con.Close();
			}
		}

		public void GetDoctorsForAppointmentPage(ref DataTable DT)
        {
			DataSet ds = new DataSet();
			SqlConnection con = new SqlConnection(connString);
			String query = @"select
				CONCAT(Person.Name,', ',Doctor.specialization,', ',Department.Dept_Name) as 'DoctorTitle',
				Doctor.staffID as 'staffID'
				from
				Doctor
				join Staff on Doctor.staffID=Staff.staffID
				Join Department on Staff.Department_ID=Department.Department_ID
				join Person on Staff.CNIC=Person.CNIC";
			SqlCommand cmd = new SqlCommand(query, con);
			try
			{
				con.Open();
				cmd.ExecuteNonQuery();
				using (SqlDataAdapter da = new SqlDataAdapter(cmd))
				{
					da.Fill(ds);
				}
				DT = ds.Tables[0];
			}
			finally
			{
				con.Close();
			}
		}
		public DataSet GetStaffForStaffLogin(ref DataTable DT)
		{
			DataSet ds = new DataSet();
			SqlConnection con = new SqlConnection(connString);
			String query = @"select * from Staff";
			SqlCommand cmd = new SqlCommand(query, con);
			try
			{
				con.Open();
				cmd.ExecuteNonQuery();
				using (SqlDataAdapter da = new SqlDataAdapter(cmd))
				{
					da.Fill(ds);
				}
				DT = ds.Tables[0];
			}
			finally
			{
				con.Close();
			}
			return ds;
		}

		public DataSet GetPersonForStaffLogin(ref DataTable DT)
		{
			DataSet ds = new DataSet();
			SqlConnection con = new SqlConnection(connString);
			String query = @"select * from Person";
			SqlCommand cmd = new SqlCommand(query, con);
			try
			{
				con.Open();
				cmd.ExecuteNonQuery();
				using (SqlDataAdapter da = new SqlDataAdapter(cmd))
				{
					da.Fill(ds);
				}
				DT = ds.Tables[0];
			}
			finally
			{
				con.Close();
			}
			return ds;
		}

		public DataSet GetPatientForStaffLogin(ref DataTable DT)
		{
			DataSet ds = new DataSet();
			SqlConnection con = new SqlConnection(connString);
			String query = @"select * from Patient";
			SqlCommand cmd = new SqlCommand(query, con);
			try
			{
				con.Open();
				cmd.ExecuteNonQuery();
				using (SqlDataAdapter da = new SqlDataAdapter(cmd))
				{
					da.Fill(ds);
				}
				DT = ds.Tables[0];
			}
			finally
			{
				con.Close();
			}
			return ds;
		}

		public DataSet GetDepartmentForStaffLogin(ref DataTable DT)
		{
			DataSet ds = new DataSet();
			SqlConnection con = new SqlConnection(connString);
			String query = @"select * from Department";
			SqlCommand cmd = new SqlCommand(query, con);
			try
			{
				con.Open();
				cmd.ExecuteNonQuery();
				using (SqlDataAdapter da = new SqlDataAdapter(cmd))
				{
					da.Fill(ds);
				}
				DT = ds.Tables[0];
			}
			finally
			{
				con.Close();
			}
			return ds;
		}
		public DataSet GetReportsForStaffLogin(ref DataTable DT)
		{
			DataSet ds = new DataSet();
			SqlConnection con = new SqlConnection(connString);
			String query = @"select * from Reports";
			SqlCommand cmd = new SqlCommand(query, con);
			try
			{
				con.Open();
				cmd.ExecuteNonQuery();
				using (SqlDataAdapter da = new SqlDataAdapter(cmd))
				{
					da.Fill(ds);
				}
				DT = ds.Tables[0];
			}
			finally
			{
				con.Close();
			}
			return ds;
		}

		public DataSet GetAppointmentForStaffLogin(ref DataTable DT)
		{
			DataSet ds = new DataSet();
			SqlConnection con = new SqlConnection(connString);
			String query = @"select * from Appointment";
			SqlCommand cmd = new SqlCommand(query, con);
			try
			{
				con.Open();
				cmd.ExecuteNonQuery();
				using (SqlDataAdapter da = new SqlDataAdapter(cmd))
				{
					da.Fill(ds);
				}
				DT = ds.Tables[0];
			}
			finally
			{
				con.Close();
			}
			return ds;
		}

		public DataSet GetDoctorForStaffLogin(ref DataTable DT)
		{
			DataSet ds = new DataSet();
			SqlConnection con = new SqlConnection(connString);
			String query = @"select * from Doctor";
			SqlCommand cmd = new SqlCommand(query, con);
			try
			{
				con.Open();
				cmd.ExecuteNonQuery();
				using (SqlDataAdapter da = new SqlDataAdapter(cmd))
				{
					da.Fill(ds);
				}
				DT = ds.Tables[0];
			}
			finally
			{
				con.Close();
			}
			return ds;
		}

		public DataSet GetWardForStaffLogin(ref DataTable DT)
		{
			DataSet ds = new DataSet();
			SqlConnection con = new SqlConnection(connString);
			String query = @"select * from Ward";
			SqlCommand cmd = new SqlCommand(query, con);
			try
			{
				con.Open();
				cmd.ExecuteNonQuery();
				using (SqlDataAdapter da = new SqlDataAdapter(cmd))
				{
					da.Fill(ds);
				}
				DT = ds.Tables[0];
			}
			finally
			{
				con.Close();
			}
			return ds;
		}



	}
}