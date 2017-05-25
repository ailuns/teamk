package net.ins.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.ins.db.interestDAO;

public class MyInterestCheck implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int num = Integer.parseInt(request.getParameter("num"));
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		interestDAO idao = new interestDAO();
		int check = idao.MyInterestCheck(id, num);
		request.setAttribute("check", check);
		ActionForward afo = new ActionForward();
		afo.setPath("/ins/MyInterestCheck.jsp");
		afo.setRedirect(false);
		return afo;
	}

}
