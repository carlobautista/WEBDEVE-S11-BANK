package peso.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import peso.db.DBConnection;
import peso.dto.User;

public class Registrar {
	public Registrar(){}
	
	public static boolean isUsernameValid(User a){ //false=username exists, true=doesnt exist{
		Connection conn = DBConnection.getConnection();
		PreparedStatement stmt;
		
		try{
			stmt = (PreparedStatement) conn.prepareStatement("SELECT * FROM user WHERE username=?");
			stmt.setString(1, a.getUsername());
			ResultSet rs = stmt.executeQuery();
			
			if(rs.next()){
				rs.close();
				stmt.close();
				conn.close();
				
				return false;
			}
			else{
				rs.close();
				stmt.close();
				conn.close();
				
				return true;
			}
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
	}
	
	public static boolean isEmailValid(User a){ //false=email exists, true=doesnt exist{
		Connection conn = DBConnection.getConnection();
		PreparedStatement stmt;
		
		try{
			stmt = (PreparedStatement) conn.prepareStatement("SELECT * FROM user WHERE emailAddress=?");
			stmt.setString(1, a.getEmail());
			ResultSet rs = stmt.executeQuery();
			
			if(rs.next()){
				rs.close();
				stmt.close();
				conn.close();
				
				return false;
			}
			else{
				rs.close();
				stmt.close();
				conn.close();
				
				return true;
			}
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
	}
	
	public static boolean isCredentialsValid(String username, String password){
		Connection conn = DBConnection.getConnection();
		PreparedStatement stmt;
		boolean valid = false;
		
		try{
			stmt = conn.prepareStatement("SELECT * FROM user WHERE username=? AND password=?");
			stmt.setString(1, username);
			stmt.setString(2, password);
			ResultSet rs = stmt.executeQuery();
			
			if(rs.next())
				valid = true;
			
			rs.close();
			stmt.close();
			conn.close();
			
			return valid;
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
	}
	
	public static boolean addAccount(User a){
		Connection conn = DBConnection.getConnection();
		PreparedStatement stmt;
		
		try{
			if(isUsernameValid(a) && isEmailValid(a)){
				stmt=(PreparedStatement) conn.prepareStatement
						("INSERT INTO user(username, password, firstName, lastName, emailAddress, mobileNumber, gender)"
						+ " VALUES (?,?,?,?,?,?,?)");

				stmt.setString(1, a.getUsername());
				stmt.setString(2, a.getPassword());
				stmt.setString(3, a.getFirstName());
				stmt.setString(4, a.getLastName());
				stmt.setString(5, a.getEmail());
				stmt.setString(6, a.getMobileNum());
				//birthdate
				stmt.setString(7, a.getGender());
				
				stmt.executeUpdate();
				stmt.close();
				conn.close();
				
				return true;
			}
			else
				return false;
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
	}
}
