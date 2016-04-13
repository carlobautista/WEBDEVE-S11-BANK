package peso.servlets;

import java.io.IOException;
import java.io.Writer;
import java.util.Arrays;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import peso.dto.Transaction;
import peso.services.TransactionDAO;
import peso.services.UserDAO;

/**
 * Servlet implementation class sendmoney
 */
@WebServlet("/sendmoney")
public class sendmoney extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sendmoney() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        Map<String, String[]> sendMoneyInfo = request.getParameterMap();
        
        final String sendingName = Arrays.asList(sendMoneyInfo.get("sendingAcct")).get(0);
		final int sendingAcct = UserDAO.getIdAccount(sendingName);
		final String destName = Arrays.asList(sendMoneyInfo.get("destAcct")).get(0);
		final int destAcct = Integer.parseInt(destName);
		final int amt = Integer.parseInt(Arrays.asList(sendMoneyInfo.get("amt")).get(0));
		
		String description = "";
		String type = "";
		
		int currentBalance = 0;
		
		UserDAO userDAO = new UserDAO();
		
		int userId = userDAO.getIdUser(request.getSession().getAttribute("username").toString());
		
		boolean moneySent = false;
		
		Gson gson = new GsonBuilder().create();
		
		Writer responseWriter = response.getWriter();
		
		if(UserDAO.sendMoney(destAcct, sendingAcct, amt)){
			request.setAttribute("message", "The money was successfuly sent to the destination account");
			
			// After transaction put to table transaction in mysql
			currentBalance = UserDAO.getBalanceById(sendingAcct);
			description = "You have sent PHP" + amt + " from [" + sendingName + "] to [" + UserDAO.getNameById(destAcct) + "]";
			type="Credit";
			Transaction currentTransaction = new Transaction(userId, sendingAcct, sendingName, description, amt, type, currentBalance);
			TransactionDAO.addTransaction(currentTransaction);
			
			moneySent = true;
			//request.getRequestDispatcher("HomePage.jsp").forward(request, response);
		}
		else{
			request.setAttribute("message", "Failed to send money to destination account");
			
			
			//request.getRequestDispatcher("HomePage.jsp").forward(request, response);
		}
		
		gson.toJson(moneySent, responseWriter);
	}

}
