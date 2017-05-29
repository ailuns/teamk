package net.admin.order.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.order.db.AdminDAO;

public class Pack_Res_Action implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String [] pnum = request.getParameterValues("pnum");
		for(int i =0; i<pnum.length;i++){
			AdminDAO adao = new AdminDAO();
			adao.PO_Status_Update(3, pnum[i]);
		}
		ActionForward afo = new ActionForward();
		afo.setPath("./Pack_res.ao");
		afo.setRedirect(true);
		return afo;
	}

}
