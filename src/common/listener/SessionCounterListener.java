package common.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class SessionCounterListener
 *
 */
@WebListener
public class SessionCounterListener 
	implements HttpSessionListener {

	private static int activeSessions;
	
    /**
     * Default constructor. 
     */
    public SessionCounterListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent se)  { 
         activeSessions++;
         System.out.println("[[세션추가됨! 현재 세션수 : "+activeSessions+"]]");
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent se)  { 
    	if(activeSessions > 0) {
    		activeSessions--;
    		System.out.println("[[세션반납됨! 현재 세션수 : "+activeSessions+"]]");    		
    	}
    
    }
	
}
