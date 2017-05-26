package net.admin.order.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.order.db.AdminDAO;
import net.mod.db.ModTradeInfoBEAN;

public class Admin_Pack_Res_Cancel implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String pageNum=request.getParameter("pageNum");
		AdminDAO admindao = new AdminDAO();
		ActionForward afo = new ActionForward();
		int count = admindao.Pack_Res_Count(4);
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
		List<ModTradeInfoBEAN>CancelPackList = admindao.Pack_Res(4, start, pagesize); 
		request.setAttribute("CancelPackList", CancelPackList);
		request.setAttribute("pblock", pblock);
		request.setAttribute("endpage", endpage);
		request.setAttribute("startp", startp);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pcount", pcount);
		request.setAttribute("count", count);
		afo.setPath("./Admin/PackResCancel.jsp");
		afo.setRedirect(false);
		return afo;
	}

}
