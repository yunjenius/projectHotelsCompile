package com.kh.hotels;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HotelAdminController {

	@GetMapping("goMain.hadmin")
	public String showHotelAdmin() {
		
		return "hoteladmin/main/main";
	}
	
	@GetMapping("goMateriel.hadmin")
	public String showMateriel() {
		
		return "hoteladmin/stockMng/MaterielMng";
		
	}
}
