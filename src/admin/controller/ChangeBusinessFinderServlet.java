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
 * Servlet implementation class ChangeBusinessFinderServlet
 */
@WebServlet("/admin/findChangeBusiness")
public class ChangeBusinessFinderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeBusinessFinderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchType = request.getParameter("searchType");
		String searchKeyword = request.getParameter("searchKeyword");
		
		final int numPerPage = 10;
		int cPage =1;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e){
			
		}
		
		List<User> list = new AdminService().selectUserByUserId(searchKeyword,cPage,numPerPage);
		
		
		int totalUser = new AdminService().selectUserCountByUserId(searchKeyword);
		
		
		int totalPage = (int)Math.ceil((double)totalUser/numPerPage);
		
		String pageBar = "";
		int pageBarSize = 5;
		
		int pageStart = ((cPage -1)/pageBarSize) * pageBarSize +1;
		
		int pageEnd = pageStart + pageBarSize-1;
		int pageNo = pageStart;
		
		if(pageNo ==1) {
			
		}else {
			pageBar += "<a href='"+request.getContextPath()+"/admin/findChangeBusiness?searchType="+searchType+"&searchKeyword="+searchKeyword+"&cPage="+(pageNo-pageBarSize)+"&numPerPage="+numPerPage+"'>[이전]</a>";
		}
		
		while(!(pageNo>pageEnd || pageNo>totalPage)) {
			if(cPage == pageNo) {
				pageBar +="<span class='cPage'>"+pageNo+"</span>";
			}
			else {
				pageBar +="<a href='"+request.getContextPath()+"/admin/findChangeBusiness?searchType="+searchType+"&searchKeyword="+searchKeyword+"&cPage="+pageNo+"&numPerPage="+numPerPage+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		if(pageNo> totalPage) {
			
		}else {
			pageBar +="<a href='"+request.getContextPath()+"/admin/findChangeBusiness?searchType="+searchType+"&searchKeyword="+searchKeyword+"&cPage="+pageNo+"&numPerPage="+numPerPage+"'>[다음]</a>";
		}
		
		request.setAttribute("list", list);
		request.setAttribute("pageBar", pageBar);
		request.getRequestDispatcher("/WEB-INF/views/admin/changeBusinessFinder.jsp").forward(request, response);
	}	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
