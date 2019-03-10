package coursework;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.sql.SQLException;

import javax.swing.*;
import java.awt.*;

public class Gui implements ActionListener, ItemListener {
	JFrame frame; 
	JPanel panelA; // PanelA put the title.
	JPanel panelB; // PanelB put the button.
	JPanel panelC;
	JPanel panel; // Create the panel to put the panelA, panelB.
	JButton sample_button;//Sample query.
	JButton function_button;//Other query.
	JButton search_button; //Freedom search.
	JButton back_button = new JButton("Go back to the initialize interface.");//Back to the initialization interface.
	JLabel welcome_label;//Show the welcome to user.
	ButtonGroup group;
	JLabel tip_label;
	JRadioButton[] queryChoice = new JRadioButton[14];
	JButton query_button;
	JButton[] functionQuery = new JButton[3];
	JLabel functionA_label, functionB_label, functionC1_label, functionC2_label; //function A,B,C button label
	JTextField functionA_text, functionB_text, functionC1_text, functionC2_text; //function A,B,C button text field
	JButton functionA_button, functionB_button, functionC_button;
	JLabel search_label;
	JTextField search_text;
	JButton searchConfirm_button;
	JLabel conditionA_label, conditionB_label, conditionC_label;
	JTextField conditionA_text, conditionB_text, conditionC_text;
	JButton conditionA_button, conditionB_button, conditionC_button;
	
	public Gui() {
		frame = new JFrame(); 
		create();
	}
	
	public void create() {
		panelA = new JPanel(); // PanelA put the title.
		panelB = new JPanel(); // PanelB put the button.
		panel = new JPanel();
		
		sample_button = new JButton("Query samples"); // Create a button to query samples
		sample_button.addActionListener(this); // Add action listener.
		function_button = new JButton("Query others");
		function_button.addActionListener(this); // Add action listener.
		search_button = new JButton("Input search statemrnt");
		search_button.addActionListener(this); // Add action listener.
		welcome_label = new JLabel("Welcome to The University Accommodation Office Management System!"); // Make the label show the name.

		panelA.setLayout(new FlowLayout()); // PanelA use the flowlayout.
		panelA.add(this.welcome_label);// Add label to the PanelA.

		panelB.setLayout(new FlowLayout()); // PanelB use the flowlayout.
		panelB.add(this.sample_button); 
		panelB.add(this.function_button);
		panelB.add(this.search_button);// Add the label of check result to the PanelC.

		panel.setLayout(new GridLayout(0,1));

		panel.add(panelA);
		panel.add(panelB); // Panel use the gridlayout and add panelA, panelB and panelC in order.

		frame.getContentPane().add(panel); // Add the panel to the frame.

		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setTitle("CourseWork");
		Dimension d = Toolkit.getDefaultToolkit().getScreenSize();
		int width=900;
		int height=550;
		frame.setSize(width, height);
		frame.setBounds((d.width - width) / 2, (d.height - height) / 2, width, height);
		frame.setVisible(true);
		//frame.pack(); // Set the frame.
	}

	@Override
	public void actionPerformed(ActionEvent event) {
		if (event.getSource() == sample_button) 
			sample_button();
		else if (event.getSource() == function_button)
			function_button();
		else if (event.getSource() == search_button)
			search_button();
		else if (event.getSource() == back_button)
			back_button();
		else if(event.getSource() == functionQuery[0])
			functionA();
		else if(event.getSource() == functionQuery[1])
			functionB();
		else if(event.getSource() == functionQuery[2])
			functionC();
		else if(event.getSource() == conditionA_button)
			try {
				new Connect("select INVOICE.paymentDue from STUDENT inner join STUDENT_LEASE on STUDENT.studentNumber = STUDENT_LEASE.studentNumber inner join LEASE on STUDENT_LEASE.leaseNumber = LEASE.leaseNumber inner join LEASE_INVOICE on LEASE.leaseNumber = LEASE_INVOICE.leaseNumber inner join INVOICE on LEASE_INVOICE.invoiceNumber = INVOICE.invoiceNumber where STUDENT.studentNumber = '" + conditionA_text.getText() + "'");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		else if(event.getSource() == conditionB_button)
			try {
				new Connect("select STUDENT.studentNumber, studentName from STUDENT inner join STUDENT_LEASE on STUDENT.studentNumber = STUDENT_LEASE.studentNumber inner join LEASE on STUDENT_LEASE.leaseNumber = LEASE.leaseNumber inner join LEASE_INVOICE on LEASE.leaseNumber = LEASE_INVOICE.leaseNumber inner join INVOICE on LEASE_INVOICE.invoiceNumber = INVOICE.invoiceNumber where INVOICE.dateOfPayment > '" + conditionB_text.getText() + "' or INVOICE.dateOfPayment IS null;");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		else if(event.getSource() == conditionC_button)
			try {
				new Connect("select ADVISOR.advisorName, internalTelephoneNumber from STUDENT inner join STUDENT_ADVISOR on STUDENT.studentNumber = STUDENT_ADVISOR.studentNumber inner join ADVISOR on STUDENT_ADVISOR.advisorName = ADVISOR.advisorName where STUDENT.studentNumber = '" + conditionC_text.getText() +"';");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		else if(event.getSource() == functionA_button)
			try {
				new Connect("select * from student where studentNumber='" + functionA_text.getText() + "'");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		else if(event.getSource() == functionB_button)
			try {
				new Connect("select roomNumber from course_a where courseNumber='" + functionB_text.getText() + "'");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		else if(event.getSource() == functionC_button)
			try {
				new Connect("select student.studentNumber, student.studentName, student.street, student.city, student.birthDay, student.sex, student.category, student.nationality, student.smoker from student inner join student_bedroom on student.studentNumber = student_room.studentNumber inner join bedroom on student_bedroom.placeNumber = bedroom.placeNumber inner join student_flat_bedroom on bedroom.placeNumber = student_flat_bedroom.placeNumber inner join student_flat on student_flat_bedroom.flatNumber = student_flat.flatNumber where student_flat.flatNumber ='" + functionC1_text.getText() + "' and bedroom.roomNumber ='" + functionC2_text.getText() + "'");
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		else if(event.getSource() == searchConfirm_button)
			try {
				new Connect(search_text.getText());
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		
		
	}

	public void sample_button() {
		frame.getContentPane().removeAll();
		group = new ButtonGroup() ; 
		panelA =  new JPanel();
		panelA.setLayout(new GridLayout(0,1));
		panelB =  new JPanel();
		panel =  new JPanel();
		//tip_label = new JLabel("Please choose one choice.",JLabel.CENTER);
		tip_label = new JLabel("Please choose one which you want to query and clik the circle");
		panelA.add(tip_label);
		
		queryChoice[0] = new JRadioButton(" Present a report listing the Manager name and telephone number for each hall of residence. ");
		queryChoice[1] = new JRadioButton(" Present a report listing the names and student numbers of students with the details of their lease agreements. ");
		queryChoice[2] = new JRadioButton(" Display the details of lease agreements that include the Summer Semester. ");
		queryChoice[3] = new JRadioButton(" Display the details of the total rent paid by a given student. ");
		queryChoice[4] = new JRadioButton(" Present a report on students that have not paid their invoices by a given date. ");
		queryChoice[5] = new JRadioButton(" Display the details of flat inspections where the property was found to be in an unsatisfactory condition. ");
		queryChoice[6] = new JRadioButton(" Present a report of the names and student numbers of students with their room number and place number in a particular hall of residence. ");
		queryChoice[7] = new JRadioButton(" Present a report listing the details of all students currently on the waiting list for accommodation, that is, not placed. ");
		queryChoice[8] = new JRadioButton(" Display the total number of students in each student category. ");
		queryChoice[9] = new JRadioButton(" Present a report of the names and student numbers for all students who have not supplied details of their next-of-kin. ");
		queryChoice[10] = new JRadioButton(" Display the name and internal telephone number of the Advisor of Studies for a particular student. ");
		queryChoice[11] = new JRadioButton(" Display the minimum, maximum, and average monthly rent for rooms in halls of residence. ");
		queryChoice[12] = new JRadioButton(" Display the total number of places in each hall of residence. ");
		queryChoice[13] = new JRadioButton(" Display the staff number, name, age, and current location of all members of the accommodation staff who are over 60 years old today.  ");
	
		for (int i = 0; i <= 13; i++) {
			group.add(queryChoice[i]) ;  
			queryChoice[i].addItemListener(this) ; 
			panelA.add(queryChoice[i]);
		}

		//back_button = new JButton("Go back to the initialize interface.");
		back_button.addActionListener(this);
		panelB.add(back_button);
		//panel.setLayout(new GridLayout(0,1));
		panel.add(panelA);
		panel.add(panelB);
		frame.getContentPane().add(panel); 
		frame.setVisible(false);
		frame.setVisible(true);
	}
	
	@Override
	public void itemStateChanged(ItemEvent event){
		if (event.getSource() == queryChoice[0] && event.getStateChange() == ItemEvent.SELECTED)
			try {
				new Connect("select staffName, telephoneNumber from HALL_OF_RESIDENCE inner join HALL_OF_RESIDENCE_ACCOMMODATION_STAFF on HALL_OF_RESIDENCE.hallName= HALL_OF_RESIDENCE_ACCOMMODATION_STAFF.hallName inner join STAFF on HALL_OF_RESIDENCE_ACCOMMODATION_STAFF.staffNumber=STAFF.staffNumber;");
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		else if(event.getSource() == queryChoice[1] && event.getStateChange() == ItemEvent.SELECTED)
			try {
				new Connect("select STUDENT.studentNumber, studentName, LEASE.leaseNumber, duration, entryDate, leaveDate from STUDENT inner join STUDENT_LEASE on STUDENT.studentNumber = STUDENT_LEASE.studentNumber inner join LEASE on STUDENT_LEASE.leaseNumber = LEASE.leaseNumber;");
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		else if(event.getSource() == queryChoice[2] && event.getStateChange() == ItemEvent.SELECTED)
			try {
				new Connect("select * from LEASE where entryDate <= '2018-7-15' and leaveDate >= '2018-9-25';");
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		else if(event.getSource() == queryChoice[3] && event.getStateChange() == ItemEvent.SELECTED) {
//			try {
//				new Connect("select INVOICE.paymentDue from STUDENT inner join STUDENT_LEASE on STUDENT.studentNumber = STUDENT_LEASE.studentNumber inner join LEASE on STUDENT_LEASE.leaseNumber = LEASE.leaseNumber inner join LEASE_INVOICE on LEASE.leaseNumber = LEASE_INVOICE.leaseNumber inner join INVOICE on LEASE_INVOICE.invoiceNumber = INVOICE.invoiceNumber where STUDENT.studentNumber = '0001';");
//			} catch (SQLException e) {
//				
//				e.printStackTrace();
//			}
			
			frame.getContentPane().removeAll();
			conditionA_label = new JLabel("Please input the student number you want to search");
			conditionA_text = new JTextField(30);
			conditionA_button = new JButton("Search");
			conditionA_button.addActionListener(this);

			panelA = new JPanel();
			panelB = new JPanel();
			panel = new JPanel();
			
			panelA.add(conditionA_label);
			panelA.add(conditionA_text);
			panelB.add(conditionA_button);
			panelB.add(back_button);
			panel.add(panelA);
			panel.add(panelB);
			frame.add(panel);
			frame.setVisible(false);
			frame.setVisible(true);
		}	
			
		else if(event.getSource() == queryChoice[4] && event.getStateChange() == ItemEvent.SELECTED) {
//			try {
//				new Connect("select STUDENT.studentNumber, studentName from STUDENT inner join STUDENT_LEASE on STUDENT.studentNumber = STUDENT_LEASE.studentNumber inner join LEASE on STUDENT_LEASE.leaseNumber = LEASE.leaseNumber inner join LEASE_INVOICE on LEASE.leaseNumber = LEASE_INVOICE.leaseNumber inner join INVOICE on LEASE_INVOICE.invoiceNumber = INVOICE.invoiceNumber where INVOICE.dateOfPayment IS null;");
//			} catch (SQLException e9) {
//				
//				e9.printStackTrace();
//			}
			
			frame.getContentPane().removeAll();
			conditionB_label = new JLabel("Please input the date you want to search");
			conditionB_text = new JTextField(30);
			conditionB_button = new JButton("Search");
			conditionB_button.addActionListener(this);

			panelA = new JPanel();
			panelB = new JPanel();
			panel = new JPanel();
			
			panelA.add(conditionB_label);
			panelA.add(conditionB_text);
			panelB.add(conditionB_button);
			panelB.add(back_button);
			panel.add(panelA);
			panel.add(panelB);
			frame.add(panel);
			frame.setVisible(false);
			frame.setVisible(true);
		}
		else if(event.getSource() == queryChoice[5] && event.getStateChange() == ItemEvent.SELECTED)
			try {
				new Connect("select * from STAFF_STUDENT_FLAT_INSPECTION where isSatisfactory = 'NO';");
			} catch (SQLException e8) {
				
				e8.printStackTrace();
			}
		else if(event.getSource() == queryChoice[6] && event.getStateChange() == ItemEvent.SELECTED)
			try {
				new Connect("(select STUDENT.studentNumber, studentName, BEDROOM.roomNumber, BEDROOM.placeNumber from STUDENT inner join STUDENT_BEDROOM on STUDENT.studentNumber = STUDENT_BEDROOM.studentNumber inner join BEDROOM on STUDENT_BEDROOM.placeNumber = BEDROOM.placeNumber) UNION (select STUDENT.studentNumber, studentName, SINGLE_ROOM.roomNumber,SINGLE_ROOM.placeNumber from STUDENT inner join STUDENT_SINGLE_ROOM on STUDENT.studentNumber = STUDENT_SINGLE_ROOM.studentNumber inner join SINGLE_ROOM on STUDENT_SINGLE_ROOM.placeNumber = SINGLE_ROOM.placeNumber);");
			} catch (SQLException e7) {
				
				e7.printStackTrace();
			}
		else if(event.getSource() == queryChoice[7] && event.getStateChange() == ItemEvent.SELECTED)
			try {
				new Connect("select * from STUDENT where currentStatus = 'Waiting';");
			} catch (SQLException e6) {
				
				e6.printStackTrace();
			}
		else if(event.getSource() == queryChoice[8] && event.getStateChange() == ItemEvent.SELECTED)
			try {
				new Connect("select category, count(studentNumber) from STUDENT group by category;");
			} catch (SQLException e5) {
				
				e5.printStackTrace();
			}
		else if(event.getSource() == queryChoice[9] && event.getStateChange() == ItemEvent.SELECTED)
			try {
				new Connect("select Student.studentNumber, studentName from STUDENT left join STUDENT_NEXT_OF_SKIN on STUDENT.studentNumber = STUDENT_NEXT_OF_SKIN.studentNumber where relation IS null;");
			} catch (SQLException e4) {
				
				e4.printStackTrace();
			}
		else if(event.getSource() == queryChoice[10] && event.getStateChange() == ItemEvent.SELECTED) {
//			try {
//				new Connect("select ADVISOR.advisorName, internalTelephoneNumber from STUDENT inner join STUDENT_ADVISOR on STUDENT.studentNumber = STUDENT_ADVISOR.studentNumber inner join ADVISOR on STUDENT_ADVISOR.advisorName = ADVISOR.advisorName where STUDENT.studentNumber = '0001';");
//			} catch (SQLException e3) {
//				
//				e3.printStackTrace();
//			}
			
			frame.getContentPane().removeAll();
			conditionC_label = new JLabel("Please input the student number you want to search");
			conditionC_text = new JTextField(30);
			conditionC_button = new JButton("Search");
			conditionC_button.addActionListener(this);

			panelA = new JPanel();
			panelB = new JPanel();
			panel = new JPanel();
		
			panelA.add(conditionC_label);
			panelA.add(conditionC_text);
			panelB.add(conditionC_button);
			panelB.add(back_button);
			panel.add(panelA);
			panel.add(panelB);
			frame.add(panel);
			frame.setVisible(false);
			frame.setVisible(true);
		}
			
		else if(event.getSource() == queryChoice[11] && event.getStateChange() == ItemEvent.SELECTED)
			try {
				new Connect("select max(rentRate) AS 'maximum rent rate', min(rentRate) AS 'minimum rent rate', avg(rentRate) AS 'averge rent rate' from SINGLE_ROOM;");
			} catch (SQLException e2) {
				
				e2.printStackTrace();
			}
		else if(event.getSource() == queryChoice[12] && event.getStateChange() == ItemEvent.SELECTED)
			try {
				new Connect("select hallName, count(hallName) AS 'number of room' from HALL_OF_RESIDENCE_SINGLE_ROOM group by hallName;");
			} catch (SQLException e1) {
				
				e1.printStackTrace();
			}
		else if(event.getSource() == queryChoice[13] && event.getStateChange() == ItemEvent.SELECTED)
			try {
				new Connect("select staffNumber,staffName, year( from_days( datediff( now( ), birthDay))) AS 'age', location from STAFF where year( from_days( datediff( now( ), birthDay))) > 60;");
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
	}
	
	public void function_button() {
		frame.getContentPane().removeAll();
		functionQuery[0] = new JButton("Search student detail");
		functionQuery[1] = new JButton("Course of classroom");
		functionQuery[2] = new JButton("The detail of student who lives in the particular flat room");
		panelA = new JPanel();
		
		for (int i = 0; i <= 2; i++) {
			functionQuery[i].addActionListener(this);
			panelA.add(functionQuery[i]);
		}
		
		//back_button = new JButton("Go back to the initialize interface.");
		back_button.addActionListener(this);
		panelA.add(back_button);
		frame.getContentPane().add(panelA); 
		frame.setVisible(false);
		frame.setVisible(true);
	}
	
	public void functionA() {
		frame.getContentPane().removeAll();
		functionA_label = new JLabel("Input the student number of stduent you want to search:");
		functionA_text = new JTextField(30);
		functionA_button = new JButton("Search");
		functionA_button.addActionListener(this);
		
		panelA = new JPanel();
		panelA.add(functionA_label);
		panelA.add(functionA_text);
		panelA.add(functionA_button);
		panelA.add(back_button);
		frame.add(panelA);
		frame.setVisible(false);
		frame.setVisible(true);
		
	}
	
	public void functionB() {
		frame.getContentPane().removeAll();
		functionB_label = new JLabel("Input the number of course you want to search:");
		functionB_text = new JTextField(30);
		functionB_button = new JButton("Search");
		functionB_button.addActionListener(this);
		
		panelA = new JPanel();
		panelA.add(functionB_label);
		panelA.add(functionB_text);
		panelA.add(functionB_button);
		panelA.add(back_button);
		frame.add(panelA);
		frame.setVisible(false);
		frame.setVisible(true);
	}

	public void functionC() {
		frame.getContentPane().removeAll();
		functionC1_label = new JLabel("Input the flat number you want to search:");
		functionC2_label = new JLabel("Input the single room number of flat you want to search:");
		functionC1_text = new JTextField(30);
		functionC2_text = new JTextField(30);
		functionC_button = new JButton("Search");
		functionC_button.addActionListener(this);
		
		panelA = new JPanel();
		panelB = new JPanel();
		panelC = new JPanel();
		panel = new JPanel();
		panel.setLayout(new GridLayout(0,1));
		panelA.add(functionC1_label);
		panelA.add(functionC1_text);
		panelB.add(functionC2_label);
		panelB.add(functionC2_text);
		panelC.add(functionC_button);
		panelC.add(back_button);
		panel.add(panelA);
		panel.add(panelB);
		panel.add(panelC);
		frame.add(panel);
		frame.setVisible(false);
		frame.setVisible(true);
	}
	
	public void search_button() {
		frame.getContentPane().removeAll();
		search_label = new JLabel("Please input what you want to search");
		search_text = new JTextField(30);
		searchConfirm_button = new JButton("Search");
		searchConfirm_button.addActionListener(this);
		
		panelA = new JPanel();
		panelB = new JPanel();
		panel = new JPanel();
		
		panelA.add(search_label);
		panelA.add(search_text);
		panelB.add(searchConfirm_button);
		back_button.addActionListener(this);
		panelB.add(back_button);
		panel.add(panelA);
		panel.add(panelB);
		frame.add(panel);
		frame.setVisible(false);
		frame.setVisible(true);
		
	}
	
	public void back_button() {
		frame.getContentPane().removeAll();
		create();
		frame.setVisible(false);
		frame.setVisible(true);
	}
}
