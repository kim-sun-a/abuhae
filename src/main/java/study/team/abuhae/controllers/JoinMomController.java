package study.team.abuhae.controllers;
import java.net.http.HttpRequest;

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
import study.team.abuhae.model.Mom_info;
import study.team.abuhae.service.MemberService;

@Slf4j
@Controller
public class JoinMomController {
	// service 객체 패턴 구현체 주입
	@Autowired
	MemberService memberService;
	
	//webhelper 주입
	@Autowired
	WebHelper webhelper;

	Mom_info mominfo = new Mom_info();

	// 프로젝트 이름의 ContextPath 주입
	@Value("#{servletContext.contextPath}")
	String contextPath;

	@RequestMapping(value = "/join/join.do", method = RequestMethod.GET)
	public String join_start(Model model, HttpServletResponse response) {

		return "/join/join";
	}

	@RequestMapping(value = "/join/parent/start.do", method = RequestMethod.GET)
	public String m_join_start(Model model, HttpServletResponse response, 
			@RequestParam(value = "type") char type) {
		// 파라미터 저장
		mominfo.setType(type);
		log.debug("선택한 타입 >> " + mominfo.getType());

		return "/join/parent/start";
	}

	@RequestMapping(value = "/join/parent/activity_age.do", method = RequestMethod.GET)
	public String m_join_acage(Model model, HttpServletResponse response) {

		return "/join/parent/activity_age";
	}

	@RequestMapping(value = "/join/parent/children.do", method = RequestMethod.POST)
	public ModelAndView m_join_child(Model model, 
			@RequestParam(value = "type") char type,
			@RequestParam(value = "want_act1") String want_act1,
			@RequestParam(value = "want_act2", required = false) String want_act2,
			@RequestParam(value = "want_act3", required = false) String want_act3, 
			@RequestParam(value = "want_age") String want_age) {

		// 저장할 값 beans에 담기
		mominfo.setType(type);
		mominfo.setWant_act1(want_act1);
		mominfo.setWant_act2(want_act2);
		mominfo.setWant_act3(want_act3);
		mominfo.setWant_age(want_age);

		// 저장된 결과 조회하기 위한 객체
		// Mom_info output = null;

		log.debug(mominfo.toString());

		model.addAttribute("type", type);
		model.addAttribute("want_act1", want_act1);
		model.addAttribute("want_act2", want_act2);
		model.addAttribute("want_act3", want_act3);
		model.addAttribute("want_age", want_age);

		return new ModelAndView("/join/parent/children");
		// return webHelper.getJsonData(map);
		// return "/join/parent/children";
	}

	@RequestMapping(value = "/join/parent/select_one.do", method = RequestMethod.GET)
	public String m_join_selectOne(Model model, HttpServletResponse response) {

		return "/join/parent/select_one";
	}

	@RequestMapping(value = "/join/parent/select_two.do", method = RequestMethod.GET)
	public String m_join_selectTwo(Model model, HttpServletResponse response) {

		return "/join/parent/select_two";
	}

	@RequestMapping(value = "/join/parent/location.do", method = RequestMethod.POST)
	public ModelAndView m_join_loc(Model model, 
			@RequestParam(value = "type") char type,
			@RequestParam(value = "want_act1") String want_act1,
			@RequestParam(value = "want_act2", required = false) String want_act2,
			@RequestParam(value = "want_act3", required = false) String want_act3, 
			@RequestParam(value = "want_age") String want_age,
			@RequestParam(value = "kids_num") int kids_num, 
			@RequestParam(value = "kids_age") String kids_age,
			@RequestParam(value = "kids_age2") String kids_age2,
			@RequestParam(value = "payment") String paymentstr,
			@RequestParam(value = "payment_ok") char payment_ok
			) {

		paymentstr = paymentstr.replace(",", "");
		int payment = Integer.parseInt(paymentstr);

		// 저장할 값 beans에 담기
		mominfo.setType(type);
		mominfo.setWant_act1(want_act1);
		mominfo.setWant_act2(want_act2);
		mominfo.setWant_act3(want_act3);
		mominfo.setWant_age(want_age);
		mominfo.setKids_num(kids_num);
		mominfo.setKids_age(kids_age);
		mominfo.setKids_age(kids_age2);
		mominfo.setPayment(payment);

		// 저장된 결과 조회하기 위한 객체
		// Mom_info output = null;

		log.debug(mominfo.toString());

		model.addAttribute("type", type);
		model.addAttribute("want_act1", want_act1);
		model.addAttribute("want_act2", want_act2);
		model.addAttribute("want_act3", want_act3);
		model.addAttribute("want_age", want_age);
		model.addAttribute("kids_num", kids_num);
		model.addAttribute("kids_age", kids_age);
		model.addAttribute("kids_age2", kids_age2);
		model.addAttribute("payment", payment);
		model.addAttribute("payment_ok", payment_ok);

		return new ModelAndView("/join/parent/location");
		// return webHelper.getJsonData(map);
		// return "/join/parent/children";
	}

	@RequestMapping(value = "/join/parent/schedule.do", method = RequestMethod.POST)
	public ModelAndView m_join_shce(Model model, 
			@RequestParam(value = "type") char type,
			@RequestParam(value = "want_act1") String want_act1,
			@RequestParam(value = "want_act2", required = false) String want_act2,
			@RequestParam(value = "want_act3", required = false) String want_act3, 
			@RequestParam(value = "want_age") String want_age,
			@RequestParam(value = "kids_num") int kids_num, 
			@RequestParam(value = "kids_age") String kids_age,
			@RequestParam(value = "kids_age2") String kids_age2,
			@RequestParam(value = "payment") String paymentstr, 
			@RequestParam(value = "payment_ok") char payment_ok,
			@RequestParam(value = "si") String si,
			@RequestParam(value = "gu") String gu, 
			@RequestParam(value = "dong") String dong) {

		paymentstr = paymentstr.replace(",", "");
		int payment = Integer.parseInt(paymentstr);

		// 저장할 값 beans에 담기
		mominfo.setType(type);
		mominfo.setWant_act1(want_act1);
		mominfo.setWant_act2(want_act2);
		mominfo.setWant_act3(want_act3);
		mominfo.setWant_age(want_age);
		mominfo.setKids_num(kids_num);
		mominfo.setKids_age(kids_age);
		mominfo.setKids_age(kids_age2);
		mominfo.setPayment(payment);
		mominfo.setPayment_ok(payment_ok);
		mominfo.setSi(si);
		mominfo.setGu(gu);
		mominfo.setDong(dong);

		// 저장된 결과 조회하기 위한 객체
		// Mom_info output = null;

		log.debug(mominfo.toString());

		model.addAttribute("type", type);
		model.addAttribute("want_act1", want_act1);
		model.addAttribute("want_act2", want_act2);
		model.addAttribute("want_act3", want_act3);
		model.addAttribute("want_age", want_age);
		model.addAttribute("kids_num", kids_num);
		model.addAttribute("kids_age", kids_age);
		model.addAttribute("kids_age2", kids_age2);
		model.addAttribute("payment", payment);
		model.addAttribute("payment_ok", payment_ok);
		model.addAttribute("si", si);
		model.addAttribute("gu", gu);
		model.addAttribute("dong", dong);

		return new ModelAndView("/join/parent/schedule");
		// return webHelper.getJsonData(map);
		// return "/join/parent/children";
	}
	
	@RequestMapping(value = "/join/parent/regular.do", method = RequestMethod.GET)
	public String m_join_regular(Model model, HttpServletResponse response ) {


		return "/join/parent/regular";
	}

	@RequestMapping(value = "/join/parent/shortTerm.do", method = RequestMethod.GET)
	public String m_join_shortTerm(Model model, HttpServletResponse response) {
		
		return "/join/parent/shortTerm";
	}

	@RequestMapping(value = "/join/parent/noplan.do", method = RequestMethod.GET)
	public String m_join_noplan(Model model, HttpServletResponse response) {
		
		return "/join/parent/noplan";
	}

	@RequestMapping(value = "/join/parent/description.do", method = RequestMethod.POST)
	public String m_join_desc(Model model, HttpServletResponse response, 
			@RequestParam(value = "type") char type,
			@RequestParam(value = "want_act1") String want_act1,
			@RequestParam(value = "want_act2", required = false) String want_act2,
			@RequestParam(value = "want_act3", required = false) String want_act3, 
			@RequestParam(value = "want_age") String want_age,
			@RequestParam(value = "kids_num") int kids_num, 
			@RequestParam(value = "kids_age") String kids_age,
			@RequestParam(value = "kids_age2") String kids_age2,
			@RequestParam(value = "payment") String paymentstr, 
			@RequestParam(value = "payment_ok") char payment_ok,
			@RequestParam(value = "si") String si,
			@RequestParam(value = "gu") String gu, 
			@RequestParam(value = "dong") String dong,
			@RequestParam(value = "schedule") String schedule, 
			@RequestParam(value = "schedule_ok") char schedule_ok) {

		paymentstr = paymentstr.replace(",", "");
		int payment = Integer.parseInt(paymentstr);

		// 저장할 값 beans에 담기
		mominfo.setType(type);
		mominfo.setWant_act1(want_act1);
		mominfo.setWant_act2(want_act2);
		mominfo.setWant_act3(want_act3);
		mominfo.setWant_age(want_age);
		mominfo.setKids_num(kids_num);
		mominfo.setKids_age(kids_age);
		mominfo.setKids_age(kids_age2);
		mominfo.setPayment(payment);
		mominfo.setPayment_ok(payment_ok);
		mominfo.setSi(si);
		mominfo.setGu(gu);
		mominfo.setDong(dong);
		mominfo.setSchedule(schedule);
		mominfo.setSchedule_ok(schedule_ok);

		// 저장된 결과 조회하기 위한 객체
		// Mom_info output = null;

		log.debug(mominfo.toString());


		model.addAttribute("type", type);
		model.addAttribute("want_act1", want_act1);
		model.addAttribute("want_act2", want_act2);
		model.addAttribute("want_act3", want_act3); 
		model.addAttribute("want_age", want_age);
		model.addAttribute("kids_num", kids_num);
		model.addAttribute("kids_age", kids_age);
		model.addAttribute("kids_age2", kids_age2);
		model.addAttribute("payment", payment);
		model.addAttribute("payment_ok", payment_ok);
		model.addAttribute("si", si);
		model.addAttribute("gu", gu);
		model.addAttribute("dong", dong);
		model.addAttribute("schedule", schedule);
		model.addAttribute("schedule_ok", schedule_ok);

		return "/join/parent/description";
	}
	
	@RequestMapping(value = "/join/parent/agreement.do", method = RequestMethod.POST)
	public String m_join_agree(Model model, 
			@RequestParam(value = "type") char type,
			@RequestParam(value = "want_act1") String want_act1,
			@RequestParam(value = "want_act2", required = false) String want_act2,
			@RequestParam(value = "want_act3", required = false) String want_act3, 
			@RequestParam(value = "want_age") String want_age,
			@RequestParam(value = "kids_num") int kids_num, 
			@RequestParam(value = "kids_age") String kids_age,
			@RequestParam(value = "kids_age2") String kids_age2,
			@RequestParam(value = "payment") String paymentstr, 
			@RequestParam(value = "payment_ok") char payment_ok,
			@RequestParam(value = "si") String si,
			@RequestParam(value = "gu") String gu, 
			@RequestParam(value = "dong") String dong,
			@RequestParam(value = "schedule") String schedule, 
			@RequestParam(value = "schedule_ok") char schedule_ok,
			@RequestParam(value = "description", required = false) String description) {
		paymentstr = paymentstr.replace(",", "");
		int payment = Integer.parseInt(paymentstr);

		// 저장할 값 beans에 담기
		mominfo.setType(type);
		mominfo.setWant_act1(want_act1);
		mominfo.setWant_act2(want_act2);
		mominfo.setWant_act3(want_act3);
		mominfo.setWant_age(want_age);
		mominfo.setKids_num(kids_num);
		mominfo.setKids_age(kids_age);
		mominfo.setKids_age(kids_age2);
		mominfo.setPayment(payment);
		mominfo.setPayment_ok(payment_ok);
		mominfo.setSi(si);
		mominfo.setGu(gu);
		mominfo.setDong(dong);
		mominfo.setSchedule(schedule);
		mominfo.setSchedule_ok(schedule_ok);
		mominfo.setDescription(description);

		// 저장된 결과 조회하기 위한 객체
		//Mom_info output = null;

		log.debug(mominfo.toString());


		model.addAttribute("type", type);
		model.addAttribute("want_act1", want_act1);
		model.addAttribute("want_act2", want_act2);
		model.addAttribute("want_act3", want_act3);
		model.addAttribute("want_age", want_age);
		model.addAttribute("kids_num", kids_num);
		model.addAttribute("kids_age", kids_age);
		model.addAttribute("kids_age2", kids_age2);
		model.addAttribute("payment", payment);
		model.addAttribute("payment_ok", payment_ok);
		model.addAttribute("si", si);
		model.addAttribute("gu", gu);
		model.addAttribute("dong", dong);
		model.addAttribute("schedule", schedule);
		model.addAttribute("schedule_ok", schedule_ok);
		model.addAttribute("descrip", description);

		return "/join/parent/agreement";
	}

	@RequestMapping(value = "/join/parent/account.do", method = RequestMethod.POST)
	public String m_join_acco(Model model, 
			@RequestParam(value = "type") char type,
			@RequestParam(value = "want_act1") String want_act1,
			@RequestParam(value = "want_act2", required = false) String want_act2,
			@RequestParam(value = "want_act3", required = false) String want_act3, 
			@RequestParam(value = "want_age") String want_age,
			@RequestParam(value = "kids_num") int kids_num, 
			@RequestParam(value = "kids_age") String kids_age,
			@RequestParam(value = "kids_age2") String kids_age2,
			@RequestParam(value = "payment") String paymentstr, 
			@RequestParam(value = "payment_ok") char payment_ok,
			@RequestParam(value = "si") String si,
			@RequestParam(value = "gu") String gu, 
			@RequestParam(value = "dong") String dong,
			@RequestParam(value = "schedule") String schedule, 
			@RequestParam(value = "schedule_ok") char schedule_ok,
			@RequestParam(value = "description", required = false) String description) {

		paymentstr = paymentstr.replace(",", "");
		int payment = Integer.parseInt(paymentstr);

		// 저장할 값 beans에 담기
		mominfo.setType(type);
		mominfo.setWant_act1(want_act1);
		mominfo.setWant_act2(want_act2);
		mominfo.setWant_act3(want_act3);
		mominfo.setWant_age(want_age);
		mominfo.setKids_num(kids_num);
		mominfo.setKids_age(kids_age);
		mominfo.setKids_age(kids_age2);
		mominfo.setPayment(payment);
		mominfo.setPayment_ok(payment_ok);
		mominfo.setSi(si);
		mominfo.setGu(gu);
		mominfo.setDong(dong);
		mominfo.setSchedule(schedule);
		mominfo.setSchedule_ok(schedule_ok);
		mominfo.setDescription(description);

		// 저장된 결과 조회하기 위한 객체
		// Mom_info output = null;

		log.debug(mominfo.toString());

		model.addAttribute("type", type);
		model.addAttribute("want_act1", want_act1);
		model.addAttribute("want_act2", want_act2);
		model.addAttribute("want_act3", want_act3);
		model.addAttribute("want_age", want_age);
		model.addAttribute("kids_num", kids_num);
		model.addAttribute("kids_age", kids_age);
		model.addAttribute("kids_age2", kids_age2);
		model.addAttribute("payment", payment);
		model.addAttribute("payment_ok", payment_ok);
		model.addAttribute("si", si);
		model.addAttribute("gu", gu);
		model.addAttribute("dong", dong);
		model.addAttribute("schedule", schedule);
		model.addAttribute("schedule_ok", schedule_ok);
		model.addAttribute("descrip", description);

		return "/join/parent/account";
	}

	@RequestMapping(value = "/join/parent/success.do", method = RequestMethod.GET)
	public String join_success(Model model, HttpServletResponse response) {

		return "/join/parent/success";
	}
}
