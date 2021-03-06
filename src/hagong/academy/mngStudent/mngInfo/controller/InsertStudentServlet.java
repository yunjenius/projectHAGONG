package hagong.academy.mngStudent.mngInfo.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import hagong.academy.mngStudent.mngInfo.model.service.StudentService;
import hagong.academy.mngStudent.mngInfo.model.vo.Student;
import hagong.academy.mngStudent.mngInfo.model.vo.StudentProfile;
import hagong.common.RenameFilePolicy;

/**
 * Servlet implementation class InsertStudentServlet
 */
@WebServlet("/ainsert.info")
public class InsertStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertStudentServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;

			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "uploadFiles/";

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new RenameFilePolicy());
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();

			Enumeration<String> files = multiRequest.getFileNames();

			while (files.hasMoreElements()) {
				String name = files.nextElement();

				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
			}

			String multiTitle = multiRequest.getParameter("title");
			String multiContent = multiRequest.getParameter("content");

			String userName = multiRequest.getParameter("userName"); // ????????????
			String userId = multiRequest.getParameter("userId"); // ???????????????
			String userPwd = multiRequest.getParameter("userPwd"); // ??????????????????
			java.sql.Date birth = java.sql.Date.valueOf(multiRequest.getParameter("birth")); // ????????????
			String tel1 = multiRequest.getParameter("tel1");
			String tel2 = multiRequest.getParameter("tel2");
			String tel3 = multiRequest.getParameter("tel3");
			String phone = tel1 + "-" + tel2 + "-" + tel3; // ????????????
			String address = multiRequest.getParameter("address"); // ??????
			String email = multiRequest.getParameter("email"); // ?????????
			int refNo = Integer.parseInt(multiRequest.getParameter("refNo")); // ?????????????????????
			System.out.println("refNo : " + refNo);
			String refName = multiRequest.getParameter("refName"); // ???????????????
			String refId = multiRequest.getParameter("refId"); // ??????????????????
			String reftel1 = multiRequest.getParameter("reftel1");
			String reftel2 = multiRequest.getParameter("reftel2");
			String reftel3 = multiRequest.getParameter("reftel3");
			String refPhone = reftel1 + "-" + reftel2 + "-" + reftel3; // ?????????????????????
			String inflowPath = multiRequest.getParameter("inflowPath"); // ????????????
			String school = multiRequest.getParameter("school"); // ??????
			int grade = Integer.parseInt(multiRequest.getParameter("grade")); // ??????
			String track = multiRequest.getParameter("track"); // ??????
			String college = multiRequest.getParameter("college"); // ????????????
			String major = multiRequest.getParameter("major"); // ????????????
			String status = multiRequest.getParameter("status"); // ????????????
			String userType = multiRequest.getParameter("userType"); // ????????????

			Student s = new Student();

			s.setUserId(userId);
			s.setName(userName);
			s.setUserPwd(userPwd);
			s.setBirth(birth);
			s.setPhone(phone);
			s.setSchool(school);
			s.setGrade(grade);
			s.setTrack(track);
			s.setAddress(address);
			s.setEmail(email);
			s.setRefName(refName);
			s.setRefId(refId);
			s.setRefPhone(refPhone);
			s.setCollege(college);
			s.setMajor(major);
			s.setInflowPath(inflowPath);
			s.setStatus(status);
			s.setUserType(userType);

			if(refNo == 0) {
				int refresult = new StudentService().insertParent(s);
				
				if(refresult > 0) {
					// ????????? ?????? ??????
					int	refUno = new StudentService().findUserNo(refId);
					s.setRefUno(refUno);
				}
			} else {
				s.setRefUno(refNo);
			}
			
			ArrayList<StudentProfile> fileList = new ArrayList<StudentProfile>();
			
			for (int i = originFiles.size() - 1; i >= 0; i--) {
				StudentProfile profile = new StudentProfile();
				profile.setFilePath(savePath);
				profile.setOriginName(originFiles.get(i));
				profile.setChangeName(saveFiles.get(i));

				fileList.add(profile);
			}

			int result = new StudentService().insertMember(s, fileList);

			String page = "";
			if (result > 0) {
				response.sendRedirect(request.getContextPath() + "/alist.info");
			} else {
				for (int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(savePath + saveFiles.get(i));

					failedFile.delete();
				}
				page = "/viewAcademy/common/commonError.jsp";
				request.setAttribute("errorCode", "insertStudentFail");
				request.getRequestDispatcher(page).forward(request, response);
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
