package com.kh.hotels.mngMember.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.hotels.common.model.vo.Info;
import com.kh.hotels.mngMember.model.exception.LoginException;
import com.kh.hotels.mngMember.model.service.MemberService;
import com.kh.hotels.mngMember.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService ms;

	@PostMapping("login.me")
	public String loginMember(Member m, Model model) {
		
		Member loginUser;
		
		try {

			loginUser = ms.loginMember(m);
			
			model.addAttribute("loginUser", loginUser);
			System.out.println(loginUser);
			if(loginUser.getDeptNo() == 1) {
				
				int result = ms.checkHotelSetting();
				
				if(result == 0) {
					return "hotelSetting/hotelInfoSetting";
				}else {
					return "redirect:/view.ro";
				}
				
			}else if(loginUser.getDeptNo() == 3){

				if(loginUser.getPwdStatus().equals("Y")) {
				
					return "redirect:/documentApproval.ap";
					
				}else{
					
					return "hoteladmin/main/pwdReset";
					
				}
			}else if(loginUser.getDeptNo() == 2){
				
				if(loginUser.getPwdStatus().equals("Y")) {
					
					return "redirect:/selectStock.sto";
					
				}else{
	
					return "hoteladmin/main/pwdReset";
					
				}
			}else {
				
				if(loginUser.getPwdStatus().equals("Y")) {
					
					return "redirect:/view.ro";
					
				}else{
	
					return "hoteladmin/main/pwdReset";
					
				}
			}
			
			
		} catch (LoginException e) {
			
			model.addAttribute("msg", "????????? ??????????????? ??????????????????.");
			
			return "hoteladmin/main/login";
		}
		
	}
	
	@PostMapping("idCheck.me")
	public void idCheck(@RequestParam String userId, HttpServletResponse response) {
		
		int result = ms.selectMemberId(userId);
		
		if(result > 0) {
			try {
				response.getWriter().append("success");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			try {
				response.getWriter().append("fail");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	@PostMapping("insertMember.me")
	public String insertMember(Member m, HttpServletRequest request) {
		
		int result = ms.insertMember(m);
		
		if(result > 0) {
			return "redirect:/hotelUserInsert.st";
		}else {
			request.setAttribute("msg", "??????????????????");
			return "common/errorPage";
		}
		
	}
	
	@PostMapping("pwdReset.me")
	public String updatePassword(Member m, Model model) {
		
		int result = ms.updateMemberPwd(m);
		
		if(result > 0) {
			model.addAttribute("msg", "?????? ????????? ????????????.");
			return "hoteladmin/main/login";
		}else {
			model.addAttribute("msg", "???????????? ?????? ??????");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("logout.me")
	public String logoutMember(SessionStatus status) {
	
		status.setComplete();
		
		return "redirect:index.jsp";
	}
	
}
