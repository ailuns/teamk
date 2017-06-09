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
		bnsDAO bnsdao = new bnsDAO();
		int check =0;
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(type.equals("P")){
			PBasketBEAN pbb = new PBasketBEAN();
			pbb.setId(id);
			String [] countp = {request.getParameter("adult"), request.getParameter("child")};
			pbb.setCountp(countp);
			pbb.setCost(cost);
			pbb.setOri_num(Integer.parseInt(request.getParameter("pnum")));
			check = bnsdao.PBasketCheck(pbb);
			if(check ==0){
				bnsdao.PBasketAddAction(pbb);
				out.println("<script>");
				out.println("if(confirm('지금 바로 장바구니 페이지로 이동하시겠습니까?'))"
						+ "{location.href='./MyBasketList.bns';} "
						+ "else {location.href='"+request.getHeader("referer")+"';}");
				out.println("</script>");
				out.close();
			}else{
				out.println("<script>");
				out.println("alert('동일 상품이 이미 장바구니에 있습니다');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}
		}
		if(type.equals("T")){
			String [] tnum = request.getParameterValues("tnum");
			if(request.getParameter("tnum")!=null){
				String [] costarr = request.getParameterValues("cost");
				String [] countarr = request.getParameterValues("count"); 
				TBasketBEAN tbb = new TBasketBEAN();
				tbb.setId(id);
				int ch = 0;
				for(int i = 0; i< tnum.length; i++){
					tbb.setCount(Integer.parseInt(countarr[i]));
					tbb.setCost(Integer.parseInt(costarr[i]));
					tbb.setOri_num(Integer.parseInt(tnum[i]));
					check = bnsdao.TBasketCheck(tbb);
					if(check ==0)bnsdao.TBasketAddAction(tbb);
					else ch=1;
				}
				out.println("<script>");
				if(ch == 1)out.println("alert('장바구니에 이미 있는 상품은 추가 되지 않았습니다');");
				out.println("if(confirm('지금 바로 장바구니 페이지로 이동하시겠습니까?'))"
						+ "{location.href='./MyBasketList.bns';} "
						+ "else {location.href='"+request.getHeader("referer")+"';}");
				out.println("</script>");
				out.close();
			}
		}
		return null;
	}
	
}
