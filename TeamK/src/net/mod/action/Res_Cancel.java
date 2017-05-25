package net.mod.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.mod.db.ModDAO;
import net.mod.db.ModTradeInfoBEAN;

public class Res_Cancel implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int po_num = Integer.parseInt(request.getParameter("num"));
		ModDAO moddao = new ModDAO();
		ModTradeInfoBEAN mtib = moddao.PO_Info_Read(po_num);
		request.setAttribute("mtib", mtib);
		ActionForward afo = new ActionForward();
		afo.setPath("./MyOrder/Res_Cancel.jsp");
		afo.setRedirect(false);
		return afo;
	}

}
