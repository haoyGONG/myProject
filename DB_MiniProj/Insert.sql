use coursework;

INSERT INTO student
(studentNumber, studentName, street, city, postcode, birthDay, sex, category, nationality, smoker, specialNeed, additionalComment, currentStatus)
VALUES
('0001', 'Adam Smith', '4114 Sepulveda Blvd', 'Culver City', '90230', '1996-08-05', 'Male', 'First year undergraduate', 'USA', 'YES', 'Do not want to live with snorers', NULL, 'Placed'),
('0002', 'Bill Jones', '137 W San Bernardino Rd', 'Covina', '91723', '1997-05-30', 'Male', 'First year undergraduate', 'USA', 'YES', NULL, NULL, 'Placed'), 
('0003', 'Carl Williams' , '1959 Auto Center Dr', 'Glendora', '91740', '1995-05-03', 'Male', 'Second year undergraduate', 'UK', 'YES', 'Do not want to live with snorers', NULL, 'Placed'),
('0004', 'Cosmo Taylor', '16701 Beach Blvd', 'Huntington Beach', '92647', '1996-11-22', 'Male', 'Second year undergraduate', 'GER', 'NO', 'Do not want to live with smoker', NULL, 'Placed'),
('0005', 'Donald Brown', '3330 S Figueroa St', 'Los Angeles', '90007', '1999-12-24', 'Male', 'First year undergraduate', 'USA', 'NO', NULL, 'Slightly withdrawn', 'Placed'),
('0006', 'Franklin Davies', '1247 W Main St', 'Alhambra', '91801', '1995-03-13', 'Male', 'Postgraduate', 'CHN', 'NO', NULL, NULL, 'Placed'),
('0007', 'Caroline Edwards', '600 W Commonwealth Ave', 'Fullerton', '92832', '1997-04-13', 'Female','Postgraduate', 'UK', 'NO', NULL, 'Has a slight nervous breakdown','Placed'),
('0008', 'Fiona Hughes', '100 S San Gabriel Blvd', 'San Gabrie', '91776', '1997-09-13', 'Female', 'Second year undergraduate', 'USA', 'NO', NULL, NULL, 'Placed'),
('0009', 'Ivy Green Hall', '15541 S Western Ave', 'Gardena', '90249', '1999-10-21', 'Female', 'First year undergraduate', 'RUS', 'NO', 'Do not want to live with smoker', NULL, 'Placed'),
('0010', 'Maggie Lewis', '26755 Ynez Rd', 'Temecula', '92591', '1998-11-02', 'Female', 'Third year undergraduate', 'CHN', 'NO', NULL, NULL, 'Placed'),
('0011', 'Jack Chen', 'Chang an street', 'Beijing', '10000', '1999-05-11', 'Male', 'First year undergraduate', 'CHN','NO', NULL,NULL, 'Waiting'),
('0012', 'Bingbing Fan', 'Chang an street', 'Beijing', '10000', '1998-05-11', 'Female', 'First year undergraduate', 'CHN','NO', NULL,NULL, 'Waiting');


INSERT INTO course_a
(courseNumber, title, leader, internalTelephoneNumber, roomNumber)
VALUES
('EBU1111', 'College English', 'Winnie Jackson', '(908) 996-2022', 'C_1111'),
('EBU2222', 'Product Development', 'Vanessa Patel', '(559) 592-2538', 'C_2222'),
('EBU3333', 'Advanced Mathematics', 'Philip Thompson', '(631) 324-4939', 'C_3333'),
('EBU4444', 'University Physics', 'Joshua Thomas', '(812) 828-0175', 'C_4444'),
('EBU5555', 'Signals and Systems Theory', 'Lorin Roberts', '(812) 828-0172', 'C_5555');


INSERT INTO course_b 
(courseNumber, department)
VALUES
('EBU1111', 'Course_DPT1'),
('EBU2222', 'Course_DPT2'),
('EBU3333', 'Course_DPT3'),
('EBU4444', 'Course_DPT4'),
('EBU5555', 'Course_DPT5');



INSERT INTO lease
(leaseNumber, duration, entryDate, leaveDate)
VALUES
('LEASE_0001', 3, '2018-05-25', '2018-08-25'),
('LEASE_0002', 1, '2018-05-17', '2018-06-17'),
('LEASE_0003', 12,'2017-11-25', '2018-11-25'),
('LEASE_0004', 8, '2018-09-02', NULL),
('LEASE_0005', 5, '2018-06-25', '2018-11-25'),
('LEASE_0006', 8, '2018-06-25', NULL),
('LEASE_0007', 5, '2018-08-25', '2019-01-25'),
('LEASE_0008', 3, '2018-06-25', '2018-09-25'),
('LEASE_0009', 1, '2018-09-25', '2018-10-25'),
('LEASE_0010', 5, '2018-10-22', '2019-03-25');




INSERT INTO advisor
(advisorName, position, nameOfDepartment, internalTelephoneNumber, roomNumber)
VALUES
('Jacob Evans', 'TB3', 'ADVISOR_A', '123456789' ,'TB3_150'),
('Bob Davies', 'TB3', 'ADVISOR_B', '123548524' ,'TB3_452'),
('Ivy Patel', 'TB4', 'ADVISOR_C', '154298125' ,'TB4_430');




INSERT INTO bedroom
(placeNumber,rentRate,roomNumber)
VALUES
('FLAT1_f111', 300.00, 'f111'),
('FLAT1_f222', 450.00, 'f222'),
('FLAT2_f333', 320.00, 'f333'),
('FLAT4_f444', 300.00, 'f444'),
('FLAT3_f555', 560.00, 'f555'),
('FLAT4_f666', 400.00, 'f666');



INSERT INTO single_room
(placeNumber, roomNumber, rentRate)
VALUES
('HALL1_h111', 'h111', 600.00),
('HALL1_h121', 'h121', 600.00),
('HALL2_h222', 'h222', 800.00),
('HALL3_h333', 'h333', 850.00),
('HALL4_h444', 'h444', 900.00);




INSERT INTO invoice
(invoiceNumber, semester, paymentDue, dateOfPayment, methodOfPayment, dateOfFirstReminder, dateOfSecondReminder)
VALUES
('Invoice_0001', 'Semester2', '1900.00', '2018-11-15', 'Cash', '2018-10-20', '2018-11-5'),
('Invoice_0002', 'Semester1', '4500.00', '2018-02-15', 'Cash', '2018-01-20', '2018-02-5'),
('Invoice_0003', 'Semester2', '2200.00', '2018-11-15', 'Cheque', '2018-10-20', '2018-11-5'),
('Invoice_0004', 'Semester2', '1600.00', NULL, NULL, '2018-10-20', '2018-11-5'),
('Invoice_0005', 'Semester2', '2600.00', '2018-10-15', 'Vise', '2018-9-20', '2018-10-5'),
('Invoice_0006', 'Semester2', '3350.00', NULL, NULL, '2018-10-20', '2018-11-5'),
('Invoice_0007', 'Semester2', '2000.00', '2018-11-15', 'Cheque', '2018-10-20', '2018-11-5'),
('Invoice_0008', 'Semester1', '3000.00', '2018-05-15', 'Cash', '2018-04-20', '2018-05-05'),
('Invoice_0009', 'Semester1', '3500.00', '2018-05-15', 'Visa', '2018-04-20', '2018-05-05'),
('Invoice_0010', 'Semester1', '4300.00', '2018-05-15', 'Visa', '2018-04-20', '2018-05-05');



INSERT INTO hall_of_residence
(hallName, street, city, postcode, telephoneNumber)
VALUES
('HALL1', '800 Highway 400', 'Beijing', '10000', '(706) 216-1609'),
('HALL2', '800 Highway 401', 'Beijing', '10000', '(706) 216-1678'),
('HALL3', '800 Highway 402', 'Beijing', '10000', '(706) 216-1656'),
('HALL4', '800 Highway 404', 'Beijing', '10000', '(706) 216-1676');




INSERT INTO staff
(staffNumber, staffName, street, city, postcode, birthDay, sex, position, location)
VALUES
('Staff001', 'Lorin Roberts', '800 Highway 400', 'Beijing', '10000', '1975-02-15', 'Male', 'Flat Manager', 'FLAT1'),
('Staff002', 'John Thomas', '800 Highway 401', 'Beijing', '10000', '1942-12-25', 'Female', 'Cleaner', 'FLAT1'),
('Staff003', 'Franklin Taylor', '800 Highway 401', 'Beijing', '10000', '1983-10-25', 'Female', 'Administrative Assistant', 'Accommodation Office'),
('Staff004', 'Kim Thomas', '800 Highway 400', 'Beijing', '10000', '1952-02-15', 'Female', 'Flat Manager', 'FLAT2');


INSERT INTO student_flat
(flatNumber, street, city, postcode, numberOfBedrooms)
VALUES
('FLAT1', 'Xingtan Street', 'Beijing', '10000', 3),
('FLAT2', 'Xingtan Street', 'Beijing', '10000', 3),
('FLAT3', 'Xingtan Street', 'Beijing', '10000', 4),
('FLAT4', 'Xingtan Street', 'Beijing', '10000', 4);




INSERT INTO student_lease
(studentNumber, leaseNumber)
VALUES
('0001', 'LEASE_0001'),
('0002', 'LEASE_0002'),
('0003', 'LEASE_0003'),
('0004', 'LEASE_0004'),
('0005', 'LEASE_0005'),
('0006', 'LEASE_0006'),
('0007', 'LEASE_0007'),
('0008', 'LEASE_0008'),
('0009', 'LEASE_0009'),
('0010', 'LEASE_0010');



INSERT INTO student_course
(studentNumber, courseNumber)
VALUES
('0001', 'EBU1111'),
('0002', 'EBU2222'),
('0003', 'EBU3333'),
('0004', 'EBU4444'),
('0005', 'EBU5555'),
('0006', 'EBU1111'),
('0007', 'EBU2222'),
('0008', 'EBU3333'),
('0009', 'EBU4444'),
('0010', 'EBU5555'),
('0011', 'EBU4444'),
('0012', 'EBU4444');




INSERT INTO student_advisor
(studentNumber, advisorName)
VALUES
('0001', 'Jacob Evans'),
('0002', 'Jacob Evans'),
('0003', 'Jacob Evans'),
('0004', 'Jacob Evans'),
('0005', 'Bob Davies'),
('0006', 'Bob Davies'),
('0007', 'Bob Davies'),
('0008', 'Ivy Patel'),
('0009', 'Ivy Patel'),
('0010', 'Ivy Patel'),
('0011', 'Ivy Patel'),
('0012', 'Ivy Patel');



INSERT INTO student_bedroom
(studentNumber, placeNumber)
VALUES
('0001', 'FLAT1_f111'),
('0002', 'FLAT1_f222'),
('0003', 'FLAT2_f333'),
('0004', 'FLAT4_f444'),
('0005', 'FLAT3_f555'),
('0006', 'FLAT4_f666');


INSERT INTO student_single_room
(studentNumber, placeNumber)
VALUES
('0007', 'HALL1_h111'),
('0008', 'HALL2_h222'),
('0009', 'HALL3_h333'),
('0010', 'HALL4_h444');



INSERT INTO student_next_of_skin
(studentNumber, name, relation, street, city, postcode, contact)
VALUES
('0001', 'Haofeng GAO', 'Father', '4114 Sepulveda Blvd', 'Culver City', '90230', '1359874682'),
('0002', 'Haoran CUI', 'Father', '137 W San Bernardino Rd', 'Covina', '91723', '5194956252'),
('0003', 'Yitong SHI', 'Father', '1959 Auto Center Dr', 'Glendora', '91740', '1598468813'),
('0004', 'Haoran Guo', 'Father','16701 Beach Blvd', 'Huntington Beach', '92647', '1374187815'),
('0005', 'Peiyu ZHANG', 'Father', '3330 S Figueroa St', 'Los Angeles', '90007', '154754955'),
('0006', 'Haoyan GONG', 'Father', 'Chanan street','Beijing', '10000', '649825676'),
('0008', 'Ying YANG', 'Mother', 'Beitaipingzhuang street', 'Beijing', '10000', '754728241'),
('0010', 'Yuner LIN', 'Mother', 'Shacui street', 'Beijing', '10000', '197349782');




INSERT INTO lease_invoice
(leaseNumber, invoiceNumber)
VALUES
('LEASE_0001', 'Invoice_0001'),
('LEASE_0002', 'Invoice_0002'),
('LEASE_0003', 'Invoice_0003'),
('LEASE_0004', 'Invoice_0004'),
('LEASE_0005', 'Invoice_0005'),
('LEASE_0006', 'Invoice_0006'),
('LEASE_0007', 'Invoice_0007'),
('LEASE_0008', 'Invoice_0008'),
('LEASE_0009', 'Invoice_0009'),
('LEASE_0010', 'Invoice_0010');



INSERT INTO hall_of_residence_single_room
(hallName, placeNumber)
VALUES
('HALL1', 'HALL1_h111'),
('HALL1', 'HALL1_h121'),
('HALL2', 'HALL2_h222'),
('HALL3', 'HALL3_h333'),
('HALL4', 'HALL4_h444');




INSERT INTO hall_of_residence_accommodation_staff
(hallName, staffNumber)
VAlUES
('HALL1', 'Staff001'),
('HALL2', 'Staff001'),
('HALL3', 'Staff004'),
('HALL4', 'Staff004');


INSERT INTO staff_student_flat_inspection
(staffNumber, flatNumber, dateOfInspection, isSatisfactory, comment)
VALUES
('Staff001', 'FLAT1', '2018-10-15', 'YES', 'Pretty Good'),
('Staff002', 'FLAT1', '2018-11-15', 'YES', 'Pretty Good'),
('Staff001', 'FLAT2', '2018-10-15', 'YES','Excellent'),
('Staff002', 'FLAT2', '2018-11-15', 'YES', 'Pretty Good'),
('Staff001', 'FLAT3', '2018-10-15', 'NO', 'Mess'),
('Staff002', 'FLAT3', '2018-11-15', 'YES', 'Pretty Good'),
('Staff001', 'FLAT4', '2018-10-15', 'NO', 'Mess'),
('Staff002', 'FLAT4', '2018-11-15', 'NO', 'Still mess');



INSERT INTO student_flat_bedroom
(placeNumber, flatNumber)
VALUES
('FLAT1_f111', 'FLAT1'),
('FLAT1_f222', 'FLAT1'),
('FLAT2_f333', 'FLAT2'),
('FLAT4_f444', 'FLAT4'),
('FLAT3_f555', 'FLAT3'),
('FLAT4_f666', 'FLAT4');


