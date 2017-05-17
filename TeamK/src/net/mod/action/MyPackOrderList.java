package net.mod.action;

import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.mod.db.ModDAO;
import net.mod.db.ModTradeInfoBEAN;

public class MyPackOrderList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ActionForward afo = new ActionForward();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		ModDAO moddao = new ModDAO();
		String pageNum = request.getParameter("pageNum");
		int count = moddao.PO_Count(id);
		if (pageNum == null)
			pageNum = "1";
		int curpage = Integer.parseInt(pageNum);
		int pagesize = 10;
		int start = (curpage - 1) * pagesize + 1;
		int pcount = count / pagesize + (count % pagesize == 0 ? 0 : 1);
		int pblock = 10;
		int startp=((curpage-1)/pblock)*pblock+1;
		int endpage=startp+pblock-1;
		if(endpage > pcount)endpage = pcount;
		List<ModTradeInfoBEAN> ModPList = new ArrayList<ModTradeInfoBEAN>();
		ModPList = moddao.MyPackOrder(id, start, pagesize);
		
		request.setAttribute("ModPList", ModPList);
		request.setAttribute("pblock", pblock);
		request.setAttribute("endpage", endpage);
		request.setAttribute("startp", startp);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pcount", pcount);
		request.setAttribute("count", count);
		afo.setPath("./MyOrder/MyPackOrderList.jsp");
		afo.setRedirect(false);
		return afo;
	}

}
