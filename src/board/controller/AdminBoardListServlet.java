package board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.oreilly.servlet.MultipartRequest;

import board.model.service.Board_QuestionService;
import board.model.vo.Board_Question;
/*import common.QuestionBoardListSingletone;*/
import user.model.vo.User;

/**
 * Servlet implementation class BoardQuestionListServlet
 */
@WebServlet("/boardquestion/adminboardList")
public class AdminBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminBoardListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
	
		
		final int numPerPage = 5;
		int cPage = 1;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {

		}

		List<Board_Question> qboardList = new Board_QuestionService().selectAdminBoardQuestionList(cPage, numPerPage);

		int totalBoardCount = new Board_QuestionService().selectAdminBoardQuestionCount();

		int totalPage = (int) Math.ceil((double) totalBoardCount / numPerPage);

		String pageBar = "";
		int pageBarSize = 5;

		int pageStart = ((cPage - 1) / pageBarSize) * pageBarSize + 1;

		int pageEnd = pageStart + pageBarSize - 1;
		int pageNo = pageStart; // [이전] section
		if (pageNo == 1) {
			pageBar += "<span>[이전]</span>";
		} else {
			pageBar += "<a href='" + request.getContextPath() + "/board/adminboardList?cPage=" + (pageNo - 1)
					+ "'>[이전]</a> ";
		}

		// pageNo section // 보통 !(빠져나가는 조건식)으로 많이 쓴다.
		while (!(pageNo > pageEnd || pageNo > totalPage)) {

			if (cPage == pageNo) {
				pageBar += "<span class='cPage'>" + pageNo + "</span> ";
			} else {
				pageBar += "<a href='" + request.getContextPath() + "/boardquestion/adminboardList?cPage=" + pageNo + "'>"
						+ pageNo + "</a> ";
			}
			pageNo++;
		}

		// [다음] section
		if (pageNo > totalPage) {
			pageBar += "<span>[다음]</span>";
		} else {
			pageBar += "<a href='" + request.getContextPath() + "/boardquestion/adminboardList?cPage=" + pageNo
					+ "'>[다음]</a>";
		}

		request.setAttribute("qboardList", qboardList);
		request.setAttribute("pageBar", pageBar);
		request.getRequestDispatcher("/WEB-INF/views/admin/adminboard_questionList.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
