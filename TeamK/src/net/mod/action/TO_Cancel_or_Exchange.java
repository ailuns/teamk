package net.mod.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TO_Cancel_or_Exchange implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("adfasdf");
		ActionForward afo = new ActionForward();
		afo.setPath("./MyOrder/TO_Cancel_or_Exchange.jsp");
		afo.setRedirect(false);
		return afo;
	}

}
