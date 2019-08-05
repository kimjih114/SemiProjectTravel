package common.wrapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import common.util.MVCUtils;

public class EncryptWrapper extends HttpServletRequestWrapper{

	public EncryptWrapper(HttpServletRequest request) {
		super(request);
		// TODO Auto-generated constructor stub
	}

	
	
	@Override 
	public String getParameter(String name) {
		
		String value ="";
		if(name != null &&(name.equals("password")||name.equals("password_new"))) {
			System.out.println("암호화전:"+super.getParameter(name));
			
			//암호화처리 
			value =MVCUtils.getSha512(super.getParameter(name)); 
			System.out.println("암호화후 : "+value);
			
			
		}else {
			value = super.getParameter(name);
		}
		
		
		
		return  value;
	}
	
	
	
	
	
	
}
