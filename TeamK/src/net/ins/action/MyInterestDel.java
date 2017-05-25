package net.ins.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.ins.db.interestDAO;

public class MyInterestDel implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		interestDAO insdao = new interestDAO();
		insdao.InterestDel(Integer.parseInt(request.getParameter("n")));
		response.setContentType("text/html; charset=UTF-8");//JAVA���� JSPȣ���Ҷ� ���(response Ÿ�� ����)
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('찜 목록이 해제 되었습니다.');");
		out.println("location.href='"+request.getHeader("referer")+"'");
		out.println("</script>");
		out.close();
		return null;
	}
	
}
