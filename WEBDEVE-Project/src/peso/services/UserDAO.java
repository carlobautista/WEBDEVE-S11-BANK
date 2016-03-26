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
	
	public ArrayList<Account> getUserAccounts(int idUser){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps;
		
		try {
			ps = conn.prepareStatement("SELECT * FROM webdeve.account WHERE idUser ="+idUser);
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
}
