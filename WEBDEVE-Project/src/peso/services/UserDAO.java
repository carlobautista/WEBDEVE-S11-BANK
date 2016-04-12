package peso.services;

import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import peso.db.DBConnection;
import peso.dto.Account;

public class UserDAO {
	public UserDAO(){}
	
	public ArrayList<Account> getUserAccounts(String username){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps;
		int idUser = getIdUser(username);
		
		try {
			ps = conn.prepareStatement("SELECT * FROM webdeve.account WHERE idUser =?");
			ps.setInt(1, idUser);
			
			ArrayList<Account> accountList = new ArrayList<>();
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				accountList.add(new Account(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5)));	
			}
			rs.close();
			ps.close();
			conn.close();
			return accountList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			return null;
		}
	}
	

	
	public int getIdUser(String username){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps;
		int idUser = 0;
		
		try{
			ps = conn.prepareStatement("SELECT * FROM webdeve.user WHERE username =?");
			ps.setString(1, username);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				idUser = rs.getInt(1);
			}
			rs.close();
			ps.close();
			conn.close();
			
			return idUser;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			return 0;
		}
	}
	
	public static int getIdAccount(String acctName){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps;
		int idAccount = 0;
		
		try{
			ps = conn.prepareStatement("SELECT * FROM webdeve.account WHERE name =?");
			ps.setString(1, acctName);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				idAccount = rs.getInt(1);
			}
			rs.close();
			ps.close();
			conn.close();
			
			return idAccount;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			return 0;
		}
	}
	
	public static boolean deleteUser(String acctName){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps;
		int idAccount = getIdAccount(acctName);
		
		try{
			ps = conn.prepareStatement("DELETE FROM account WHERE idAccount = ?");
			ps.setInt(1, idAccount);
			
			ps.executeUpdate();
			ps.close();
			conn.close();
			
			return true;
		} catch(SQLException e){
			e.printStackTrace();
			return false;
		}
	}
	
	public static int getBalanceById(int idAccount){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps;
		int balance = -1;
		
		try{
			ps = conn.prepareStatement("SELECT balance "
					+"FROM account "
					+"WHERE idAccount = ?");
			ps.setInt(1, idAccount);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				balance = rs.getInt(1);
			}
			rs.close();
			ps.close();
			conn.close();
			
			return balance;
		} catch(SQLException e){
			e.printStackTrace();
			return -1;
		}
	}
	
	public static String getUserName(String username){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps;
		String name="";
		
		try{
			ps = conn.prepareStatement("SELECT firstName, lastName "
					+"FROM user "
					+"WHERE username = ?");
			ps.setString(1, username);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				name = rs.getString(1)+" "+rs.getString(2);
			}
			rs.close();
			ps.close();
			conn.close();
		} catch(SQLException e){
			e.printStackTrace();
		}
		
		return name;
	}
	
	public static String getNameById(int idAccount){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps;
		String name="";
		
		try{
			ps = conn.prepareStatement("SELECT name "
					+"FROM account "
					+"WHERE idAccount = ?");
			ps.setInt(1, idAccount);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				name = rs.getString(1);
			}
			rs.close();
			ps.close();
			conn.close();
		} catch(SQLException e){
			e.printStackTrace();
		}
		
		return name;
	}
	
	public static boolean sendMoney(int receivingAcct, int sendingAcct, int amt){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps;
		
		try{
			if(getBalanceById(sendingAcct) >= amt && getBalanceById(sendingAcct) >= 0){
				ps = conn.prepareStatement("UPDATE account "
						+"SET balance=balance-? "
						+"WHERE idAccount=? ");
				ps.setInt(1, amt);
				ps.setInt(2, sendingAcct);
				ps.executeUpdate();
				
				ps = conn.prepareStatement("UPDATE account "
						+"SET balance=balance+? " 
						+"WHERE idAccount=? ");
				ps.setInt(1, amt);
				ps.setInt(2, receivingAcct);
				ps.executeUpdate();
				
				ps.close();
				conn.close();
				
				return true;
			}
			else{
				return false;
			}
		} catch(SQLException e){
			e.printStackTrace();
			return false;
		}
	}
	
	public static String getEmailByUsername(String username){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps;
		String email="";
		
		try{
			ps = conn.prepareStatement("SELECT emailAddress "
					+"FROM user "
					+"WHERE username = ?");
			ps.setString(1, username);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				email = rs.getString(1);
			}
			rs.close();
			ps.close();
			conn.close();
		} catch(SQLException e){
			e.printStackTrace();
		}
		
		return email;
	}
	
	public static void eMailOTP(String otp, String username){
		// TODO Auto-generated method stub
		// Recipient's email ID needs to be mentioned.
	      String to = getEmailByUsername(username);

	      // Sender's email ID needs to be mentioned
	      final String from = "peso.online.bank@gmail.com";
		  final String password = "pesoadmin";

	      // Assuming you are sending email from localhost
	      //String host = "localhost";

			Properties props = new Properties();
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");

	      // Get the default Session object.
	      Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			  protected PasswordAuthentication getPasswordAuthentication(){
				  return new PasswordAuthentication(from, password);
			  }
		  });

	      try{
	         // Create a default MimeMessage object.
	         Message message = new MimeMessage(session);

	         // Set From: header field of the header.
	         message.setFrom(new InternetAddress(from));

	         // Set To: header field of the header.
	         message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

	         // Set Subject: header field
	         message.setSubject("Peso Online Bank Login");

	         // Now set the actual message
	         message.setText("Your One-Time Password (OTP) is "+otp+". This OTP is only valid for 5 minutes.");

	         // Send message
	         Transport.send(message);
	      }catch (MessagingException mex) {
	         mex.printStackTrace();
	      }
	}
	
	public static boolean storeOTP(String otp, String username){
		Connection conn = DBConnection.getConnection();
		PreparedStatement stmt;
		
		Calendar calDate = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currDate = sdf.format(calDate.getTime());
		long currentTime = calDate.getTimeInMillis();
		calDate.setTimeInMillis(currentTime + (5*60000));
		String expDate = sdf.format(calDate.getTime());
		
		try{
				stmt=(PreparedStatement) conn.prepareStatement
						("INSERT INTO otp(otp, username, date_created, expiry_date)"
						+ " VALUES (?,?,?,?)");

				stmt.setString(1, otp);
				stmt.setString(2, username);
				stmt.setString(3, currDate);
				stmt.setString(4, expDate);
				
				stmt.executeUpdate();
				stmt.close();
				conn.close();
				return true;
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
	}
	
	public static String generateOTP(String username){
		String AB = "0123456789";
		int length = 8;
			
		
		SecureRandom rnd = new SecureRandom();
		StringBuilder stringBuilder = new StringBuilder(length);
		for( int i = 0; i < length; i++ ){
			if(i == 0)
				stringBuilder.append(AB.charAt(1+(rnd.nextInt(AB.length()-1))));
			else
				stringBuilder.append(AB.charAt(rnd.nextInt(AB.length())));
		}
		String otp = stringBuilder.toString();
		stringBuilder.setLength(0);
		
		storeOTP(otp, username);
		eMailOTP(otp, username);
		
		return otp;
	}
}
