package net.mod.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.mod.db.ModDAO;

public class TO_Status_Update implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(request.getParameter("num"));
		int status = Integer.parseInt(request.getParameter("status"));
		String memo = request.getParameter("memo");
		if(memo==null)memo ="";
		ModDAO moddao = new ModDAO();
		moddao.To_Status_Update(status, num, memo);
		
		return null;
	}

}
