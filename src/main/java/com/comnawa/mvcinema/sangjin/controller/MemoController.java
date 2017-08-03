package com.comnawa.mvcinema.sangjin.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.comnawa.mvcinema.sangjin.model.dto.MemoDTO;
import com.comnawa.mvcinema.sangjin.service.DetailService;


@Controller
@RequestMapping("/memo/*")
public class MemoController {
	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	@Inject
	DetailService detailService;
	
	@RequestMapping("insert.do")
	public String insert(HttpServletRequest request, int score, String memo, @ModelAttribute MemoDTO dto) throws Exception {
		double score2=Double.parseDouble(score+"");
		dto.setIdx(Integer.parseInt(request.getParameter("mv_idx")));
		dto.setScore(score2);
		dto.setMemo(memo);
		logger.info("디티오:" + dto);
		detailService.insert(dto);
		return "redirect:/";
	}
}
