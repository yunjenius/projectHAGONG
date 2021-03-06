package hagong.academy.mngClass.mngAttend.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hagong.academy.mngClass.mngAttend.model.service.AttendService;
import hagong.academy.mngStudent.mngPurchase.model.service.PurchaseService;
import hagong.academy.mngStudent.mngPurchase.model.vo.SelectDate;

@WebServlet("/aupdateAttend.attend")
public class UpdateAttendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateAttendServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy-MM");
		String today = dayFormat.format(System.currentTimeMillis());
		String[] todayArr = today.split("-");
		String startDay = new PurchaseService().selectStartDay();
		String[] startDayArr = startDay.split("-");
		
		int endYear = Integer.parseInt(todayArr[0]);
		int endMonth = Integer.parseInt(todayArr[1]);
		int startYear = Integer.parseInt(startDayArr[0]);
		int startMonth = Integer.parseInt(startDayArr[1]);
		int curYear = Integer.parseInt(request.getParameter("year"));
		int curMonth = Integer.parseInt(request.getParameter("month"));
		
		SelectDate selectDate = new SelectDate();
		selectDate.setEndYear(endYear); selectDate.setEndMonth(endMonth);
		selectDate.setStartYear(startYear); selectDate.setStartMonth(startMonth);
		selectDate.setSelectYear(curYear); selectDate.setSelectMonth(curMonth);
		
		String attStatus = request.getParameter("selectAttend");
		String checkedPersonArr = request.getParameter("checkedPersonString");
		String classNum = request.getParameter("classNum");

		String checkedPerson = checkedPersonArr.replaceAll("'", "");
		
		String[] students = checkedPerson.split(",");
		
		
		int result = new AttendService().updateAttend(classNum, attStatus, students);
		
		String page = "";
		if(result > 0) {
			page = "alistStudent.attend";
			request.setAttribute("year", curYear);
			request.setAttribute("month", curMonth);
			request.getRequestDispatcher(page).forward(request, response);
		}else {
			System.out.println("???????????? ???????????? ??????");
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
