package sns.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import sns.model.service.SNSService;

/**
 * Servlet implementation class AjaxSnsBlockServlet
 */
@WebServlet("/gson/sns/block.do")
public class AjaxSnsBlockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSnsBlockServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//0.encoding
				response.setContentType("application/json; charset=utf-8");
										
				//1.parameter handling
				String userBlocking = request.getParameter("userBlocking");
				String userBlocked= request.getParameter("userBlocked");
										
				//2.business logic
				int result = new SNSService().block(userBlocking, userBlocked);
										
				//view단 작성
				response.setContentType("application/json; charset=utf-8");
				new Gson().toJson(result, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
