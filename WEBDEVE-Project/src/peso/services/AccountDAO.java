package peso.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
}
