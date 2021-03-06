package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import user.model.vo.User;

/**
 * Servlet implementation class AdminViewServlet
 */
@WebServlet("/admin/adminView")
public class AdminViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int numPerPage = 10;
		try {
			numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
		}catch(NumberFormatException e) {
			
		}
		
		int cPage = 1;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			
		}
		
		List<User> list = new AdminService().selectUserList(cPage,numPerPage);
		
		int totalContents = new AdminService().selectTotalContents();
		
		int totalPage = (int)Math.ceil((double)totalContents/numPerPage);
		
		final int pageBarSize = 5;
		String pageBar = "";
		
		int pageStart = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageStart + pageBarSize-1;
		
		int pageNo = pageStart;
		
		if(pageNo ==1) {
			pageBar += "<span>[이전]&nbsp;&nbsp;</span>";
		}
		else {
			pageBar +="&nbsp;&nbsp;<a href='"+request.getContextPath()+"/admin/adminUserList?cPage="+(pageNo-1)+"&numPerPage="+numPerPage+"'>[이전]&nbsp;&nbsp;</a>";
		}
		
		while(pageNo<=pageEnd && pageNo <= totalPage) {
			if(pageNo == cPage) {
				pageBar +="&nbsp;&nbsp;<span class='cPage'>"+pageNo+"</span>&nbsp;&nbsp;";
			}
			else {
				pageBar +="&nbsp;&nbsp;<a href='"+request.getContextPath()+"/admin/adminUserList?cPage="+pageNo+"&numPerPage="+numPerPage+"'>"+pageNo+"&nbsp;&nbsp;</a>";
			}
			
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar += "<span>&nbsp;&nbsp;[다음]</span>";
		}
		else {
			pageBar += "&nbsp;&nbsp;<a href='"+request.getContextPath()+"/admin/adminUserList?cPage="+pageNo+"&numPerPage="+numPerPage+"'>&nbsp;&nbsp;[다음]</a>";
		}
		
		System.out.println("pageBar="+pageBar);
		
		request.setAttribute("list",list);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.setAttribute("numPerPage", numPerPage);
	
		request.getRequestDispatcher("/WEB-INF/views/admin/adminView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
