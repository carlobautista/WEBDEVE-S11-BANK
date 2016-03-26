package peso.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import peso.services.UserDAO;

/**
 * Servlet implementation class DeleteAccount
 */
@WebServlet(
		urlPatterns = { 
				"/DeleteAccount", 
				"/deleteaccount"
		}, 
		initParams = { 
				@WebInitParam(name = "deleteaccount", value = "")
		})
public class DeleteAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAccount() {
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
		//final String username = (String)request.getSession().getAttribute("username");
		
		final String acctName = request.getParameter("acctName");
		UserDAO.deleteUser(acctName);
		//request.setAttribute("message", "Account successfully deleted.");
		request.getRequestDispatcher("/manageaccounts").forward(request, response);
	}

}
