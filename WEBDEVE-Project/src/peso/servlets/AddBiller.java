package peso.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import peso.dto.Account;
import peso.services.AccountDAO;
import peso.services.UserDAO;

/**
 * Servlet implementation class AddBiller
 */
@WebServlet("/AddBiller")
public class AddBiller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBiller() {
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
		
		UserDAO userDAO = new UserDAO();
		
		int userId = userDAO.getIdUser(request.getSession().getAttribute("username").toString());
		String accountName = request.getParameter("accountName");
		int accountBalance = Integer.parseInt(request.getParameter("accountBalance"));
		
		Account newAccount = new Account(userId, accountName, "biller", accountBalance);
		
		if(AccountDAO.addAccount(newAccount)){
			request.getRequestDispatcher("ManageAccounts").forward(request, response);
		}
	}

}
