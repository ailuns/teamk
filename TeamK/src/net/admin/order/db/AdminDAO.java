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
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysqlDB");
		conn = ds.getConnection();
		return conn;
	}
	public int Ti_Count(int status){
		int count = 0;
		try{
			conn = getconn();
			sql = "select count(ti_num) from trade_info where ti_status = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, status);
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
	public int TransNumInsert_Count(){
		int count=0;
		try{
			conn = getconn();
			sql = "select count(ti_num) from trade_info where to_null_check = 0"+
					" and ti_status = 2";
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
	public List<ModTradeInfoBEAN> StatusPayList(int ti_status, int start, int end){
		List<ModTradeInfoBEAN> BankPayList = new ArrayList<ModTradeInfoBEAN>();
		try{
			conn=getconn();
			sql = "select * from trade_info where ti_status = ? limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ti_status);
			pstmt.setInt(2, start-1);
			pstmt.setInt(3, end);
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
	public List<ModTradeInfoBEAN> StatusPayList(int TO_Null_Check, int ti_status, int start, int end){
		List<ModTradeInfoBEAN> BankPayList = new ArrayList<ModTradeInfoBEAN>();
		try{
			conn=getconn();
			sql = "select * from trade_info where to_null_check = ? and ti_status = ? limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, TO_Null_Check);
			pstmt.setInt(2, ti_status);
			pstmt.setInt(3, start-1);
			pstmt.setInt(4, end);
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
		PO_Status_Update(status, ti_num);
		TO_Status_Update(status, ti_num);
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
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	public void Trans_Num_Insert(String to_num, String Trans_Num){
		System.out.println(to_num+" > "+Trans_Num);
		try{
			conn = getconn();
			sql = "update thing_order set o_trans_num =?, o_status=3 where o_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, Trans_Num);
			pstmt.setInt(2, Integer.parseInt(to_num));
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
	public int To_Trans_Search(int ti_num){
		int check = 0;
		try{
			conn= getconn();
			sql = "select count(o_num) from thing_order "+
					"where o_ti_num = ? and o_status < 3";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ti_num);
			rs = pstmt.executeQuery();
			if(rs.next())check = rs.getInt(1);
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
	public List<ModTradeInfoBEAN> ADThingOrder(int ti_num){
		List<ModTradeInfoBEAN> ADThingList = new ArrayList<ModTradeInfoBEAN>();
		try{
			conn =getconn();
			sql = "select A.*, B.subject, B.intro, B.img "
					+"from thing_order A left outer join thing B "
					+"on A.ori_num = B.num where A.o_ti_num=? and A.o_status = 2";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ti_num);
			rs = pstmt.executeQuery();
			while(rs.next()){
				ModTradeInfoBEAN mtib = new ModTradeInfoBEAN();
				mtib.setNum(rs.getInt("o_num"));
				mtib.setOri_num(rs.getInt("ori_num"));
				mtib.setIntro(rs.getString("intro"));
				mtib.setSubject(rs.getString("subject"));
				mtib.setImg(rs.getString("img"));
				mtib.setTrade_num(rs.getString("o_trade_num"));
				mtib.setThing_count(rs.getInt("o_count"));
				mtib.setCost(rs.getInt("o_cost"));
				mtib.setColor(rs.getString("o_color"));
				mtib.setSize(rs.getString("o_size"));
				mtib.setTrade_date(rs.getTimestamp("o_date"));
				mtib.setTrans_num(rs.getString("o_trans_num"));
				ADThingList.add(mtib);
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
		return ADThingList;
	}
	public void Ti_Status_Waiting_Update(int ti_num){
		int check = To_Trans_Search(ti_num);
		if(check ==0){
			try{
				conn =getconn();
				sql = "update trade_info set ti_status = 9 where ti_num = ?";
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
	public int Pack_Res_Count(int status){
		int count = 0;
		try{
			conn = getconn();
			sql = "select count(po_num) from pack_order where po_res_status= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, status);
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
		}return count;
	}
	public List<ModTradeInfoBEAN> Pack_Res(int status, int start, int end){
		List<ModTradeInfoBEAN> Pack_Res_List = new ArrayList<ModTradeInfoBEAN>();
		try{
			conn = getconn();
			sql = "select A.*, B.subject, B.intro, B.file1, B.date "
					+"from pack_order A left outer join pack B "
					+"on A.ori_num = B.num where A.po_res_status = ?"
					+" order by A.po_res_date limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, status);
			pstmt.setInt(2, start-1);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();
			while(rs.next()){
				ModTradeInfoBEAN mtib = new ModTradeInfoBEAN();
				mtib.setSubject(rs.getString("subject"));
				mtib.setIntro(rs.getString("intro"));
				mtib.setImg(rs.getString("file1"));
				mtib.setDate(rs.getTimestamp("date"));
				int receive_check = rs.getInt("po_receive_check");
				if(receive_check==1){
					mtib.setTi_num(rs.getInt("po_ti_num"));
					mtib = po_receive_info_read(mtib);
				}
				mtib.setPo_receive_check(receive_check);
				mtib.setNum(rs.getInt("po_num"));
				mtib.setPack_count(rs.getString("po_count"));
				mtib.setTrade_num(rs.getString("po_trade_num"));
				mtib.setOri_num(rs.getInt("ori_num"));
				int stat = rs.getInt("po_res_status");
				String statustext = "";
				switch(stat){
					case 1: statustext = "입금 확인중"; break;
					case 2: statustext="예약 대기중";break;
					case 3: statustext="예약 완료";break;
					case 4: statustext="환불대기";break;
					case 5: statustext="환불 완료";break;
					case 10: statustext="완료";break;
				}
				mtib.setStatus(stat);
				mtib.setStatus_text(statustext);				
				Pack_Res_List.add(mtib);
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
		return Pack_Res_List;
	}
	public ModTradeInfoBEAN po_receive_info_read(ModTradeInfoBEAN mtib){
		try{
			Connection conn2 = getconn();
			String sql2 = "select * from trade_info where ti_num=?";
			PreparedStatement pstmt2 = conn2.prepareStatement(sql2);
			pstmt2.setInt(1, mtib.getTi_num());
			ResultSet rs2 = pstmt2.executeQuery();
			if(rs2.next()){
				mtib.setName(rs2.getString("ti_receive_name"));
				mtib.setPostcode(rs2.getString("ti_receive_postcode"));
				mtib.setAddress1(rs2.getString("ti_receive_address1"));
				mtib.setAddress2(rs2.getString("ti_receive_address2"));
				mtib.setMobile(rs2.getString("ti_receive_mobile"));
				rs2.close();
				pstmt2.close();
				conn2.close();
			}
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return mtib;
	}
}
