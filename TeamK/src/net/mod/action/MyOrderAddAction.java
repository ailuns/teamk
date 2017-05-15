package net.mod.action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.bns.db.bnsDAO;
import net.mod.db.ModDAO;
import net.mod.db.ModTradeInfoBEAN;


public class MyOrderAddAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		String []tch = request.getParameterValues("tch");
		String []pch=request.getParameterValues("pch");
		String pnum = request.getParameter("pnum");
		String tnum = request.getParameter("tnum");
		ModTradeInfoBEAN mtib = new ModTradeInfoBEAN();
		ModDAO moddao = new ModDAO();
		bnsDAO bnsdao = new bnsDAO();
		ActionForward afo = new ActionForward();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		mtib.setId(id);
		mtib.setTotal_cost(Integer.parseInt(request.getParameter("total_cost")));
		mtib.setAddress1(request.getParameter("o_receive_address1"));
		mtib.setAddress2(request.getParameter("o_receive_address2"));
		mtib.setPostcode(request.getParameter("o_receive_postcode"));
		mtib.setName(request.getParameter("o_receive_name"));
		mtib.setPayer(request.getParameter("o_receive_name"));
		mtib.setMobile(request.getParameter("o_receive_mobile"));
		mtib.setMemo(request.getParameter("o_memo"));
		String receive_check = request.getParameter("po_receive_check");
		System.out.println( request.getParameter("po_receive_check"));
		if(receive_check!=null){
			if(receive_check.equals("0")&&tnum==null&&tch==null){
				mtib.setPostcode(null);
				mtib.setAddress1(null);
				mtib.setAddress2(null);
			}
			mtib.setPo_receive_check(Integer.parseInt(receive_check));
		}
		mtib.setStatus(2);
		String trade_type = request.getParameter("t_type");
		
		switch(trade_type){
			case "카드 결제":
				trade_type+=", "+request.getParameter("select_card")+
					", 할부 : "+request.getParameter("monthly_pay")+"개월";
				break;
			case "무통장 입금":
				trade_type+=", "+request.getParameter("select_bank");
				if(request.getParameter("cash_receipt_check")!=null){
					trade_type+=", "+request.getParameter("cash_receipt_type_select")+
							", "+request.getParameter("cash_receipt_number");
				}
				mtib.setStatus(1);
					break;
		}
		
		System.out.println(trade_type);
		mtib.setTrade_type(trade_type);
		mtib=moddao.CreateTradeInfo(mtib);
		if(tch!=null){
			for(int i = 0; i<tch.length;i++){
				mtib=moddao.TBasketInfoToMTIB(Integer.parseInt(tch[i]),mtib);
				moddao.InsertThingOrder(mtib);
				
				//bnsdao.ThingBasketDelete(Integer.parseInt(tch[i]));
			}
		}
		
		if(pch!=null){
			for(int i = 0; i<pch.length;i++){
				mtib=moddao.PBasketInfoToMTIB(Integer.parseInt(pch[i]),mtib);
				moddao.InsertPackOrder(mtib);
			
				//bnsdao.PackBasketDelete(Integer.parseInt(pch[i]));
			}
		}

		if(tnum!=null){
			mtib.setOri_num(Integer.parseInt(tnum));
			mtib.setThing_count(Integer.parseInt(request.getParameter("count")));
			mtib.setColor(request.getParameter("color"));
			mtib.setSize(request.getParameter("size"));
			moddao.InsertThingOrder(mtib);
		}
		
		if(pnum!=null){
			mtib=moddao.CreateTradeInfo(mtib);
			mtib.setOri_num(Integer.parseInt(pnum));
			mtib.setPack_count(request.getParameter("adult")+","+request.getParameter("child"));
			moddao.InsertPackOrder(mtib);
		}
		afo.setPath("./Main.bns");
		afo.setRedirect(true);
		return afo;
	}
	
	

}
