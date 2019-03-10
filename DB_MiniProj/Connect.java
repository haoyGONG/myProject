package coursework;

import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.*;
import java.util.*;

import javax.swing.*;

public class Connect extends JFrame {
	Connection connection;
	Statement statement;
	ResultSet resultSet;
	ResultSetMetaData metaData;
	Vector columnNames;
	Vector rows;
	
	// Enter your database information
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://127.0.0.1:3306/coursework";
	String username = "root";
	String password = "981216";

	JTable table;
	JTextArea inputQuery;
	JButton submitQuery;

	public Connect() {

	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Connect(String s) throws SQLException{
		
		// Load the driver
		loadDriver();
		connection = getConnection();
		// SQL statement
		statement = connection.createStatement();
		resultSet = statement.executeQuery(s);
		//columnNames = new ArrayList<>();
		//rows = new ArrayList<>();
		boolean moreRecord = resultSet.next();
		if(!moreRecord) {
			JOptionPane.showMessageDialog( this,
					"No records of results" );
			setTitle( "No record shows" );
			return;
		}
		else {
			metaData = resultSet.getMetaData();
			columnNames = new Vector();
			rows = new Vector();
			//for(int i=1; i <= metaData.getColumnCount(); i++)
				//columnNames.addElement(metaData.getColumnName(i));
			for ( int i = 1; i <= metaData.getColumnCount(); ++i )
				columnNames.addElement(metaData.getColumnName( i ) );
			do {
				Vector currentRow = new Vector();
				for ( int i = 1; i <= metaData.getColumnCount(); i++ ) {
					 currentRow.addElement(resultSet.getString( i ));
				}
				rows.addElement(currentRow);
			}while(resultSet.next());
		}
		//String test = s;
		//inputQuery = new JTextArea( test, 4, 30 );
		//submitQuery = new JButton( "Query" );
		
		table = new JTable(rows, columnNames);
		
		JScrollPane scroller = new JScrollPane( table );
		
		//JPanel topPanel = new JPanel();
		//topPanel.setLayout( new BorderLayout() );
		//topPanel.add( new JScrollPane( inputQuery), BorderLayout.CENTER );
		//topPanel.add( submitQuery, BorderLayout.SOUTH );
		//table = new JTable();
		Container c = getContentPane();
		c.setLayout( new BorderLayout() );
		//c.add( topPanel, BorderLayout.NORTH );
		c.add( scroller, BorderLayout.CENTER );
		setSize( 800, 500 );
		show();
	}
	
	/**
    * load driver
    */
	public void loadDriver() {
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
        	System.err.println("can not load jdbc driver");
        	e.printStackTrace();
        }
    }

	/**
     * get connection
     *
     * @return
     */
	public Connection getConnection() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
        	System.err.println("get connection failure");
        	e.printStackTrace();
        }
        return conn;
    }

    /**
     * close connection
     * @param conn
     */
    public void closeConnection(Connection conn) {
        if(conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
            	System.err.println("close connection failure");
            	e.printStackTrace();
            }
        }
    }
}
