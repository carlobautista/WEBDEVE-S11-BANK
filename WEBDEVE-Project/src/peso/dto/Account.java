package peso.dto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import peso.db.DBConnection;

public class Account {
	private int idUser;
	private String name;
	private String type;
	private int balance;
	
	public Account(int idUser, String name, String type, int balance){
		this.idUser = idUser;
		this.name = name;
		this.type = type;
		this.balance = balance;
	}

	public int getIdUser() {
		return idUser;
	}

	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}
	
	public int getIdAccount(){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps;
		int idAccount = 0;
		
		try{
			ps = conn.prepareStatement("SELECT * FROM webdeve.account WHERE name = "+ getName());
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				idUser = rs.getInt(1);
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
}
