import java.util.Random;

/**
 * This class generate the new numbers.
 * @since 9.0
 * @author Haoyan Gong
 * @version 1.0
 * 
 */
public class CreatNewNum {			
	Random rand = new Random();
	private int Num1 = 0;
	private int Num2 = 1;
	private int Opnum = 0;
	
	/**
	 * This method reset the number randomly.
	 * 
	 */
	public void resetNum() {      
		
		//Generate the sign of operation first
		Opnum = rand.nextInt(4);
		
		//If generate the subtraction, we should control the result is non-negative
		if(Opnum == 1) {                           
			Num1 = rand.nextInt(10) + 1;
			Num2 = rand.nextInt(10) + 1;	
		}
		
		//If generate the division, we should control the result is integer
		else if(Opnum == 3) {                      
			Num1 = 20;
			while(Num1 > 10) {
				Num1 = rand.nextInt(10) + 1;
				Num2 = rand.nextInt(10) + 1;
				Num1 = Num1 * Num2;
			}
			
		}
		
		//The others two sign of operations don't need condition
		else {                                     
			Num1 = rand.nextInt(10) + 1;
			Num2 = rand.nextInt(10) + 1;
		}
	}
	
	/**
	 * This method return the first number.
	 * @return The value of Num1.
	 * 
	 */	
	public int getNum1() {                           
		//Return Num1
		return Num1;
	}
	
	/**
	 * This method return the second number.
	 * @return The value of Num2.
	 * 
	 */
	public int getNum2() {							  
		//Return Num2
		return Num2;
	}
	
	/**
	 * This method return the number of operation sign.
	 * @return The value of Opnum.
	 * 
	 */
	public int getOp() {							  
		//Return Opnum
		return Opnum;
	}
	
	
}
