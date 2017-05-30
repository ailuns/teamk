package net.mod.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.order.db.AdminDAO;
import net.mod.db.ModDAO;

public class TO_Status_Update implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(request.getParameter("num"));
		int status = Integer.parseInt(request.getParameter("status"));
		int ti_num = Integer.parseInt(request.getParameter("ti_num"));
		String memo = request.getParameter("memo");
		String type = request.getParameter("type");
		if(memo==null)memo ="";
		if(type!=null){
			if(type.equals("")){
				memo = type+" : "+memo;	
			}
		}
		ModDAO moddao = new ModDAO();
		moddao.To_Status_Update(status, num, memo);
		AdminDAO admindao = new AdminDAO();
		if(status>8)admindao.Ti_Status_Complet_Update(ti_num);
		return null;
	}

}
