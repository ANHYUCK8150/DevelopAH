package com.my.page.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.page.VO.MemberVO;
import com.my.page.service.MemberService;

@Controller
public class MemberController {
	@Resource(name = "MemService")
	private MemberService memService;
	
	@RequestMapping("member/login.do")
	public String login() {
		return "Member/Login";
	}
	
	@RequestMapping("member/confirm.do")
	public String confirm() {
		return "Member/Confirm";
	}
	
	@RequestMapping("member/reg.do")
	public String reg(MemberVO memberVO) {
		if(memberVO.getMbID() != null) {
			int result = memService.SetMember(memberVO);
		}
		
		return "Member/Login";
	}
	
	@RequestMapping("member/id_check.do")
	@ResponseBody
	public String Confirm_ID(@RequestParam(value="mbID", required=false)String mbID) {
		String mbIdx = memService.GetMemberIdx(mbID);
		String result = "FIND";
		if(mbIdx == null) {
			result = "SUCESS";
		}
		
		return result;
	}
	
	@RequestMapping("member/phone_check.do")
	@ResponseBody
	public String Confirm_Phone(@RequestParam(value="mbPhone", required=false)String mbPhone) {
		String mbIdx = memService.GetMemberPhone(mbPhone);
		String result = "FIND";
		if(mbIdx == null) {
			result = "SUCESS";
		}
		
		return result;
	}
	
	@RequestMapping("Login_OK.do")
	public String Login_OK(MemberVO memberVO, Model model, HttpSession session) throws Exception {
		
		String result = "Login";
		
		if(memberVO.getMbID() != null && memberVO.getMbPW() != null) {
			MemberVO memberInfo = memService.GetMember(memberVO);
			
			try {
				if(memberInfo.getMbIdx() == null) {
					model.addAttribute("memberInfo", memberVO);
					result = "redirect:member/login.do";
				}else {
					session.setAttribute("memberInfo", memberInfo);
					result = "redirect:home.do";
				}
			}
			catch(Exception e){
				model.addAttribute("memberInfo", memberVO);
				result = "redirect:member/login.do";
			}
			
		}
		
		return result;
	}
	
	@RequestMapping("/Logout.do")
	public String Logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:home.do";
	}
}
