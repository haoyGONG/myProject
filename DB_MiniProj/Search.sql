use coursework;
select staffName, telephoneNumber from HALL_OF_RESIDENCE inner join HALL_OF_RESIDENCE_ACCOMMODATION_STAFF on HALL_OF_RESIDENCE.hallName= HALL_OF_RESIDENCE_ACCOMMODATION_STAFF.hallName inner join STAFF on HALL_OF_RESIDENCE_ACCOMMODATION_STAFF.staffNumber=STAFF.staffNumber;
select STUDENT.studentNumber, studentName, LEASE.leaseNumber, duration, entryDate, leaveDate from STUDENT inner join STUDENT_LEASE on STUDENT.studentNumber = STUDENT_LEASE.studentNumber inner join LEASE on STUDENT_LEASE.leaseNumber = LEASE.leaseNumber;
select * from LEASE where entryDate <= '2018-7-15' and leaveDate >= '2018-9-25';
select INVOICE.paymentDue from STUDENT inner join STUDENT_LEASE on STUDENT.studentNumber = STUDENT_LEASE.studentNumber inner join LEASE on STUDENT_LEASE.leaseNumber = LEASE.leaseNumber inner join LEASE_INVOICE on LEASE.leaseNumber = LEASE_INVOICE.leaseNumber inner join INVOICE on LEASE_INVOICE.invoiceNumber = INVOICE.invoiceNumber where STUDENT.studentNumber = '0001';
select STUDENT.studentNumber, studentName from STUDENT inner join STUDENT_LEASE on STUDENT.studentNumber = STUDENT_LEASE.studentNumber inner join LEASE on STUDENT_LEASE.leaseNumber = LEASE.leaseNumber inner join LEASE_INVOICE on LEASE.leaseNumber = LEASE_INVOICE.leaseNumber inner join INVOICE on LEASE_INVOICE.invoiceNumber = INVOICE.invoiceNumber where INVOICE.dateOfPayment > '2018-5-11' or INVOICE.dateOfPayment IS null;
select * from STAFF_STUDENT_FLAT_INSPECTION where isSatisfactory = 'NO';
(select STUDENT.studentNumber, studentName, BEDROOM.roomNumber, BEDROOM.placeNumber from STUDENT inner join STUDENT_BEDROOM on STUDENT.studentNumber = STUDENT_BEDROOM.studentNumber inner join BEDROOM on STUDENT_BEDROOM.placeNumber = BEDROOM.placeNumber) UNION (select STUDENT.studentNumber, studentName, SINGLE_ROOM.roomNumber,SINGLE_ROOM.placeNumber from STUDENT inner join STUDENT_SINGLE_ROOM on STUDENT.studentNumber = STUDENT_SINGLE_ROOM.studentNumber inner join SINGLE_ROOM on STUDENT_SINGLE_ROOM.placeNumber = SINGLE_ROOM.placeNumber);
select * from STUDENT where currentStatus = 'Waiting';
select category, count(studentNumber) from STUDENT group by category;
select Student.studentNumber, studentName from STUDENT left join STUDENT_NEXT_OF_SKIN on STUDENT.studentNumber = STUDENT_NEXT_OF_SKIN.studentNumber where relation IS null;  /*修改几个没有写近亲的学生*/
select ADVISOR.advisorName, internalTelephoneNumber from STUDENT inner join STUDENT_ADVISOR on STUDENT.studentNumber = STUDENT_ADVISOR.studentNumber inner join ADVISOR on STUDENT_ADVISOR.advisorName = ADVISOR.advisorName where STUDENT.studentNumber = '0001';
select max(rentRate) AS 'maximum rent rate', min(rentRate) AS 'minimum rent rate', avg(rentRate) AS 'averge rent rate' from SINGLE_ROOM;
select hallName, count(hallName) AS 'number of room' from HALL_OF_RESIDENCE_SINGLE_ROOM group by hallName; 
select staffNumber,staffName, year( from_days( datediff( now( ), birthDay))) AS 'age', location from STAFF where year( from_days( datediff( now( ), birthDay))) > 60;





select * from student where studentNumber='0001';
select roomNumber from course_a where courseNumber='EBU1111';
select student.studentNumber, student.studentName, student.street, student.city, student.birthDay, student.sex, student.category, student.nationality, student.smoker from STUDENT inner join STUDENT_BEDROOM on STUDENT.studentNumber = STUDENT_BEDROOM.studentNumber inner join BEDROOM on STUDENT_BEDROOM.placeNumber = BEDROOM.placeNumber inner join student_flat_bedroom on BEDROOM.placeNumber = student_flat_bedroom.placeNumber inner join student_flat on student_flat_bedroom.flatNumber = student_flat.flatNumber where student_flat.flatNumber = 'FLAT1' and BEDROOM.roomNumber = 'f111';

