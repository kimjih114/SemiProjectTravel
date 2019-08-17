package storymsg.controller;

import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;
import javax.websocket.server.ServerEndpointConfig.Configurator;

public class MessageSocketConfigurator extends Configurator{

	
	@Override 
	public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) {
	
		HttpSession session = (HttpSession)request.getHttpSession();
		String userId= (String)session.getAttribute("userId");
		sec.getUserProperties().put("userId",userId);
		
		
		
		
	}
	
	
	
}
