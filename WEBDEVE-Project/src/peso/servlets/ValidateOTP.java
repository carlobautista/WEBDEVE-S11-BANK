package peso.servlets;

import java.io.IOException;
import java.io.Writer;
import java.util.Arrays;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import peso.services.UserDAO;

/**
 * Servlet implementation class ValidateOTP
 */
@WebServlet("/ValidateOTP")
public class ValidateOTP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidateOTP() {
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
		
		response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        Map<String, String[]> userInfo = request.getParameterMap();
		
        final String username = Arrays.asList(userInfo.get("username")).get(0);
        final String OTP = Arrays.asList(userInfo.get("OTP")).get(0);
        
        Gson gson = new GsonBuilder().create();
        
        Writer responseWriter = response.getWriter();
        
        boolean otpValidated = false;
        
        if(UserDAO.validateOTP(username, OTP)){
        	request.getSession().setAttribute("username", username);
			request.getSession().setAttribute("name", UserDAO.getUserName(username));
			
			request.setAttribute("message", "Login successful.");
			Cookie c = new Cookie("username", username);
			c.setMaxAge(60 * 60 *24);
			response.addCookie(c);
			
        	otpValidated = true;
        }
        gson.toJson(otpValidated, responseWriter);
	}

}
