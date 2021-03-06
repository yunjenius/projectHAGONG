package hagong.academy.mngStudent.mngPurchase.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import hagong.academy.mngStudent.mngPurchase.model.vo.Purchase;
import hagong.academy.mngStudent.mngPurchase.model.vo.SelectClass;
import hagong.academy.mngStudent.mngPurchase.model.vo.SelectDate;

import static hagong.common.JDBCTemplate.*;

public class PurchaseDao {
	
	private Properties prop = new Properties();
	public PurchaseDao() {
		String fileName = PurchaseDao.class.getResource("/sql/purchase/purchase-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public String selectStartDay(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		String startDay = "";
		
		String query = prop.getProperty("selectStartDay");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				startDay = rset.getString("DAY");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return startDay;
	}
	
	public ArrayList<SelectClass> selectClass(Connection con, SelectDate selectDate) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<SelectClass> selectClass = null;
		String selectedDate = selectDate.getSelectYear() + "-" + selectDate.getSelectMonth();
		
		String query = prop.getProperty("selectClass");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, selectedDate);
			pstmt.setString(2, selectedDate);
			rset = pstmt.executeQuery();
			selectClass = new ArrayList<SelectClass>();
			
			while(rset.next()) {
				SelectClass sc = new SelectClass();
				sc.setClassNo(rset.getInt("CLS_NO"));
				sc.setClassName(rset.getString("CLS_NAME"));
				selectClass.add(sc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return selectClass;
	}

	public ArrayList<Purchase> selectPurchaseList(Connection con, SelectDate selectDate) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Purchase> purList = null;
		
		String selectedDate = selectDate.getSelectYear() + "-" + selectDate.getSelectMonth();
		
		String query = prop.getProperty("selectPurchaseList");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, selectedDate);
			pstmt.setString(2, selectedDate);
			pstmt.setString(3, selectedDate);
			pstmt.setString(4, selectedDate);
			rset = pstmt.executeQuery();
			purList = new ArrayList<Purchase>();
			
			while(rset.next()) {
				Purchase purchase = new Purchase();
				purchase.setPurchaseNo(rset.getInt("PAY_NO"));
				purchase.setStuNo(rset.getInt("USER_NO"));
				purchase.setClassNo(rset.getInt("CLS_NO"));
				purchase.setNotifyDate(rset.getDate("NOTIFY_DATE"));
				purchase.setReciptDate(rset.getDate("RECIPT_DATE"));
				purchase.setRefundDay(rset.getDate("REFUND_DAY"));
				purchase.setPayPrice(rset.getInt("PAY_MONEY"));
				purchase.setClassName(rset.getString("CLS_NAME"));
				purchase.setClassStart(rset.getDate("CLS_START"));
				purchase.setClassEnd(rset.getDate("CLS_END"));
				purchase.setStuId(rset.getString("USER_ID"));
				purchase.setStuName(rset.getString("NAME"));
				purchase.setRefundPoint(rset.getString("RFD_DATE"));
				purchase.setBeneName(rset.getString("BEN_CONTENT"));
				purchase.setPayMemo(rset.getString("PAY_MEMO"));
				
				int classPrice = rset.getInt("TUITION");
				int classDays = rset.getInt("CLS_CNT");
				int faultDays = rset.getInt("FAULT_DAYS");
				double beneRate = rset.getInt("BEN_RATE");
				double refundRate;
				String oldRefundRate = rset.getString("RFD_RATE");
				if(oldRefundRate.equals("ALL")) {
					refundRate = 1;
				} else if(oldRefundRate.equals("2N3")) {
					refundRate = 2/3;
				} else if(oldRefundRate.equals("1N2")) {
					refundRate = 1/2;
				} else {
					refundRate = 0;
				}
				int onedayFee = classPrice / classDays;
				int faultPrice = onedayFee * faultDays;
				int benePrice = (int) (classPrice * beneRate);
				int refundPrice = (int) (classPrice * refundRate);
				int realPrice = classPrice - benePrice;
				purchase.setClassPrice(classPrice);
				purchase.setClassDays(classDays);
				purchase.setFaultDays(faultDays);
				purchase.setBeneRate(beneRate);
				purchase.setRefundRate(refundRate);
				purchase.setOnedayFee(onedayFee);
				purchase.setFaultPrice(faultPrice);
				purchase.setBenePrice(benePrice);
				purchase.setRefundPrice(refundPrice);
				purchase.setRealPrice(realPrice);
				int profit;
				if(refundPrice == 0) {
					profit = realPrice;
				} else {
					if(realPrice == classPrice) {
						profit = realPrice - refundPrice;
					} else {
						profit = classPrice - refundPrice;
					}
				}
				
				String detailStatus;
				String payStatus = rset.getString("PAY_STATUS");
				purchase.setPayStatus(payStatus);
				if(payStatus.equals("Y")) {
					if(refundPrice == 0) {
						detailStatus = "??????";
					} else {
						detailStatus = "?????? ??? ??????";
					}
				} else {
					detailStatus = "??????";
				}
				purchase.setDetailStatus(detailStatus);
				
				purList.add(purchase);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return purList;
	}

	public int updateStatus(Connection con, int[] requestNos, ArrayList<Integer> realPriceList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateStatus");
		try {
			pstmt = con.prepareStatement(query);
			for(int i = 0; i < requestNos.length; i++) {
				pstmt.setInt(1, realPriceList.get(i));
				pstmt.setInt(2, requestNos[i]);
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateBill(Connection con, int[] requestNos) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateBill");
		try {
			pstmt = con.prepareStatement(query);
			for(int i = 0; i < requestNos.length; i++) {
				pstmt.setInt(1, requestNos[i]);
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateRecipt(Connection con, int[] requestNos) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateRecipt");
		try {
			pstmt = con.prepareStatement(query);
			for(int i = 0; i < requestNos.length; i++) {
				pstmt.setInt(1, requestNos[i]);
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Purchase selectPurchaseDetail(Connection con, int purchaseNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Purchase purchase = null;
		
		String query = prop.getProperty("selectPurchaseDetail");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, purchaseNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				purchase = new Purchase();
				purchase.setPurchaseNo(rset.getInt("PAY_NO"));
				purchase.setStuNo(rset.getInt("USER_NO"));
				purchase.setClassNo(rset.getInt("CLS_NO"));
				purchase.setNotifyDate(rset.getDate("NOTIFY_DATE"));
				purchase.setReciptDate(rset.getDate("RECIPT_DATE"));
				purchase.setRefundDay(rset.getDate("REFUND_DAY"));
				purchase.setPayPrice(rset.getInt("PAY_MONEY"));
				purchase.setClassName(rset.getString("CLS_NAME"));
				purchase.setClassStart(rset.getDate("CLS_START"));
				purchase.setClassEnd(rset.getDate("CLS_END"));
				purchase.setStuId(rset.getString("USER_ID"));
				purchase.setStuName(rset.getString("NAME"));
				purchase.setRefundPoint(rset.getString("RFD_DATE"));
				purchase.setBeneName(rset.getString("BEN_CONTENT"));
				purchase.setPayMemo(rset.getString("PAY_MEMO"));
				
				int classPrice = rset.getInt("TUITION");
				int classDays = rset.getInt("CLS_CNT");
				int faultDays = rset.getInt("FAULT_DAYS");
				double beneRate = rset.getInt("BEN_RATE");
				double refundRate;
				String oldRefundRate = rset.getString("RFD_RATE");
				if(purchase.getRefundPoint() == null) {
					purchase.setRefundPoint("");
				}
				if(oldRefundRate.equals("ALL")) {
					refundRate = 1;
				} else if(oldRefundRate.equals("2N3")) {
					refundRate = (double)2/3;
				} else if(oldRefundRate.equals("1N2")) {
					refundRate = (double)1/2;
				} else if(purchase.getRefundPoint().equals("ACA")){
					refundRate = Double.parseDouble(oldRefundRate);
				} else {
					refundRate = 0;
				}
				int onedayFee = classPrice / classDays;
				int faultPrice = onedayFee * faultDays;
				int benePrice = (int) (classPrice * beneRate);
				int refundPrice = (int) (classPrice * refundRate);
				int realPrice = classPrice - benePrice;
				purchase.setClassPrice(classPrice);
				purchase.setClassDays(classDays);
				purchase.setFaultDays(faultDays);
				purchase.setBeneRate(beneRate);
				purchase.setRefundRate(refundRate);
				purchase.setOnedayFee(onedayFee);
				purchase.setFaultPrice(faultPrice);
				purchase.setBenePrice(benePrice);
				purchase.setRefundPrice(refundPrice);
				purchase.setRealPrice(realPrice);
				int profit;
				if(refundPrice == 0) {
					profit = realPrice;
				} else {
					if(realPrice == classPrice) {
						profit = realPrice - refundPrice;
					} else {
						profit = classPrice - refundPrice;
					}
				}
				purchase.setProfit(profit);
				
				String detailStatus;
				String payStatus = rset.getString("PAY_STATUS");
				purchase.setPayStatus(payStatus);
				if(payStatus.equals("Y")) {
					if(refundPrice == 0) {
						detailStatus = "??????";
					} else {
						detailStatus = "?????? ??? ??????";
					}
				} else {
					detailStatus = "??????";
				}
				purchase.setDetailStatus(detailStatus);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return purchase;
	}

	public int updatePayPrice(Connection con, Purchase purchase) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updatePayPrice");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, purchase.getPayPrice());
			pstmt.setInt(2, purchase.getPurchaseNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertRefund(Connection con, Purchase purchase) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertRefund");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setDouble(1, purchase.getRefundRate());
			pstmt.setInt(2, purchase.getFaultDays());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int selectRefundId(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int refundId = 0;
		
		String query = prop.getProperty("selectRefundId");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				refundId = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return refundId;
	}

	public int updateRefundAca(Connection con, Purchase purchase, int refundId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateRefundAca");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, purchase.getPayPrice());
			pstmt.setInt(2, refundId);
			pstmt.setInt(3, purchase.getPurchaseNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public String calRefundRate(Connection con, Purchase purchase) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String result = null;
		
		String query = prop.getProperty("calRefundRate");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setDate(1, purchase.getNotifyDate());
			pstmt.setDate(2, purchase.getNotifyDate());
			pstmt.setDate(3, purchase.getNotifyDate());
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				int classdays = rset.getInt(1);
				double days = rset.getDouble(2);
				double refundRate = days / classdays;
				
				if(refundRate <= (double)1/3) {
					result = "C2";
				} else if(refundRate <= (double)1/2) {
					result = "C3";
				} else {
					result = "NONE";
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public int updateRefundStu(Connection con, Purchase purchase) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateRefundStu");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, purchase.getPayPrice());
			pstmt.setString(2, purchase.getRefundPoint());
			pstmt.setDate(3, purchase.getRefundDay());
			pstmt.setInt(4, purchase.getPurchaseNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
