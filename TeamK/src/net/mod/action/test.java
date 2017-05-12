package net.mod.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.mod.db.ModDAO;
import net.mod.db.ModTradeInfoBEAN;

public class test implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		List<Vector> test= new ArrayList<Vector>();
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");
		ModTradeInfoBEAN mtib;
		ModDAO moddao =new ModDAO();
		Vector v;
		List<ModTradeInfoBEAN> ModList = moddao.ReadModTI(id);
		for(int i = 0; i<ModList.size(); i++){
			v = new Vector();
			mtib = ModList.get(i);
			List<ModTradeInfoBEAN> ModPackList = moddao.MyPackOrder(id, mtib.getTi_num());
			List<ModTradeInfoBEAN> ModThingList = moddao.MyThingOrder(id, mtib.getTi_num());
			v.addElement(mtib);
			v.addElement(ModPackList);
			v.addElement(ModThingList);
			if(!(v.get(1) instanceof Integer)){
				System.out.println("vector ");
				List<ModTradeInfoBEAN> mpl = (List<ModTradeInfoBEAN>)v.get(1);
				for(int j = 0; j <mpl.size(); j++){
					ModTradeInfoBEAN m3 = new ModTradeInfoBEAN();
					System.out.println("MPL trade num : "+m3.getIntro());
				}
			}
			test.add(v);
		}
		System.out.println(test.size());
		ActionForward afo = new ActionForward();	
		
		for(int i =0; i <test.size(); i++){
			Vector v2 = (Vector)test.get(i);
			System.out.println("v2 size : "+v2.size());
			ModTradeInfoBEAN m1 = (ModTradeInfoBEAN)v2.get(0);
			System.out.println("m1 tradetype : "+m1.getTrade_type());
			if(!(v2.get(1) instanceof Integer)){
				System.out.println("vector second start");
				List<ModTradeInfoBEAN> mpl = (List<ModTradeInfoBEAN>)v2.get(1);
				System.out.println("mpl size : " + mpl.size());
				for(int j = 0; j <mpl.size(); j++){
					ModTradeInfoBEAN m3 = (ModTradeInfoBEAN)mpl.get(j);
					System.out.println("MPL trade num : "+m3.getTrade_num());
				}
			}
			if(!(v2.get(2) instanceof Integer)){
				System.out.println("vector third start");
				List<ModTradeInfoBEAN> mtl = (List<ModTradeInfoBEAN>)v2.get(2);
				System.out.println("mtl size : " + mtl.size());
				for(int j = 0; j <mtl.size(); j++){
					ModTradeInfoBEAN m3 = (ModTradeInfoBEAN)mtl.get(j);
					System.out.println("MTL trade num : "+m3.getTrade_num());
				}
			}
			

		}
		afo.setPath("./Main.bns");
		afo.setRedirect(true);
		request.setAttribute("test",test);
		
		return afo;
	}

}
