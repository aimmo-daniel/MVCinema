package com.comnawa.mvcinema.sangjin.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.comnawa.mvcinema.sangjin.model.dto.MemoDTO;
import com.comnawa.mvcinema.sangjin.service.DetailService;
import com.comnawa.mvcinema.sungwon.model.member.dto.MemberDTO;
import com.comnawa.mvcinema.sungwon.service.member.MemberService;


@Controller
@RequestMapping("/memo/*")
public class MemoController {
	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	@Inject
	DetailService detailService;
	@Inject
	MemberService memberService;
	
	@RequestMapping("login_page.do")
	public ModelAndView s_login_page(@RequestParam int movie_idx,ModelAndView mav){
		mav.setViewName("sangjin/info/login_popup");
		mav.addObject("movie_idx",movie_idx);
		return mav;
	}
	
	@RequestMapping("login.do")
	public ModelAndView login2(@ModelAttribute MemberDTO dto,@RequestParam int movie_idx, HttpSession session) {
		boolean result = memberService.login(dto, session);
		ModelAndView mav = new ModelAndView();
		if (result) {
			mav.setViewName("sangjin/info/login_popup");
			mav.addObject("message", "success");
			mav.addObject("movie_idx",movie_idx);
		} else {
			mav.setViewName("sangjin/info/login_popup");
			mav.addObject("message", "error");
			mav.addObject("movie_idx",movie_idx);
		}
		return mav;
	}
	
	@ResponseBody
	@RequestMapping("check_id.do")
	public MemoDTO checkId(@RequestParam String userid, @RequestParam int idx) {
		MemoDTO dto=new MemoDTO();
		dto.setUserid(userid);
		dto.setIdx(idx);
		String checkid = detailService.checkUserid(dto);
		System.out.print("체크아이디임:"+checkid);
		MemoDTO dto2=new MemoDTO();
		dto2.setUserid(checkid);
		return dto2;
	}
	
	@RequestMapping("insert.do")
	public String insert(String userid, int score, String memo, int idx) {
		MemoDTO dto=new MemoDTO();
		dto.setIdx(idx);
		dto.setScore(score);
		dto.setMemo(memo);
		dto.setUserid(userid);
		detailService.insert(dto);
		System.out.println("디티오임~~~:"+dto);
		return "redirect:/info/detail/"+dto.getIdx();
	}

	@RequestMapping("delete.do")
	public String delete(HttpServletRequest request, int comment_num, @ModelAttribute MemoDTO dto) throws Exception{
		dto.setIdx(Integer.parseInt(request.getParameter("idx")));
		detailService.delete(comment_num);
		return "redirect:/info/detail/"+dto.getIdx();
	}
	
	@RequestMapping("update.do")
	public String update(int idx, double score, String memo, int comment_num) throws Exception{
		MemoDTO dto=new MemoDTO();
		dto.setIdx(idx);
		dto.setMemo(memo);
		dto.setScore(score);
		dto.setComment_num(comment_num);
		System.out.println("디티오임:"+dto);
		detailService.update(dto);
		return "redirect:/info/detail/"+dto.getIdx();
	}
	

	
}
