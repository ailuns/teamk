package net.mod.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.mod.db.ModDAO;
import net.mod.db.ModTradeInfoBEAN;

public class Res_Cancel_Action implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String [] memo = request.getParameterValues("Cancel_info");
		System.out.println(memo.length);
		String po_memo="거래방식 : "+memo[1]+", 환불 금액 : "+memo[0]+"원";
		if(memo.length>2){
			po_memo +=", 은행명 : "+memo[2]+", 예금주 : "+memo[3]
						+", 계좌 번호 : "+memo[4];
		}
		ModTradeInfoBEAN mtib = new ModTradeInfoBEAN();
		mtib.setNum(Integer.parseInt(request.getParameter("pnum")));
		mtib.setMemo(po_memo);
		ModDAO moddao = new ModDAO();
		int check =moddao.Res_Cancel(mtib);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(check ==1){
			out.println("<script>");
			out.println("alert('취소 신청이 완료 되었습니다!');");
			out.println("window.opener.location.reload();");
			out.println("window.close();");
			out.println("</script>");
			out.close();
		}
		return null;
	}

}