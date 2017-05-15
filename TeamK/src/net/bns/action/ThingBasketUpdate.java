package net.bns.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.bns.db.TBasketBEAN;
import net.bns.db.bnsDAO;

public class ThingBasketUpdate implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		TBasketBEAN tbb = new TBasketBEAN();
		System.out.println(request.getParameter("num"));
		tbb.setNum(Integer.parseInt(request.getParameter("num")));
		tbb.setCount(Integer.parseInt(request.getParameter("tcount")));
		tbb.setCost(Integer.parseInt(request.getParameter("tcost")));
		bnsDAO bnsdao = new bnsDAO();
		bnsdao.TBasketUpdate(tbb);
		/*if(check == 0){
			response.setContentType("text/html; charset=UTF-8");//JAVA���� JSPȣ���Ҷ� ���(response Ÿ�� ����)
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('����');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}else{
			response.setContentType("text/html; charset=UTF-8");//JAVA���� JSPȣ���Ҷ� ���(response Ÿ�� ����)
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('����');");
			out.println("location.href='"+request.getHeader("referer")+"'");
			out.println("</script>");
			out.close();
		}*/
		
		return null;
	}
	
}
