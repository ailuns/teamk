package net.admin.order.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sun.org.apache.xalan.internal.xsltc.cmdline.getopt.GetOpt;

import net.mod.db.ModTradeInfoBEAN;

public class AdminDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql="";
	ResultSet rs = null;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd",Locale.KOREA);
	Timestamp c1 = new Timestamp(System.currentTimeMillis());
	String strtoday;
	private Connection getconn() throws Exception{
		Connection conn = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysqldb");
		conn = ds.getConnection();
		return conn;
	}
	public int BankPayCount(){
		int count = 0;
		try{
			conn = getconn();
			sql = "select count(ti_num) from trade_info where ti_status = 1";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())count = rs.getInt(1);
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return count;
	}
	public List<ModTradeInfoBEAN> BankPayList(int start, int end){
		List<ModTradeInfoBEAN> BankPayList = new ArrayList<ModTradeInfoBEAN>();
		try{
			conn=getconn();
			sql = "select * from trade_info where ti_status = 1 limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			while(rs.next()){
				ModTradeInfoBEAN mtib = new ModTradeInfoBEAN();
				mtib.setTi_num(rs.getInt("ti_num"));
				mtib.setName(rs.getString("ti_receive_name"));
				mtib.setMobile(rs.getString("ti_receive_mobile"));
				mtib.setPostcode(rs.getString("ti_receive_postcode"));
				mtib.setAddress1(rs.getString("ti_receive_address1"));
				mtib.setAddress2(rs.getString("ti_receive_address2"));
				mtib.setMemo(rs.getString("ti_receive_memo"));
				mtib.setTrade_type(rs.getString("ti_trade_type"));
				mtib.setPayer(rs.getString("ti_trade_payer"));
				mtib.setTrade_date(rs.getTimestamp("ti_trade_date"));
				mtib.setTotal_cost(rs.getInt("ti_total_cost"));
				mtib.setStatus(rs.getInt("ti_status"));
				BankPayList.add(mtib);
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return BankPayList;
	}
	public int TI_PO_Receive_Check(int num){
		int check =0;
		try{
			conn = getconn();
			sql ="select po_receive_check from pack_order where po_ti_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()){
				if(rs.getInt(1)==1)check=1;
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return check;
	}
	public int TI_TO_Check(int num){
		int check = 0;
		try{
			conn = getconn();
			sql = "select * from thing_order where o_ti_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next())check = 1;
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return check;
	}
	public void PO_Status_Update(int status, int ti_num){
		try{
			conn = getconn();
			sql = "update pack_order set po_res_status = ? where po_ti_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, status);
			pstmt.setInt(2, ti_num);
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	public void TO_Status_Update(int status, int ti_num){
		try{
			conn = getconn();
			sql ="update thing_order set o_status = ? where o_ti_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, status);
			pstmt.setInt(2, ti_num);
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	public void BankPayChecked(int status, int ti_num){
		if(TI_TO_Check(ti_num)==0&&
			TI_PO_Receive_Check(ti_num)==0){
			status=9;
			PO_Status_Update(2,ti_num);
		}
		try{
			conn =getconn();
			sql = "update trade_info set ti_status = ? where ti_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, status);
			pstmt.setInt(2, ti_num);
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	public void Trade_Info_Delete(int ti_num){
		try{
			conn =getconn();
			sql = "delete from trade_info where ti_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ti_num);
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
