package storymsg.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.google.gson.Gson;

/**
 * Servlet implementation class messageSendDMServlet
 */
@WebServlet("/chat/messageSendDM.do")
public class messageSendDMServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public messageSendDMServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		String dm = request.getParameter("dm"); 
		Map<String, Object> dmMap = new Gson().fromJson(dm,Map.class); 
		System.out.println("dmMap="+dmMap);
		
		Map<String, Session> clients = messageChatsocket.clients; 
		Set<String> userIdSet = clients.keySet(); 
		String result = ""; 
		
		if(userIdSet.contains(dmMap.get("receiver"))){
			Session receiver = clients.get(dmMap.get("receiver"));
			receiver.getBasicRemote().sendText(dm);
			
			result= "DM전송성공"; 
			
			
		}else {
			result = userIdSet+"님이 접속중이 아닙니다."; 
		}
		
		Map<String, String> resultMap = new HashMap<>(); 
		resultMap.put("result", result); 
		new Gson().toJson(resultMap, response.getWriter());
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
