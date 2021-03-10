package study.team.abuhae.controllers;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import study.team.abuhae.helper.WebHelper;
import study.team.abuhae.model.Member;
import study.team.abuhae.model.Sitter_info;
import study.team.abuhae.service.MemberService;

@Slf4j
@Controller
public class JoinSitterController {
	// service 객체 패턴 구현체 주입
	@Autowired
	MemberService memberService;

	// webhelper 주입
	@Autowired
	WebHelper webhelper;

	Sitter_info sitterinfo = new Sitter_info();
	// 프로젝트 이름의 ContextPath 주입
	@Value("#{servletContext.contextPath}")
	String contextPath;

	@RequestMapping(value = "/join/sitter/start.do", method = RequestMethod.GET)
	public String s_join_start(Model model, HttpServletResponse response, @RequestParam(value = "type") char type) {
		// 파라미터 저장
		sitterinfo.setType(type);
		log.debug("선택한 타입 >> " + sitterinfo.getType());

		return "/join/sitter/start";
	}
	
	@RequestMapping(value = "/join/sitter/sitter_type.do", method = RequestMethod.GET)
	public String s_join_type(Model model, HttpServletResponse response) {

		return "/join/sitter/sitter_type";
	}
	
	@RequestMapping(value = "/join/sitter/activity_age.do", method = RequestMethod.POST)
	public ModelAndView s_join_acage(Model model, 
			@RequestParam(value = "type") char type,
			@RequestParam(value = "sitter_type") String sitter_type) {

		// 저장할 값 beans에 담기
		sitterinfo.setType(type);
		sitterinfo.setSitter_type(sitter_type);


		// 저장된 결과 조회하기 위한 객체
		// Mom_info output = null;

		log.debug(sitterinfo.toString());

		model.addAttribute("type", type);
		model.addAttribute("sitter_type", sitter_type);

		return new ModelAndView("/join/sitter/activity_age");
	}
	
	@RequestMapping(value = "/join/sitter/location.do", method = RequestMethod.POST)
	public ModelAndView s_join_loc(Model model, 
			@RequestParam(value = "type") char type,
			@RequestParam(value = "sitter_type") String sitter_type,
			@RequestParam(value = "want_act1") String want_act1,
			@RequestParam(value = "want_act2", required = false) String want_act2,
			@RequestParam(value = "want_act3", required = false) String want_act3,  
			@RequestParam(value = "want_age") String want_age
			) {

		// 저장할 값 beans에 담기
		sitterinfo.setType(type);
		sitterinfo.setSitter_type(sitter_type);
		sitterinfo.setWant_act1(want_act1);
		sitterinfo.setWant_act2(want_act2);
		sitterinfo.setWant_act3(want_act3);
		sitterinfo.setWant_age(want_age);



		// 저장된 결과 조회하기 위한 객체
		// Mom_info output = null;

		log.debug(sitterinfo.toString());

		model.addAttribute("type", type);
		model.addAttribute("sitter_type", sitter_type);
		model.addAttribute("want_act1", want_act1);
		model.addAttribute("want_act2", want_act2);
		model.addAttribute("want_act3", want_act3);
		model.addAttribute("want_age", want_age);



		return new ModelAndView("/join/sitter/location");
		// return webHelper.getJsonData(map);
		// return "/join/parent/children";
	}
	

	
	@RequestMapping(value = "/join/sitter/detail.do", method = RequestMethod.POST)
	public String s_join_detail(Model model, HttpServletResponse response,
			@RequestParam(value = "type") char type,
			@RequestParam(value = "sitter_type") String sitter_type,
			@RequestParam(value = "want_act1") String want_act1,
			@RequestParam(value = "want_act2", required = false) String want_act2,
			@RequestParam(value = "want_act3", required = false) String want_act3, 
			@RequestParam(value = "want_age") String want_age,
			@RequestParam(value = "si") String si,
			@RequestParam(value = "gu") String gu, 
			@RequestParam(value = "dong") String dong) {

		// 저장할 값 beans에 담기
		sitterinfo.setType(type);
		sitterinfo.setSitter_type(sitter_type);
		sitterinfo.setWant_act1(want_act1);
		sitterinfo.setWant_act2(want_act2);
		sitterinfo.setWant_act3(want_act3);
		sitterinfo.setWant_age(want_age);
		sitterinfo.setSi(si);
		sitterinfo.setGu(gu);
		sitterinfo.setDong(dong);


		// 저장된 결과 조회하기 위한 객체
		// Mom_info output = null;

		log.debug(sitterinfo.toString());

		model.addAttribute("type", type);
		model.addAttribute("sitter_type", sitter_type);
		model.addAttribute("want_act1", want_act1);
		model.addAttribute("want_act2", want_act2);
		model.addAttribute("want_act3", want_act3);
		model.addAttribute("want_age", want_age);
		model.addAttribute("si", si);
		model.addAttribute("gu", gu);
		model.addAttribute("dong", dong);

		return "/join/sitter/detail";
	}
	
	@RequestMapping(value = "/join/sitter/payment.do", method = RequestMethod.POST)
	public ModelAndView s_join_paycctv(Model model, 
			@RequestParam(value = "type") char type,
			@RequestParam(value = "sitter_type") String sitter_type,
			@RequestParam(value = "want_act1") String want_act1,
			@RequestParam(value = "want_act2", required = false) String want_act2,
			@RequestParam(value = "want_act3", required = false) String want_act3, 
			@RequestParam(value = "want_age") String want_age,
			@RequestParam(value = "si") String si,
			@RequestParam(value = "gu") String gu, 
			@RequestParam(value = "dong") String dong,
			@RequestParam(value = "schedule") String schedule) {


		// 저장할 값 beans에 담기
		sitterinfo.setType(type);
		sitterinfo.setSitter_type(sitter_type);
		sitterinfo.setWant_act1(want_act1);
		sitterinfo.setWant_act2(want_act2);
		sitterinfo.setWant_act3(want_act3);
		sitterinfo.setWant_age(want_age);
		sitterinfo.setSi(si);
		sitterinfo.setGu(gu);
		sitterinfo.setDong(dong);
		sitterinfo.setSchedule(schedule);

		// 저장된 결과 조회하기 위한 객체
		// Mom_info output = null;

		log.debug(sitterinfo.toString());

		model.addAttribute("type", type);
		model.addAttribute("sitter_type", sitter_type);
		model.addAttribute("want_act1", want_act1);
		model.addAttribute("want_act2", want_act2);
		model.addAttribute("want_act3", want_act3);
		model.addAttribute("want_age", want_age);
		model.addAttribute("si", si);
		model.addAttribute("gu", gu);
		model.addAttribute("dong", dong);
		model.addAttribute("schedule", schedule);

		return new ModelAndView("/join/sitter/payment_cctv");
		// return webHelper.getJsonData(map);
		// return "/join/parent/children";
	}
	
	@RequestMapping(value = "/join/sitter/introduce.do", method = RequestMethod.POST)
	public ModelAndView s_join_intro(Model model, 
			@RequestParam(value = "type") char type,
			@RequestParam(value = "sitter_type") String sitter_type,
			@RequestParam(value = "want_act1") String want_act1,
			@RequestParam(value = "want_act2", required = false) String want_act2,
			@RequestParam(value = "want_act3", required = false) String want_act3, 
			@RequestParam(value = "want_age") String want_age,
			@RequestParam(value = "si") String si,
			@RequestParam(value = "gu") String gu, 
			@RequestParam(value = "dong") String dong,
			@RequestParam(value = "schedule") String schedule, 
			@RequestParam(value = "payment") String paymentstr, 
			@RequestParam(value = "cctv") char cctv) {

		paymentstr = paymentstr.replace(",", "");
		int payment = Integer.parseInt(paymentstr);
		
		// 저장할 값 beans에 담기
		sitterinfo.setType(type);
		sitterinfo.setSitter_type(sitter_type);
		sitterinfo.setWant_act1(want_act1);
		sitterinfo.setWant_act2(want_act2);
		sitterinfo.setWant_act3(want_act3);
		sitterinfo.setWant_age(want_age);
		sitterinfo.setSi(si);
		sitterinfo.setGu(gu);
		sitterinfo.setDong(dong);
		sitterinfo.setSchedule(schedule);
		sitterinfo.setPayment(payment);
		sitterinfo.setCctv(cctv);

		// 저장된 결과 조회하기 위한 객체
		// Mom_info output = null;

		log.debug(sitterinfo.toString());

		model.addAttribute("type", type);
		model.addAttribute("sitter_type", sitter_type);
		model.addAttribute("want_act1", want_act1);
		model.addAttribute("want_act2", want_act2);
		model.addAttribute("want_act3", want_act3);
		model.addAttribute("want_age", want_age);
		model.addAttribute("si", si);
		model.addAttribute("gu", gu);
		model.addAttribute("dong", dong);
		model.addAttribute("schedule", schedule);
		model.addAttribute("payment", payment);
		model.addAttribute("cctv", cctv);
		

		return new ModelAndView("/join/sitter/introduce");
		// return webHelper.getJsonData(map);
		// return "/join/parent/children";
	}
	
	@RequestMapping(value = "/join/sitter/agreement.do", method = RequestMethod.POST)
	public ModelAndView s_join_agree(Model model, 
			@RequestParam(value = "type") char type,
			@RequestParam(value = "sitter_type") String sitter_type,
			@RequestParam(value = "want_act1") String want_act1,
			@RequestParam(value = "want_act2", required = false) String want_act2,
			@RequestParam(value = "want_act3", required = false) String want_act3, 
			@RequestParam(value = "want_age") String want_age,
			@RequestParam(value = "si") String si,
			@RequestParam(value = "gu") String gu, 
			@RequestParam(value = "dong") String dong,
			@RequestParam(value = "schedule") String schedule, 
			@RequestParam(value = "payment") String paymentstr, 
			@RequestParam(value = "cctv") char cctv,
			@RequestParam(value = "introduce", required = false) String introduce
			) {

		paymentstr = paymentstr.replace(",", "");
		int payment = Integer.parseInt(paymentstr);
		
		// 저장할 값 beans에 담기
		sitterinfo.setType(type);
		sitterinfo.setSitter_type(sitter_type);
		sitterinfo.setWant_act1(want_act1);
		sitterinfo.setWant_act2(want_act2);
		sitterinfo.setWant_act3(want_act3);
		sitterinfo.setWant_age(want_age);
		sitterinfo.setSi(si);
		sitterinfo.setGu(gu);
		sitterinfo.setDong(dong);
		sitterinfo.setSchedule(schedule);
		sitterinfo.setPayment(payment);
		sitterinfo.setCctv(cctv);
		sitterinfo.setIntroduce(introduce);

		// 저장된 결과 조회하기 위한 객체
		// Mom_info output = null;

		log.debug(sitterinfo.toString());

		model.addAttribute("type", type);
		model.addAttribute("sitter_type", sitter_type);
		model.addAttribute("want_act1", want_act1);
		model.addAttribute("want_act2", want_act2);
		model.addAttribute("want_act3", want_act3);
		model.addAttribute("want_age", want_age);
		model.addAttribute("si", si);
		model.addAttribute("gu", gu);
		model.addAttribute("dong", dong);
		model.addAttribute("schedule", schedule);
		model.addAttribute("payment", payment);
		model.addAttribute("cctv", cctv);
		model.addAttribute("introduce", introduce);
		

		return new ModelAndView("/join/sitter/agreement");
		// return webHelper.getJsonData(map);
		// return "/join/parent/children";
	}
	
	@RequestMapping(value = "/join/sitter/account.do", method = RequestMethod.POST)
	public ModelAndView s_join_account(Model model, 
			@RequestParam(value = "type") char type,
			@RequestParam(value = "sitter_type") String sitter_type,
			@RequestParam(value = "want_act1") String want_act1,
			@RequestParam(value = "want_act2", required = false) String want_act2,
			@RequestParam(value = "want_act3", required = false) String want_act3, 
			@RequestParam(value = "want_age") String want_age,
			@RequestParam(value = "si") String si,
			@RequestParam(value = "gu") String gu, 
			@RequestParam(value = "dong") String dong,
			@RequestParam(value = "schedule") String schedule, 
			@RequestParam(value = "payment") String paymentstr, 
			@RequestParam(value = "cctv") char cctv,
			@RequestParam(value = "introduce", required = false) String introduce
			) {

		paymentstr = paymentstr.replace(",", "");
		int payment = Integer.parseInt(paymentstr);
		
		// 저장할 값 beans에 담기
		sitterinfo.setType(type);
		sitterinfo.setSitter_type(sitter_type);
		sitterinfo.setWant_act1(want_act1);
		sitterinfo.setWant_act2(want_act2);
		sitterinfo.setWant_act3(want_act3);
		sitterinfo.setWant_age(want_age);
		sitterinfo.setSi(si);
		sitterinfo.setGu(gu);
		sitterinfo.setDong(dong);
		sitterinfo.setSchedule(schedule);
		sitterinfo.setPayment(payment);
		sitterinfo.setCctv(cctv);
		sitterinfo.setIntroduce(introduce);

		// 저장된 결과 조회하기 위한 객체
		// Mom_info output = null;

		log.debug(sitterinfo.toString());

		model.addAttribute("type", type);
		model.addAttribute("sitter_type", sitter_type);
		model.addAttribute("want_act1", want_act1);
		model.addAttribute("want_act2", want_act2);
		model.addAttribute("want_act3", want_act3);
		model.addAttribute("want_age", want_age);
		model.addAttribute("si", si);
		model.addAttribute("gu", gu);
		model.addAttribute("dong", dong);
		model.addAttribute("schedule", schedule);
		model.addAttribute("payment", payment);
		model.addAttribute("cctv", cctv);
		model.addAttribute("introduce", introduce);
		

		return new ModelAndView("/join/sitter/account");
		// return webHelper.getJsonData(map);
		// return "/join/parent/children";
	}
	
	@RequestMapping(value = "/join/sitter/success.do", method = RequestMethod.GET)
	public String join_success(Model model, HttpServletResponse response) {

		return "/join/sitter/success";
	}
}
