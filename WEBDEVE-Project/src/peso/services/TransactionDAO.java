package peso.services;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import peso.db.DBConnection;
import peso.dto.Account;
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
	
	public static ArrayList<Transaction> getTransactionHistoryByUserId(int userId){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps;
		
		try {
			ps = conn.prepareStatement("SELECT * FROM transaction WHERE idUser=?");
			ps.setInt(1, userId);
			
			ArrayList<Transaction> transactionHistory = new ArrayList<>();
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				transactionHistory.add(new Transaction(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getDate(5), rs.getString(6), rs.getInt(7), rs.getString(8), rs.getInt(9)));
			}
			rs.close();
			ps.close();
			conn.close();
			
			return transactionHistory;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			return null;
		}
	}

}
