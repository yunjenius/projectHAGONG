package hagong.academy.mngClass.mngSatisfy.model.service;

import static hagong.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import hagong.academy.mngClass.mngSatisfy.model.dao.SatisfyDao;
import hagong.academy.mngClass.mngSatisfy.model.vo.SatisfyInfo;

public class SatisfyService {

	public ArrayList<SatisfyInfo> selectList() {
		Connection con = getConnection();
		ArrayList<SatisfyInfo> list = new SatisfyDao().selectList(con);

		close(con);

		return list;
	}

	public ArrayList<SatisfyInfo> selectBenList() {
		Connection con = getConnection();
		ArrayList<SatisfyInfo> blist = new SatisfyDao().selectBenList(con);

		close(con);

		return blist;
	}

	public ArrayList<HashMap<String, Object>> selectSatis(int satNo) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new SatisfyDao().selectSatis(con, satNo);

		close(con);

		return list;
	}

	public int insertBen(SatisfyInfo si) {
		Connection con = getConnection();
		int result = new SatisfyDao().insertBen(con, si);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int deleteBen(int benNo) {
		System.out.println("삭제서비스");
		Connection con = getConnection();
		int result = new SatisfyDao().deleteBen(con, benNo);
		if(result > 0) {
			System.out.println("삭제성공");
			commit(con);
		} else {
			System.out.println("삭제실패");
			rollback(con);
		}
		return result;
	}


}