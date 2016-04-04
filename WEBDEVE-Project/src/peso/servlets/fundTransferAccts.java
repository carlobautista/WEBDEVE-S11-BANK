package peso.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import peso.dto.Account;
import peso.services.UserDAO;

/**
 * Servlet implementation class fundTransferAccts
 */
@WebServlet("/fundTransferAccts")
public class fundTransferAccts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public fundTransferAccts() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		final String username = (String)request.getSession().getAttribute("username");
		UserDAO dao = new UserDAO();
		
		if(username != null){
			ArrayList<Account> accountList = dao.getUserAccounts(username);
			request.setAttribute("userAccts", accountList);
			
			request.getRequestDispatcher("/fund-transfer.jsp").forward(request, response);
		}
	}
}
