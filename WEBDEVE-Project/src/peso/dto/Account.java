package peso.dto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import peso.db.DBConnection;

public class Account {
	private int idAccount;
	private int idUser;
	private String name;
	private String type;
	private int balance;
	
	public Account(int idAccount, int idUser, String name, String type, int balance){
		this.idAccount = idAccount;
		this.idUser = idUser;
		this.name = name;
		this.type = type;
		this.balance = balance;
	}

	public int getIdAccount() {
		return idAccount;
	}

	public void setIdAccount(int idAccount) {
		this.idAccount = idAccount;
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
}
