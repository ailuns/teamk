<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*"%>
 <%@ page import="java.util.*"%>
<%
//배열객체 생성
//1단계 드라이버 로더	
request.setCharacterEncoding("utf-8");
int num = Integer.parseInt(request.getParameter("num"));
String name= "";
String color= request.getParameter("color");
Class.forName("com.mysql.jdbc.Driver");
//2단계 디비 연결
String dbUrl = "jdbc:mysql://localhost:3306/teamk";
String dbId = "root";
String dbPass = "1234";
Connection con = DriverManager.getConnection(dbUrl, dbId, dbPass);
//3단계 sql
	String sql = "select name from thing where num = ?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, num);
//4단계 rs = 실행
ResultSet rs = pstmt.executeQuery();
if (rs.next()) {
	name = rs.getString(1);
}


sql = "select size,stock from thing where name = ? && color = ?";
 pstmt = con.prepareStatement(sql);
pstmt.setString(1, name);
pstmt.setString(2, color);
//4단계 rs = 실행
 rs = pstmt.executeQuery();
//5단계 rs 데이터 있으면 자바빈 객체 생성
// 				rs = > 자바빈 변수 저장
// 				배열 한칸 저장
// 자바빈 MemberBean  => JSONObject
// 배열 컬렉션 List ArrayList => JSONArray

//배열객체 생성 JSONArray 생성
JSONArray arr = new JSONArray();
while(rs.next()){
	JSONObject obj = new JSONObject();
	obj.put("size",rs.getString(1));
	obj.put("stock",rs.getString(2));
	arr.add(obj);
}
%>
<%=arr%>