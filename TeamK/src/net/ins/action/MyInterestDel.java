package net.ins.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.ins.db.interestDAO;

public class MyInterestDel implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		interestDAO insdao = new interestDAO();
		//insdao.InterestDel(Integer.parseInt(request.getParameter("n")));
		response.setContentType("text/html; charset=UTF-8");//JAVA에서 JSP호출할때 사용(response 타입 설정)
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('관심목록에서 해제 되었습니다.');");
		out.println("location.href='"+request.getHeader("referer")+"'");
		out.println("</script>");
		out.close();
		return null;
	}
	
}
