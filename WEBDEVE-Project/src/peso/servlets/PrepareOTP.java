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

import org.apache.commons.codec.digest.DigestUtils;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import peso.services.Registrar;
import peso.services.UserDAO;

/**
 * Servlet implementation class PrepareOTP
 */
@WebServlet("/PrepareOTP")
public class PrepareOTP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PrepareOTP() {
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
		doGet(request, response);
		
		response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
		
		final String username = request.getSession().getAttribute("username").toString();
		
		Gson gson = new GsonBuilder().create();
		
		Writer responseWriter = response.getWriter();
		
		boolean otpGenerated = false;
		
		if(Registrar.isUsernameValid(username)){
			// Generate the One-Time Password
			UserDAO.generateOTP(username);
			otpGenerated = true;
		} else {
			otpGenerated = false;
		}
		
		gson.toJson(otpGenerated, responseWriter);
	}

}
