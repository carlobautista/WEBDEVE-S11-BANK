package peso.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;

import peso.services.Registrar;


/**
 * Servlet implementation class Login
 */
@WebServlet(
		urlPatterns = { 
				"/Login", 
				"/login"
		}, 
		initParams = { 
				@WebInitParam(name = "login", value = "")
		})
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		// TODO Auto-generated method stub\
		final String username = request.getParameter("username").trim();
		final String password = DigestUtils.sha256Hex(request.getParameter("password"));
		
		if(Registrar.isCredentialsValid(username, password)){
			request.getSession().setAttribute("username", username);
			
			request.setAttribute("message", "Login successful.");
			
			Cookie c = new Cookie("username", username);
			c.setMaxAge(60 * 60 *24);
			response.addCookie(c);
			request.getRequestDispatcher("dashboard.jsp").forward(request, response);
		}
		else{
			request.setAttribute("message", "Login unsuccessful. Please check your credentials.");
			
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

}
