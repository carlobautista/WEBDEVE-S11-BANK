package peso.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;

import peso.dto.User;
import peso.services.Registrar;

/**
 * Servlet implementation class Register
 */
@WebServlet(
		urlPatterns = { "/register" }, 
		initParams = { 
				@WebInitParam(name = "register", value = "")
		})
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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
		final String username = request.getParameter("username").trim();
		final String password = DigestUtils.sha256Hex(request.getParameter("password"));
		final String confPass = DigestUtils.sha256Hex(request.getParameter("vpassword"));
		final String firstName = request.getParameter("fname").trim();
		final String lastName = request.getParameter("lname").trim();
		final String contactNum = request.getParameter("contactNum").trim();
		final String eMail = request.getParameter("email").trim();
		final String gender = request.getParameter("optradio").trim();

		User a = new User(username, password, firstName, lastName, eMail, contactNum, gender);
		
		if(!Registrar.isUsernameValid(a)){
			request.setAttribute("message", "Registration failed. Username already exists.");
			
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		if(!Registrar.isEmailValid(a)){
			request.setAttribute("message", "Registration failed. E-mail already exists.");
			
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		else if(!password.equals(confPass)){
			request.setAttribute("message", "Registration failed. Password and Verify Password does not match.");
			
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		else{
			Registrar.addAccount(a);
			request.setAttribute("message", "Registration Successful.");
			
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

}
