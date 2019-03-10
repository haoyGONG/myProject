import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Random;
import javax.swing.*;
/**
 * This class generate the GUI of Math Teacher.
 * @since 9.0
 * @author Haoyan Gong
 * @version 1.0
 * 
 */
public class CreatGUI {								   
	JFrame frame = new JFrame("Math Teather"); 
	JPanel panel = new JPanel();
	JTextField in = new JTextField(10);
	JButton btn = new JButton("Press for answer");
	JButton[] numKeyPad = new JButton[12];
	JLabel quest = new JLabel();
	JLabel out = new JLabel("                        Judge");
	JLabel questNum = new JLabel();
	JLabel rightAnswer = new JLabel("               The right answer");
	
	//Put the symbol in the character array 
	//and take it out with the generated random number
	final static char[] op = { '+', '-', '*', '/' };      
													   
	Random rand = new Random();
	int Num1 = 0;
	int Num2 = 0;
	int Opnum = 0;
	int correctNum = 0, totalNum = 0;
	
	//Instantiation the CreatNewNum class
	CreatNewNum CNN = new CreatNewNum();	
	
/**
 * Constructor
 * Initialization the class.
 * 
 */
	public CreatGUI() {
		
		//Call the resetNum method which is in CreatNewNum class 
		CNN.resetNum();								  
		Num1 = CNN.getNum1();
		Num2 = CNN.getNum2();
		Opnum = CNN.getOp();
		
		//Generate the UI and put the components in
		quest.setText("      Question         " + Num1 + "   " + op[Opnum] + "   " + Num2 + "      =");
		questNum.setText("               " + correctNum + " correct out of " + totalNum);
		
		//Set the layout
		panel.setLayout(new GridLayout(6,3,5,5));                  
		panel.add(quest);
		panel.add(in);
		panel.add(btn);
		panel.add(rightAnswer);
		panel.add(out);
		panel.add(questNum);
		
		//Set calculate keyboard button
		for (int i = 1; i < 10; i++) { 								
			numKeyPad[i] = new JButton(String.valueOf(i));
			panel.add(numKeyPad[i]);
			numKeyPad[i].addActionListener(new NKPAction(i));
		}
		
		numKeyPad[11] = new JButton("-");
		panel.add(numKeyPad[11]);
		numKeyPad[11].addActionListener(new NKPAction(11));
		numKeyPad[0] = new JButton("0");
		panel.add(numKeyPad[0]);
		numKeyPad[0].addActionListener(new NKPAction(0));
		numKeyPad[10] = new JButton("Delete");
		panel.add(numKeyPad[10]);
		numKeyPad[10].addActionListener(new NKPAction(10));
		btn.addActionListener(new BtnAction());
		frame.getContentPane().add(panel);
		frame.setSize(600, 400);
		frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
		frame.setVisible(true);
	}
	
	/**
	 * This class monitor the action of the button "Press for answer".
	 * @since 9.0
	 * @author Haoyan Gong
	 * @version 1.0
	 * 
	 */

	class BtnAction implements ActionListener {						
		/**
		 * This method determine the action of button "Press for answer" after being pressed.
		 * @param e The action of being pressed.
		 * 
		 */
		public void actionPerformed(ActionEvent e) {
			int J = Judge(Opnum, Num1, Num2);
			
			//If the input is correct
			if (J == 10000) {										
				out.setText("You are correct, please do next");
				rightAnswer.setText("         The right answer is " + in.getText());
				CNN.resetNum();
				Num1 = CNN.getNum1();
				Num2 = CNN.getNum2();
				Opnum = CNN.getOp();
				quest.setText("      Question         " + Num1 + "   " + op[Opnum] + "   " + Num2 + "      =");
				correctNum++;
				totalNum++;
				questNum.setText("               " + correctNum + " correct out of " + totalNum);
				in.setText(null);
			}
			
			//If the input is not correct
			else if (J != 10000 && J != 10001 && J != 10002) {				
				out.setText("You are incorrect, please do next");
				rightAnswer.setText("         The right answer is " + J);
				CNN.resetNum();
				Num1 = CNN.getNum1();
				Num2 = CNN.getNum2();
				Opnum = CNN.getOp();
				quest.setText("      Question         " + Num1 + "   " + op[Opnum] + "   " + Num2 + "      =");
				totalNum++;
				questNum.setText("               " + correctNum + " correct out of " + totalNum);
				in.setText(null);
			}
			
			else if(J == 10002) {
				questNum.setText(null);
				rightAnswer.setText(null);
				out.setText("Invalid input!!!");
			}
		}
	}
	
	/**
	 * This class monitor the action of the buttons of number keypad.
	 * @since 9.0
	 * @author Haoyan Gong
	 * @version 1.0
	 * 
	 */
	class NKPAction implements ActionListener {				//Give the function of calculate keyboard button 
		int c;
		
		/**
		 * Constructor
		 * Initialization the class NKPAction.
		 * 
		 */
		public NKPAction(int i) {
			c = i;
		}
		
		/**
		 * This method determine the action of button of number keypad after being pressed.
		 * @param e The action of being pressed.
		 * 
		 */
		public void actionPerformed(ActionEvent e) {
			String s = null;
			if(c == 0) {
				s = in.getText();
				in.setText(s + "0");
			}else if(c ==1) {
				s = in.getText();
				in.setText(s + "1");
			}else if(c ==2) {
				s = in.getText();
				in.setText(s + "2");
			}else if(c ==3) {
				s = in.getText();
				in.setText(s + "3");
			}else if(c ==4) {
				s = in.getText();
				in.setText(s + "4");
			}else if(c ==5) {
				s = in.getText();
				in.setText(s + "5");
			}else if(c ==6) {
				s = in.getText();
				in.setText(s + "6");
			}else if(c ==7) {
				s = in.getText();
				in.setText(s + "7");
			}else if(c ==8) {
				s = in.getText();
				in.setText(s + "8");
			}else if(c == 9){
				s = in.getText();
				in.setText(s + "9");
			}else if(c == 10){
				s = in.getText();
				if(!s.equals("")) {
					s = s.substring(0, s.length() - 1);
					in.setText(s);
				}
			}else {
				s = in.getText();
				in.setText(s + "-");
			}
			
				
		}

	}
	
	/**
	 * This method judge the answers of user if is correct.
	 * @param o The operation sign of the question. 
	 * @param n1 The first number of the question.
	 * @param n2 The second number of the question.
	 * @return The number.
	 * 
	 */
	public int Judge(int o, int n1, int n2) { 				
		int num1 = n1, num2 = n2, opnum = o;
		String s = in.getText();			
		
		//The null input is excluded
		if(!s.equals("")) {
			
			//Call the method that judge whether the input is number
			boolean bool = isNumeric(s);
			if (bool) {							
				int answer = Integer.parseInt(s);
				
				if(answer > 100 || answer < -9) {
					return 10002;
				}
				
				else {
					// Judge the answer
					if (opnum == 0) { 						
						if (answer == num1 + num2)
							return 10000;
						else
							return num1 + num2;
					} else if (opnum == 1) {
						if (answer == num1 - num2)
							return 10000;
						else
							return num1 - num2;
					} else if (opnum == 2) {
						if (answer == num1 * num2)
							return 10000;
						else
							return num1 * num2;
					} else {
						if (answer == num1 / num2)
							return 10000;
						else
							return num1 / num2;
					}
				}
				
				
			} else
				return 10001;
		}
		else
			return 10001;
	}
	/**
	 * This method judge the input of user if is number but not characters.
	 * @param str The input of the user. 
	 * @return True or false.
	 * 
	 */
	public static boolean isNumeric(String str){						
	    if(str.charAt(0) == 45) {
	    	for(int i = str.length(); --i>0; ){
		        int chr=str.charAt(i);
		        if(chr < 48 || chr > 57)
		            return false;
		    }
	    }
	    else {
	    	for(int i = str.length(); --i>=0; ){
	        int chr=str.charAt(i);
	        if(chr < 48 || chr > 57)
	            return false;
	    	}
	    }
		
	   return true;
	}   
}
