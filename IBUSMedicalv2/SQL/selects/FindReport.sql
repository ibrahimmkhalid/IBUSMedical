select 
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
where Report_ID=1