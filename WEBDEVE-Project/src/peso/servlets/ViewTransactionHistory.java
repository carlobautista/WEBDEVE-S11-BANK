package peso.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import peso.dto.Account;
import peso.dto.Transaction;
import peso.services.TransactionDAO;
import peso.services.UserDAO;

/**
 * Servlet implementation class ViewTransactionHistory
 */
@WebServlet("/ViewTransactionHistory")
public class ViewTransactionHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewTransactionHistory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		processRequest(request, response);
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		UserDAO userDAO = new UserDAO();
		
		final String username = (String)request.getSession().getAttribute("username");
		final int userId = userDAO.getIdUser(username);
		
		ArrayList<Transaction> transactionHistory = TransactionDAO.getTransactionHistoryByUserId(userId);
		
		request.setAttribute("transactionHistory", transactionHistory);
		
		request.getRequestDispatcher("transaction-history.jsp").forward(request, response);
	}

}
