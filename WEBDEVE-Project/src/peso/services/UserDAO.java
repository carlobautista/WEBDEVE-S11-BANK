package peso.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
				accountList.add(new Account(rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5)));	
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
}
