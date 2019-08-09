package common;

import java.util.ArrayList;
import java.util.List;

import admin.model.dao.AdminDAO;
import admin.model.service.AdminService;
import user.model.vo.User;

public class UserListSingletone {

	private static UserListSingletone instance;
	private List<User> userList;
	
	private UserListSingletone() {
		userList 
		= new AdminService().selectMemberList();
		System.out.println("userList"+userList);
	}
	
	public static UserListSingletone getInstance() {
		if(instance == null)
			instance = new UserListSingletone();
		return instance;
	}
	
	public List<User> getUserList(){
		return userList;
	}
}
