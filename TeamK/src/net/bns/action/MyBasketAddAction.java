package net.bns.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.bns.db.PBasketBEAN;
import net.bns.db.TBasketBEAN;
import net.bns.db.bnsDAO;

public class MyBasketAddAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String type = request.getParameter("type");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		int cost = Integer.parseInt(request.getParameter("cost"));
		int ori_num = Integer.parseInt(request.getParameter("num"));
		bnsDAO bnsdao = new bnsDAO();
		int check =0;
		if(type.equals("P")){
			PBasketBEAN pbb = new PBasketBEAN();
			pbb.setId(id);
			String [] countp = {request.getParameter("adult"), request.getParameter("child")};
			pbb.setCountp(countp);
			pbb.setCost(cost);
			pbb.setOri_num(ori_num);
			check = bnsdao.PBasketCheck(pbb);
			if(check ==0)bnsdao.PBasketAddAction(pbb);
		}
		if(type.equals("T")){
			TBasketBEAN tbb = new TBasketBEAN();
			tbb.setId(id);
			tbb.setCount(Integer.parseInt("count"));
			tbb.setCost(cost);
			tbb.setOri_num(ori_num);
			check = bnsdao.TBasketCheck(tbb);
			if(check ==0)bnsdao.TBasketAddAction(tbb);
		}
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		System.out.println(check);
		if(check == 1){
			out.println("<script>");
			out.println("alert('동일 물품이 이미 장바구니에 있습니다');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}else{
			out.println("<script>");
//			out.println("location.href='./MyBasketList.bns';");
			out.println("if(confirm('장바구니에 담았습니다!\n지금 바로 장바구니 페이지로 이동하시겠습니까?'))");
//			out.println("alert('asdfasdf');");
//			out.println("location.href='./MyBasketList.bns';");
//			out.println("if(confirm('장바구니에 담았습니다!\n지금 바로 장바구니 페이지로 이동하시겠습니까?'))");
//					+ "{"
//					+"location.href='./MyBasketList.bns';}"
//					 + "else{location.href='"+request.getHeader("referer")+"';}");
			out.println("</script>");
		
			out.close();
		}
		return null;
	}
	
}
