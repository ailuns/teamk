package net.bns.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.bns.db.bnsDAO;

public class MyBasketAddAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		if(id == null){
			ActionForward afo = new ActionForward();
			afo.setPath("./Main.bns");
			afo.setRedirect(true);
			return afo;
		}
		int num = Integer.parseInt(request.getParameter("select"));
		String type = request.getParameter("type");
		bnsDAO bnsdao = new bnsDAO();
		int check = bnsdao.BasketAddAction(id, num, type);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(check ==1){
			out.println("<script>");
			out.println("alert('장바구니에 담았습니다!');");
			out.println("location.href='"+request.getHeader("referer")+"';");
			out.println("</script>");
			out.close();
		}else{
			out.println("<script>");
			out.println("alert('동일 물품이 이미 장바구니에 있습니다');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
		return null;
	}
	
}
