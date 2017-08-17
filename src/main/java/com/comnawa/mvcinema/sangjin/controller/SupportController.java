package com.comnawa.mvcinema.sangjin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.comnawa.mvcinema.sangjin.model.dto.ContactDTO;
import com.comnawa.mvcinema.sangjin.model.dto.FaqDTO;
import com.comnawa.mvcinema.sangjin.model.dto.MovieDTO;
import com.comnawa.mvcinema.sangjin.model.dto.NoticeDTO;
import com.comnawa.mvcinema.sangjin.service.ContactService;
import com.comnawa.mvcinema.sangjin.service.FaqService;
import com.comnawa.mvcinema.sangjin.service.NoticeService;
import com.comnawa.mvcinema.sangjin.service.Pager;
import com.comnawa.mvcinema.sungwon.model.member.dto.MemberDTO;
import com.comnawa.mvcinema.sungwon.service.member.MemberService;

@Controller
@RequestMapping("/support/*")
public class SupportController {
	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	@Inject
	ContactService contactService;
	@Inject
	MemberService memberService;
	@Inject
	NoticeService noticeService;
	@Inject
	FaqService faqService;

	// 세션체크
	@RequestMapping("login_page.do")
	public String s_login_page() {
		return "sangjin/support/login_popup";
	}

	@RequestMapping("login.do")
	public ModelAndView login2(@ModelAttribute MemberDTO dto, HttpSession session) {
		boolean result = memberService.login(dto, session);
		ModelAndView mav = new ModelAndView();
		if (result) {
			mav.setViewName("sangjin/support/login_popup");
			mav.addObject("message", "success");
		} else {
			mav.setViewName("sangjin/support/login_popup");
			mav.addObject("message", "error");
		}
		return mav;
	}

	// 고객센터 메인페이지로
	@RequestMapping("main")
	public String support() {
		return "sangjin/support/main";
	}

	// 공지사항 페이지로
	@RequestMapping("notice")
	public ModelAndView notice(ModelAndView mav) {
		NoticeDTO dto = new NoticeDTO();
		dto = noticeService.notice();
		mav.setViewName("sangjin/support/notice");
		mav.addObject("dto", dto);
		return mav;
	}
	
	//자주찾는 질문 페이지로
	@RequestMapping("faq")
	public String faq(){
		return "sangjin/support/faq";
	}
	
	//자주찾는질문 카테고리 ajax
	@RequestMapping("list_faq")
	public ModelAndView list_faq(@RequestParam(defaultValue = "1") int page,
							@RequestParam(defaultValue = "all") String keyword,
							ModelAndView mav) throws Exception {
		String keyword2="";
		if(keyword.equals("all")){
			keyword2="'||c.category||'";
		}else if(keyword.equals("reserve")){
			keyword2="예매관련";
		}else if(keyword.equals("movie")){
			keyword2="영화관련";
		}else if(keyword.equals("other")){
			keyword2="기타";
		}
		int count = faqService.countFaq(keyword2);
		Pager pager = new Pager(count, page);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		List<FaqDTO> list=faqService.list_faq(start, end, keyword2);
		mav.setViewName("sangjin/support/faq_list");
		Map<String, Object> map = new HashMap<>();
		map.put("list", list); // 게시물 목록
		map.put("count", list.size());
		map.put("keyword", keyword);
		map.put("pager", pager);
		mav.addObject("map", map);
		return mav;
	}

	// 문의내역리스트
	@RequestMapping("one_to_one")
	public ModelAndView one_to_one(@RequestParam(defaultValue = "1") int page, HttpSession session,
			ModelAndView mav) {
		String userid=((MemberDTO) session.getAttribute("dto")).getUserid();
		// 레코드 갯수 계산
		int count = contactService.countOto(userid);
		// 페이지의 시작번호,끝번호 계산
		Pager pager = new Pager(count, page);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		List<ContactDTO> list = contactService.oto_list(userid, start, end);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list); // 게시물 목록
		map.put("count", list.size()); // 레코드 갯수
		map.put("pager", pager);
		mav.setViewName("sangjin/support/one_to_one");
		mav.addObject("map", map);
		return mav;
	}

	// 문의내역상세보기
	@RequestMapping("oto_view")
	public ModelAndView oto_view(@RequestParam int idx, ModelAndView mav) {
		ContactDTO dto = contactService.oto_view(idx);
		mav.setViewName("sangjin/support/oto_view");
		mav.addObject("dto", dto);
		return mav;
	}

	// 문의작성페이지로
	@RequestMapping("write")
	public ModelAndView write(HttpSession session, ModelAndView mav) {
		String userid = ((MemberDTO) session.getAttribute("dto")).getUserid();
		MemberDTO dto = contactService.userInfo(userid);
		mav.setViewName("sangjin/support/write");
		mav.addObject("dto", dto);
		return mav;
	}

	// 문의작성
	@RequestMapping("write_oto.do")
	public String write_oto(@RequestParam String title, @RequestParam String content, HttpSession session) {
		ContactDTO dto = new ContactDTO();
		String userid = ((MemberDTO) session.getAttribute("dto")).getUserid();
		content=content.replace("<","");
		content=content.replace(">","");
		title=title.replace("<","");
		title=title.replace(">","");
		dto.setContent(content);
		dto.setTitle(title);
		dto.setUserid(userid);
		contactService.insert(dto);
		return "redirect:/support/one_to_one";
	}

	// 문의내역 삭제
	@RequestMapping("deleteOne")
	public String delete(@RequestParam int idx) {
		contactService.DeleteOne(idx);
		return "redirect:/support/one_to_one";
	}

	// 문의내역 전체삭제
	@RequestMapping("deleteAll")
	public String deleteAll(HttpSession session) {
		String userid = ((MemberDTO) session.getAttribute("dto")).getUserid();
		contactService.DeleteAll(userid);
		return "redirect:/support/one_to_one";
	}

	// 문의내역이 있는지 확인
	@ResponseBody
	@RequestMapping("check_content.do")
	public String check_content(@RequestParam String userid) {
		int check = contactService.countOto(userid);
		if (check == 0) {
			return "null";
		} else {
			return "not null";
		}
	}

}
