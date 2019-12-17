package hagong.academy.mngClass.mngSatisfy.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngClass.mngSatisfy.model.service.SatisfyService;
import hagong.academy.mngClass.mngSatisfy.model.vo.SatisfyInfo;

/**
 * Servlet implementation class InsertSatisfyServlet
 */
@WebServlet("/ainsert.satis")
public class InsertSatisfyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertSatisfyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getParameter("type");
		System.out.println("type : " + type);

		String page = "";
		if (type.equals("insertForm")) {
			//만족도 등록 버튼 클릭 시 처리할 로직
			ArrayList<SatisfyInfo> blist = new SatisfyService().selectBenList();
			if (blist != null) {
				page = "viewAcademy/mngClass/mngSatisfy/addSatisfaction.jsp";
				request.setAttribute("blist", blist);
			} else {
				page = "/viewAcademy/common/commonError.jsp";
				request.setAttribute("errorCode", "loadSatisfyInsertFormFail");
			}
			request.getRequestDispatcher(page).forward(request, response);

		} else {
			//등록하기 버튼 클릭 시 처리할 로직
			String title = request.getParameter("title");
			System.out.println("title : " + title);
			String target = request.getParameter("target");
			System.out.println("target : " + target);
			
			java.sql.Date start = java.sql.Date.valueOf(request.getParameter("start"));
			System.out.println("start : " + start);
			java.sql.Date end = java.sql.Date.valueOf(request.getParameter("end"));
			System.out.println("end : " + end);
			
			int benefit = Integer.parseInt(request.getParameter("benefit"));
			System.out.println("benefit : " + benefit);
			
			String[] qrr = request.getParameterValues("question");
			if (qrr != null) {
				for (int i = 0; i < qrr.length; i++) {
					System.out.println("qrr" + i + " : " + qrr[i]);
				}
			}
			
			String[] arr = request.getParameterValues("answer");
			if (arr != null) {
				for (int i = 0; i < arr.length; i++) {
					System.out.println("arr" + i + " : " + arr[i]);
				}
			}
			
			SatisfyInfo si = new SatisfyInfo();
			si.setSatTitle(title);
			si.setTarget(target);
			si.setStart(start);
			si.setEnd(end);
			si.setBenNo(benefit);
			
			int result = new SatisfyService().insertSatis(si, qrr, arr);
			
			if(result > 0) {
				System.out.println("등록 성공");
			} else {
				System.out.println("등록 실패");
			}
		}

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
