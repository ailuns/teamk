package net.admin.order.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.order.db.AdminDAO;

public class TransNum_Insert_Action implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String [] to_num = request.getParameterValues("to_num");
		String [] Trans_Num = request.getParameterValues("Trans_Num");
		String [] ti_num=request.getParameterValues("ti_num");
		AdminDAO aodao = new AdminDAO();
		for(int i =0 ; i<to_num.length; i++){
			System.out.println(to_num[i]+">>>>>>>>"+Trans_Num[i].length());
			if(Trans_Num[i].length()!=0){
				System.out.println(to_num[i]+" : "+Trans_Num[i]);
				aodao.Trans_Num_Insert(to_num[i], Trans_Num[i]);
			}
		}
		for(int i = 0 ; i<ti_num.length; i++){
			aodao.Ti_Status_Waiting_Update(Integer.parseInt(ti_num[i]));
		}
		ActionForward afo = new ActionForward();
		afo.setPath("./TransNum_Insert.ao");
		afo.setRedirect(true);
		return afo;
	}

}
