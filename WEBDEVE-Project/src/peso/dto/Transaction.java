package peso.dto;

import java.sql.Date;

public class Transaction {
	int idTransaction;
	int idUser;
	int idAccount;
	String accountName;
	java.sql.Date postingDate;
	String description;
	int amount;
	String type;
	int runningBalance;
	
	public Transaction(int idTransaction, int idUser, int idAccount, String accountName, Date postingDate,
			String description, int amount, String type, int runningBalance) {
		super();
		this.idTransaction = idTransaction;
		this.idUser = idUser;
		this.idAccount = idAccount;
		this.accountName = accountName;
		this.postingDate = postingDate;
		this.description = description;
		this.amount = amount;
		this.type = type;
		this.runningBalance = runningBalance;
	}

	public Transaction(int idUser, int idAccount, String accountName, String description, int amount, String type,
			int runningBalance) {
		super();
		this.idUser = idUser;
		this.idAccount = idAccount;
		this.accountName = accountName;
		this.description = description;
		this.amount = amount;
		this.type = type;
		this.runningBalance = runningBalance;
	}

	public int getIdTransaction() {
		return idTransaction;
	}

	public void setIdTransaction(int idTransaction) {
		this.idTransaction = idTransaction;
	}

	public int getIdUser() {
		return idUser;
	}

	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}

	public int getIdAccount() {
		return idAccount;
	}

	public void setIdAccount(int idAccount) {
		this.idAccount = idAccount;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public java.sql.Date getPostingDate() {
		return postingDate;
	}

	public void setPostingDate(java.sql.Date postingDate) {
		this.postingDate = postingDate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getRunningBalance() {
		return runningBalance;
	}

	public void setRunningBalance(int runningBalance) {
		this.runningBalance = runningBalance;
	}
	
	
}
