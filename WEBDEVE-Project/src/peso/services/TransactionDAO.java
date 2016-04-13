package peso.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import peso.db.DBConnection;
import peso.dto.Transaction;

public class TransactionDAO {
	
	public static boolean addTransaction(Transaction transaction){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps;
		
		try {
			ps = conn.prepareStatement("INSERT INTO transaction(idUser, idAccount, accountName, postingDate, description, amount, type, runningBalance) VALUES(?, ?, ?, CURDATE(), ?, ?, ?, ?)");
			
			ps.setInt(1, transaction.getIdUser());
			ps.setInt(2, transaction.getIdAccount());
			ps.setString(3, transaction.getAccountName());
			ps.setString(4, transaction.getDescription());
			ps.setInt(5, transaction.getAmount());
			ps.setString(6, transaction.getType());
			ps.setInt(7, transaction.getRunningBalance());
			
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
