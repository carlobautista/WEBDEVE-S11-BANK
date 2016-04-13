package peso.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import peso.dto.Transaction;
import peso.services.TransactionDAO;
import peso.services.UserDAO;

/**
 * Servlet implementation class PayBills
 */
@WebServlet("/PayBills")
public class PayBills extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayBills() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		final String payingName = request.getParameter("payingAcct");
		final int payingAcct = UserDAO.getIdAccount(payingName);
		final String billerName = request.getParameter("billerAcct");
		final int destAcct = UserDAO.getIdAccount(billerName);
		final int amount = Integer.parseInt(request.getParameter("amount"));
		
		String description = "";
		String type = "";
		
		int currentBalance = 0;
		
		UserDAO userDAO = new UserDAO();
		
		int userId = userDAO.getIdUser(request.getSession().getAttribute("username").toString());

		if(UserDAO.sendMoney(destAcct, payingAcct, amount)){
			request.setAttribute("message", "The money was successfuly paid to the biller.");
			
			// After transaction put to table transaction in mysql
			currentBalance = UserDAO.getBalanceById(payingAcct);
			description = "You have payed your bills to "+ UserDAO.getNameById(destAcct) + " with a total amount of PHP" + amount + " from [" + payingName + "]";
			type="Credit";
			Transaction currentTransaction = new Transaction(userId, payingAcct, payingName, description, amount, type, currentBalance);
			TransactionDAO.addTransaction(currentTransaction);
			
			request.getRequestDispatcher("HomePage.jsp").forward(request, response);
		} else {
			request.setAttribute("message", "Failed to pay biller.");
			
			request.getRequestDispatcher("HomePage.jsp").forward(request, response);
		}
	}

}
