package com.kh.hotels.mngStock.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hotels.common.model.vo.PageInfo;
import com.kh.hotels.common.model.vo.Pagination;
import com.kh.hotels.mngApproval.model.exception.ReportException;
import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngStock.model.Service.StockService;
import com.kh.hotels.mngStock.model.Service.warehouseService;
import com.kh.hotels.mngStock.model.vo.Conn;
import com.kh.hotels.mngStock.model.vo.His;
import com.kh.hotels.mngStock.model.vo.Item;
import com.kh.hotels.mngStock.model.vo.ItemHistory;
import com.kh.hotels.mngStock.model.vo.ItemType;
import com.kh.hotels.mngStock.model.vo.RepHistory;
import com.kh.hotels.mngStock.model.vo.OrderHis;
import com.kh.hotels.mngStock.model.vo.OrderHisDetail;
import com.kh.hotels.mngStock.model.vo.Repair;
import com.kh.hotels.mngStock.model.vo.SearchItem;
import com.kh.hotels.mngStock.model.vo.Stock;
import com.kh.hotels.mngStock.model.vo.Strg;
import com.kh.hotels.mngStock.model.vo.StrgArea;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class StockController {
	@Autowired
	private StockService ss;
	@Autowired
	private warehouseService ws;
	
	@RequestMapping("selectStock.sto")
	public String selectStockList(HttpServletRequest request, Model  m) {
		
		int currentPage = 1; 
		 
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} 
		int listCount = ss.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		try {
			ArrayList<Stock> stockList = ss.selectStockList(pi);
			System.out.println("stockList : " + stockList);
			for(int i=0;i<stockList.size();i++) {
				if(stockList.get(i).getType().equals("EQUIP")) {
					stockList.get(i).setType("??????");
				}else if(stockList.get(i).getType().equals("CONS")) {
					stockList.get(i).setType("?????????");
				}
			}
			m.addAttribute("stockList", stockList);
			m.addAttribute("pi", pi);
			
			return "hoteladmin/mngStock/stock/stockNow";
			
		} catch (Exception e) {
			m.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@RequestMapping("selectRepair.sto")
	public String selectRepairList(HttpServletRequest request,Model m, String currentPage){
		
		System.out.println("??????????????");
		int scurrentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			scurrentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int listCount = ss.getRepairListCount();
		PageInfo pi = Pagination.getPageInfo(scurrentPage, listCount);
		try {
			ArrayList<RepHistory> repairList = ss.repairList(pi);
			
			System.out.println("???????????? ?????????????");
			for(int i=0;i<repairList.size();i++) {
				if(repairList.get(i).getRepStatus().equals("Y")) {
					repairList.get(i).setRepStatus("????????????");
				}else {
					repairList.get(i).setRepStatus("?????????");
				}
				
				System.out.println("???????????????????????? : " + repairList);
			}
			
			
			m.addAttribute("repairList", repairList);
			m.addAttribute("pi", pi);
			System.out.println("????????? repairList : " + repairList);
			
			return "hoteladmin/mngStock/stock/repairRequest";
			
		} catch (Exception e) {
			m.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@GetMapping("repairFilter.sto")
	public ModelAndView repairFilterDetail(HttpServletRequest request, ModelAndView mv, String rptNo, String repNo) {
		
		System.out.println("rptNo : " + rptNo);
		System.out.println("repNo : " + repNo);
		
		int rptno = Integer.parseInt(rptNo);
		System.out.println("???????????????????");
		System.out.println("rptno : " + rptno);
		RepHistory rHistory = new RepHistory();
		rHistory.setRptNo(rptno);
		System.out.println("???????2");
		
		ArrayList<HashMap<String, Object>> list = ss.selectRepairDetail(rHistory);
		
		String str = (String)list.get(0).get("REP_BEGIN");
		String str2 = str.substring(0,11);
		System.out.println("str2 : " + str2);
		
		list.get(0).put("REP_BEGIN", str2);
		System.out.println("??????list : " + list);
		
		Object receiver = list.get(0).get("RECEIVER");
		int smno = Integer.parseInt(receiver.toString());
		System.out.println("receiver : " + smno);
		
		String name = ss.selectReceiver(smno);
		
		System.out.println("name : " + name);
		
		list.get(0).put("RECEIVER", name);
		
		System.out.println("?????????????????? : " + list);
		
		mv.addObject("list", list);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	@PostMapping("insertStock.sto")
	public String insertStock(Model m, Stock st) {
		
		System.out.println("con st : "+ st);
		System.out.println("con m : "+ m);
		int result = 0;
		for(int i=0;i<st.getUnit();i++) {
			 result = ss.insertStock(m, st);			
		}
		
		if(result>0) {
			return "redirect:selectStock.sto";
		}else {
			return "common/errorPage";
		}
	}
	//////
	
	@PostMapping("selectStockDetail.sto")
	public ModelAndView selectStockDetail(String iName,ModelAndView mv) {
		
		System.out.println("con : " + iName);
		
		
		ArrayList<Stock> stockDetailList = ss.stockDetailList(iName);
		
		System.out.println("stockDetailList : " + stockDetailList);
		
		mv.setViewName("jsonView");
		mv.addObject("stockDetailList",stockDetailList);
		
		return mv;
		
	}
	
	@RequestMapping("selectCategory.sto")
	public ModelAndView selectCategory(String mcategory,String lcategory,ModelAndView mv) {
		ItemType it = new ItemType();
		it.setlCategory(lcategory);
		it.setmCategory(mcategory);
		
		ArrayList<ItemType> categoryList = ss.categoryList(it);
		
		mv.setViewName("jsonView");
		mv.addObject("categoryList",categoryList);
		
		return mv;
	}
	
	@PostMapping("insertCategory.sto")
	public String insertCategory(String lcategory,String mcategory,String scategory,String type) {
		ItemType it = new ItemType();
		
		it.setlCategory(lcategory);	
		it.setmCategory(mcategory);
		it.setsCategory(scategory);
		it.setType(type);
		
		int result = ss.insertCategory(it);
		
		if(result>0) {
			return "redirect:selectStock.sto";
		}else {
			return "common/errorPage";
		}
		
	}
	//?????????????????????
	@PostMapping("selectScategory.sto")
	public ModelAndView selectScategory(ModelAndView mv) {
		
		ArrayList<ItemType> sCategoryList = ss.selectScategory();
		
		mv.setViewName("jsonView");
		mv.addObject("sCategoryList",sCategoryList);
		
		return mv;
		
	}
	
	//???????????????
	@PostMapping("selectCnName.sto")
	public ModelAndView selectCnName(ModelAndView mv,int typeNo) {
		
		ArrayList<Conn> Conn = ss.selectCnName(typeNo);
		
		mv.setViewName("jsonView");
		mv.addObject("Conn",Conn);
		
		return mv;
		
	}
	
	//????????????
	@PostMapping("deleteStock.sto")
	public String deleteStock(String checkRow) {
		
		int result = 0 ;
		
		  String checkRowSplit[] = checkRow.split(",");
		  
		  His h = new His();
		  for(int i = 0; i < checkRowSplit.length; i++) {
			  int check = Integer.parseInt(checkRowSplit[i]);
			  result =ss.deleteStock(check);
			  h.setIno(check);
			  
			  System.out.println(check+" + check ------------------");
			  int result1 = ss.deleteStockHis(h);
			  }
		  	  
		if(result>0) {
			return "redirect:selectStock.sto";
		}else {
			return "common/errorPage";
		}
		
	}
	
	@PostMapping("updateStock.sto")
	public ModelAndView updateStock(ModelAndView mv) {
		
		ArrayList<Strg> strgList = ws.selectList();
		ArrayList<Item> rmNoList = ss.selectRmNoList(); 
		
	//	ArrayList<StrgArea> AreaList = ws.selectAreaList();
		
		mv.setViewName("jsonView");
		mv.addObject("strgList",strgList);
		mv.addObject("rmNoList",rmNoList);
		System.out.println("rmNoList : "+ rmNoList);
		System.out.println("strgList : "+ strgList);
		//mv.addObject("AreaList",AreaList);
		
		return mv;
	}
	
	@RequestMapping("updateStockOk.sto")
	public ModelAndView updateStockOk(ModelAndView mv,int ino,int amount,String strgName,int areaNo,int rmNo
			,int zino,int zamount,String zstrgName,int zareaNo,int zrmNo) {
		
		System.out.println("//////?????????////");
		System.out.println(ino);
		System.out.println(amount);
		System.out.println(strgName);
		System.out.println(areaNo);
		System.out.println(rmNo);
		System.out.println("///////??????///////");
		System.out.println(zino);
		System.out.println(zamount);
		System.out.println(zstrgName);
		System.out.println(zareaNo);
		System.out.println(zrmNo);
		Stock st = new Stock();
		st.setIno(ino);
		st.setAmount(amount);
		st.setStrgName(strgName);
		if(rmNo==0) {
			st.setRmNo(0);
		}else {
			st.setRmNo(rmNo);
		}
		st.setAreaNo(areaNo);
		int result = ss.updateStockOk(st);
		
		His h = new His();
		
		if(result>0) {
			if(st.getStrgName().equals(zstrgName)) {
				h.setIno(zino);
				h.setModCol("STRG_NO");
				h.setBefData(zstrgName);
				h.setAftData(strgName);
				int result1 = ss.updateStockHis(h);
			}else {
				h.setIno(zino);
				h.setModCol("STRG_NO");
				h.setBefData(zstrgName);
				h.setAftData(strgName);
				int result1 = ss.updateStockHis(h);
			}
			
			if(st.getAmount()!=zamount) {
				h.setIno(zino);
				h.setModCol("AMOUNT");
				h.setBefData(zamount+"");
				h.setAftData(amount+"");
				int result2 = ss.updateStockHis(h);
			}else {
				h.setIno(zino);
				h.setModCol("AMOUNT");
				h.setBefData(zamount+"");
				h.setAftData(amount+"");
				int result2 = ss.updateStockHis(h);
			}
			
			if(st.getAreaNo()!=zareaNo) {
				h.setIno(zino);
				h.setModCol("AREA_NO");
				h.setBefData(zareaNo+"");
				h.setAftData(areaNo+"");
				int result3 = ss.updateStockHis(h);
				h.setAftData(null);
			}else {
				h.setIno(zino);
				h.setModCol("AREA_NO");
				h.setBefData(zareaNo+"");
				h.setAftData(areaNo+"");
				int result3 = ss.updateStockHis(h);
				h.setAftData(null);
			}
			if(st.getRmNo()!=zrmNo) {
				h.setIno(zino);
				h.setModCol("RM_NO");
				h.setBefData(zrmNo+"");
				h.setAftData(rmNo+"");
				int result4 = ss.updateStockHis(h);
			}else {
				h.setIno(zino);
				h.setModCol("RM_NO");
				h.setBefData(zrmNo+"");
				h.setAftData(rmNo+"");
				int result4 = ss.updateStockHis(h);
			}
			
		}else {
			System.out.println("xx");
		}
			
		mv.setViewName("jsonView");
			
		return mv;
		}


	@PostMapping("searchItem.sto")
	public String searchItem(Model model ,SearchItem s, HttpServletRequest request) {
		

		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int searchCount = ss.getSearchCount(s);

		PageInfo pi = Pagination.getPageInfo(currentPage, searchCount);
		
		ArrayList<Stock> searchList = ss.selectSearchList(s, pi);
		
		model.addAttribute("check", "ok");
		model.addAttribute("stockList", searchList);
		model.addAttribute("searchContent", s.getSearchValue());
		model.addAttribute("searchCount", searchCount);
		model.addAttribute("pi", pi);
		
		return "hoteladmin/mngStock/stock/stockNow";
		
	}
	
	@GetMapping("goPurchaseHis.st")
	public String showPurchaseHis(HttpServletRequest request, Model model) {
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = ss.getPurchaseHisListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<OrderHis> orderHisList = ss.selectOrderHisList(pi);
		
		
		model.addAttribute("pi", pi);
		model.addAttribute("orderHisList", orderHisList);
		
		
		return "hoteladmin/mngStock/stock/purchaseHis";
	}

	@PostMapping("orderHisDetail.st")
	public ModelAndView orderHisDetail(ModelAndView mv, String rptNo) {
		
		int reportNo = Integer.parseInt(rptNo);
		
		ArrayList<OrderHisDetail> orderHisDetailList = ss.selectOrderHisDetail(reportNo);
		
		mv.addObject("orderHisDetailList", orderHisDetailList);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	@RequestMapping("updateCheckProduct.st")
	public String updateCheckProduct(Model model, String rptNo) {
		
		int reportNo = Integer.parseInt(rptNo);
		
		ArrayList<OrderHisDetail> orderHisDetailList = ss.selectOrderHisDetail(reportNo);
		
		
		int result = ss.insertCheckItem(orderHisDetailList);
		
		int result2 = ss.updateOrderHisStatus(reportNo);
				
		if(result > 0 && result2 > 0) {
			return "redirect:/goPurchaseHis.st";
		}else {
			model.addAttribute("msg", "??????????????????");
			return "common/errorPage";
		}
		
	}
	
	/////////////////////////////////////////////////////
	@RequestMapping("selectStockHis.sto")
	public String selectStockHis(HttpServletRequest request,Model m){

	
		try {
			ArrayList<ItemHistory> stockHisList = ss.stockHisList();
			ArrayList<ItemHistory> stockHis = new ArrayList<ItemHistory>(); 
			ItemHistory itemHistory = new ItemHistory();
			ArrayList<ItemHistory> real = new ArrayList<ItemHistory>();
			for(int i=0;i<stockHisList.size();i++) {
				
				/*
				 * if(stockHisList.get(i).getType().equals("EQUIP")) {
				 * stockHisList.get(i).setType("??????"); }else {
				 * stockHisList.get(i).setType("?????????"); }
				 */
				//System.out.println(stockHisList.get(i)+"geti");
				
				 if(stockHisList.get(i).getAftName()!=null&&stockHisList.get(i).getAmount()!=null) { 
					 stockHisList.get(i).setAftName(null);
					 }
				 
				for(int j=0;j<stockHisList.size();j++) {
					if(stockHisList.get(i).getModDate().equals(stockHisList.get(j).getModDate())&&stockHisList.get(i).getIno()==stockHisList.get(j).getIno()){
						//System.out.println(stockHisList.get(j).getModDate()+"...........");
						
						itemHistory.setIno(stockHisList.get(j).getIno());
						itemHistory.setIname(stockHisList.get(j).getIname());
						itemHistory.setModDate(stockHisList.get(j).getModDate());
						itemHistory.setType(stockHisList.get(j).getType());
						
						if(stockHisList.get(j).getModCol().equals("AMOUNT")) {
							itemHistory.setAmount(stockHisList.get(j).getAmount());
						}
						if(stockHisList.get(j).getModCol().equals("RM_NO")) {
							itemHistory.setAftRmNum(stockHisList.get(j).getAftRmNum());
						}
						if(stockHisList.get(j).getModCol().equals("AREA_NO")) {
							itemHistory.setAftName(stockHisList.get(j).getAftName());
						}
						if(stockHisList.get(j).getModCol().equals("STRG_NO")) {
							itemHistory.setAftStrgName(stockHisList.get(j).getAftStrgName());
						}
						
						if(itemHistory.getIname() != null && itemHistory.getIno() > 0 && itemHistory.getModDate() !=null && itemHistory.getAmount() != null && itemHistory.getType() != null && itemHistory.getAftRmNum() != null) {
							stockHis.add(itemHistory);
							itemHistory = new ItemHistory();
						}else if(itemHistory.getIname() != null && itemHistory.getIno() > 0 && itemHistory.getModDate() !=null && itemHistory.getAmount() != null && itemHistory.getType() != null && itemHistory.getAftName()!=null && itemHistory.getAftStrgName()!=null) {
							stockHis.add(itemHistory);
							itemHistory = new ItemHistory();
						}
						//stockHis.add(itemHistory);			
					}
				}
				
			}
			for(int i =0; i<stockHis.size();i+=4) {
				
				real.add(stockHis.get(i));
			}
			
			for(int i=0; i<real.size();i++) {
				System.out.println("???????????????...");
				System.out.println(real.get(i));
			}
			
			
			
			m.addAttribute("stockHis", real);
			return "hoteladmin/mngStock/stock/stockHis";

		} catch (Exception e) {
			m.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}




}