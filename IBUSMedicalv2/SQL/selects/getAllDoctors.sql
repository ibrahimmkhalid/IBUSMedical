select
	CONCAT(Person.Name,', ',Doctor.specialization,', ',Department.Dept_Name) as 'DoctorTitle',
	Doctor.staffID
from
Doctor
join Staff on Doctor.staffID=Staff.staffID
Join Department on Staff.Department_ID=Department.Department_ID
join Person on Staff.CNIC=Person.CNIC