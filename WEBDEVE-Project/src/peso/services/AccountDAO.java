package peso.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import peso.db.DBConnection;
import peso.dto.Account;

public class AccountDAO {
	
	public static boolean addAccount(Account account){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps;
		
		try {
			ps = conn.prepareStatement("INSERT INTO account(idUser,name,type,balance) VALUES(?,?,?,?)");
			
			ps.setInt(1, account.getIdUser());
			ps.setString(2, account.getName());
			ps.setString(3, account.getType());
			ps.setInt(4, account.getBalance());
			
			ps.executeUpdate();
			
			ps.close();
			conn.close();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	public static ArrayList<Account> getBillers(){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps;
		
		try {
			ps = conn.prepareStatement("SELECT * FROM account WHERE type='biller'");
			
			ArrayList<Account> billersList = new ArrayList<>();
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				billersList.add(new Account(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5)));
			}
			rs.close();
			ps.close();
			conn.close();
			return billersList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			return null;
		}
	}
	
	
}
