<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8");
    System.out.println("done");
    JSONObject obj = (JSONObject)request.getAttribute("obj");%>
    <%=obj%>