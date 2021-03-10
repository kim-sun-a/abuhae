package study.team.abuhae.controllers;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.servlet.ModelAndView;

import study.team.abuhae.helper.AgeHelper;
import study.team.abuhae.helper.RegexHelper;
import study.team.abuhae.helper.WebHelper;
import study.team.abuhae.model.Mom_info;
import study.team.abuhae.model.ProfileFile;
import study.team.abuhae.service.MomMypageService;
import study.team.abuhae.service.UploadService;

/** 맘회원 신청서 수정 컨트롤러 */
@Controller
public class UpdateApplController {
	@Autowired
	WebHelper webHelper;
	@Autowired
	RegexHelper regexHelper;
	@Autowired
	MomMypageService momMypageService;
	@Autowired
	UploadService uploadService;
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** 내 신청서 정보 페이지 */
	@RequestMapping(value = "/mypage/mypage_mom/update_profile.do", method = RequestMethod.GET)
	public ModelAndView update_profile_cont(Model model,
			@RequestParam(value = "momno", defaultValue = "0") int momno) {
		if (momno == 0) {
			return webHelper.redirect(null, "존재하지 않는 회원번호입니다.");
		}
		
		ProfileFile input = new ProfileFile();
		input.setMomno(momno);
		Mom_info input2 = new Mom_info();
		input2.setMomno(momno);
		
		ProfileFile profile = null;
		Mom_info output = null;
		
		int kids_age2=0;
		
		try {
			profile = uploadService.getMomProfileItem(input);
			output = momMypageService.getMemberItem(input2);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		AgeHelper agehelper = new AgeHelper();
		int kids_age1 = agehelper.kidsAge(output.getKids_age());
		String kids_age2_str = output.getKids_age2();
		if (regexHelper.isValue(kids_age2_str)) {
			kids_age2 = agehelper.kidsAge(kids_age2_str);
		} 

		model.addAttribute("profile", profile);
		model.addAttribute("mominfo", output);
		model.addAttribute("kids_age", kids_age1);
		model.addAttribute("kids_age2", kids_age2);

		return new ModelAndView("mypage/mypage_mom/update_mom/update_profile_cont");
	}

	/* 프로필 제목 수정 컨트롤러 */
	@RequestMapping(value = "/mypage_update/applytitle.do", method = RequestMethod.POST)
	public ModelAndView update_applytitle(Model model, HttpSession session, 
			@RequestParam(value = "momno") int momno,
			@RequestParam(value = "mappl_title", defaultValue = "") String appl_title) {

		/** 1) 파라미터 유효성 검사 */
		if (appl_title == "" || appl_title == null) {
			return webHelper.redirect(null, "제목을 입력해 주세요.");
		}

		/** 2) 데이터 조회하기 */
		Mom_info input = new Mom_info();
		input.setMomno(momno);
		input.setApply_title(appl_title);

		try {

			momMypageService.updateApplytitle(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		String url = contextPath + "/mypage/mypage_mom/update_profile.do?momno=" + momno;
		return webHelper.redirect(url, "신청서 수정에 성공하였습니다!");
	}
	
	/* 프로필 상세 설명 수정 컨트롤러 */
	@RequestMapping(value = "/mypage_update/desc.do", method = RequestMethod.POST)
	public ModelAndView update_desc(Model model, HttpSession session, 
			@RequestParam(value = "momno") int momno,
			@RequestParam(value = "mappl_cont", defaultValue = "") String description) {

		/** 1) 파라미터 유효성 검사 */
		if (!regexHelper.isValue(description)) {
			return webHelper.redirect(null, "변경할 내용을 입력해 주세요.");
		}

		/** 2) 데이터 조회하기 */
		Mom_info input = new Mom_info();
		input.setMomno(momno);
		input.setDescription(description);

		try {

			momMypageService.updateDesc(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		String url = contextPath + "/mypage/mypage_mom/update_profile.do?momno=" + momno;
		return webHelper.redirect(url, "신청서 수정에 성공하였습니다!");
	}

	/** 춴하는 시터 나이대 페이지 */
	@RequestMapping(value = "/mypage_update/wantage.do", method = RequestMethod.POST)
	public ModelAndView update_want_age(Locale locale, Model model,
			@RequestParam(value = "momno") int momno,
			@RequestParam(value = "want_age", defaultValue = "") String want_age) {
		/** 1) 파라미터 유효성 검사 */
		if (!regexHelper.isValue(want_age)) {
			return webHelper.redirect(null, "변경할 나이대를 체크해 주세요.");
		}

		/** 2) 데이터 조회하기 */
		Mom_info input = new Mom_info();
		input.setMomno(momno);
		input.setWant_age(want_age);

		try {

			momMypageService.updateWantage(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		String url = contextPath + "/mypage/mypage_mom/update_profile.do?momno=" + momno;
		return webHelper.redirect(url, "신청서 수정에 성공하였습니다!");
	}

	/** 돌봄 지역 페이지 */
	@RequestMapping(value = "/mypage_update/location.do", method = RequestMethod.POST)
	public ModelAndView update_location(Locale locale, Model model,
			@RequestParam(value = "momno") int momno,
			@RequestParam(value = "si", defaultValue = "") String si,
			@RequestParam(value = "gu", defaultValue = "") String gu,
			@RequestParam(value = "dong", defaultValue = "") String dong) {
		/** 1) 파라미터 유효성 검사 */
		if (!regexHelper.isValue(si)) {
			return webHelper.redirect(null, "변경할 시를 선택해 주세요.");
		}
		if (!regexHelper.isValue(gu)) {
			return webHelper.redirect(null, "변경할 구를 선택해 주세요.");
		}
		if (!regexHelper.isValue(dong)) {
			return webHelper.redirect(null, "변경할 동을 선택해 주세요.");
		}

		/** 2) 데이터 조회하기 */
		Mom_info input = new Mom_info();
		input.setMomno(momno);
		input.setSi(si);
		input.setGu(gu);
		input.setDong(dong);

		try {

			momMypageService.updateLocation(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		String url = contextPath + "/mypage/mypage_mom/update_profile.do?momno=" + momno;
		return webHelper.redirect(url, "신청서 수정에 성공하였습니다!");
	}

	/** 돌봄 가능 시간 페이지 */
	@RequestMapping(value = "/mypage_update/schedule.do", method = RequestMethod.POST)
	public ModelAndView update_care_time(Model model,
			@RequestParam(value = "momno") int momno,
			@RequestParam(value = "schedule", defaultValue = "") String schedulestr,
			@RequestParam(value = "schedule_ok", defaultValue = "") char schedule_ok) {

		/** 1) 파라미터 유효성 검사 */
		if (momno==0) {
			return webHelper.redirect(null, "존재하지 않는 회원번호입니다.");
		}
		if (!regexHelper.isValue(schedulestr)) {
			return webHelper.redirect(null, "변경할 스케쥴을 선택해 주세요.");
		}
		
		String schedule = schedulestr.replace("'", "\"");

		/** 2) 데이터 조회하기 */
		Mom_info input = new Mom_info();
		input.setMomno(momno);
		input.setSchedule(schedule);
		input.setSchedule_ok(schedule_ok);

		try {

			momMypageService.updateSchedule(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		String url = contextPath + "/mypage/mypage_mom/update_profile.do?momno=" + momno;
		return webHelper.redirect(url, "신청서 수정에 성공하였습니다!");
	}

	/** 아이 정보 페이지 */
	@RequestMapping(value = "/mypage_update/kidspay.do", method = RequestMethod.POST)
	public ModelAndView update_child_info(Model model,
			@RequestParam(value = "momno") int momno,
			@RequestParam(value = "kids_num", defaultValue = "0") int kids_num,
			@RequestParam(value = "kids_age", defaultValue = "") String kids_age,
			@RequestParam(value = "kids_age2", required = false, defaultValue = "") String kids_age2,
			@RequestParam(value = "payment", defaultValue = "") String paymentstr,
			@RequestParam(value = "payment_ok", defaultValue = "") char payment_ok) {
		/** 1) 파라미터 유효성 검사 */
		if (momno==0) {
			return webHelper.redirect(null, "존재하지 않는 회원번호입니다.");
		}
		if (kids_num==0) {
			return webHelper.redirect(null, "아이 수를 선택해 주세요.");
		}
		if (!regexHelper.isValue(kids_age)) {
			return webHelper.redirect(null, "아이의 나이를 선택해 주세요.");
		}
		if (!regexHelper.isValue(paymentstr)) {
			return webHelper.redirect(null, "희망 시급을 입력해 주세요.");
		}
		
		paymentstr = paymentstr.replace(",", "");
		int payment = Integer.parseInt(paymentstr);

		/** 2) 데이터 조회하기 */
		Mom_info input = new Mom_info();
		input.setMomno(momno);
		input.setKids_num(kids_num);
		input.setKids_age(kids_age);
		input.setKids_age2(kids_age2);
		input.setPayment(payment);
		input.setPayment_ok(payment_ok);

		try {

			momMypageService.updateKidspay(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		String url = contextPath + "/mypage/mypage_mom/update_profile.do?momno=" + momno;
		return webHelper.redirect(url, "신청서 수정에 성공하였습니다!");
	}

	/** 원하는 활동 페이지 */
	@RequestMapping(value = "/mypage_update/wantact.do", method = RequestMethod.POST)
	public ModelAndView update_activity(Model model,
			@RequestParam(value = "momno") int momno,
			@RequestParam(value = "want_act1", defaultValue = "") String want_act1,
			@RequestParam(value = "want_act2", required = false) String want_act2,
			@RequestParam(value = "want_act3", required = false) String want_act3) {
		/** 1) 파라미터 유효성 검사 */
		if (momno==0) {
			return webHelper.redirect(null, "존재하지 않는 회원번호입니다.");
		}
		if (!regexHelper.isValue(want_act1)) {
			return webHelper.redirect(null, "변경할 활동을 선택해 주세요.");
		}

		/** 2) 데이터 조회하기 */
		Mom_info input = new Mom_info();
		input.setMomno(momno);
		input.setWant_act1(want_act1);
		input.setWant_act2(want_act2);
		input.setWant_act3(want_act3);


		try {

			momMypageService.updateWantact(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		String url = contextPath + "/mypage/mypage_mom/update_profile.do?momno=" + momno;
		return webHelper.redirect(url, "신청서 수정에 성공하였습니다!");
	}

	/** 그 외 요청사항 페이지 */
	@RequestMapping(value = "/mypage_update/etc.do", method = RequestMethod.POST)
	public ModelAndView update_request(Model model,
			@RequestParam(value = "momno", defaultValue = "0") int momno,
			@RequestParam(value = "type_interview", required = false) String interview_type,
			@RequestParam(value = "s_gender",required = false, defaultValue = "0") char sitter_gender,
			@RequestParam(value = "care_type", required = false) String care_type) {

		/** 1) 파라미터 유효성 검사 */
		if (momno==0) {
			return webHelper.redirect(null, "존재하지 않는 회원번호입니다.");
		}



		/** 2) 데이터 조회하기 */
		Mom_info input = new Mom_info();
		input.setMomno(momno);
		input.setInterview_type(interview_type);
		input.setSitter_gender(sitter_gender);
		input.setCare_type(care_type);


		try {

			momMypageService.updateEtc(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		String url = contextPath + "/mypage/mypage_mom/update_profile.do?momno=" + momno;
		return webHelper.redirect(url, "신청서 수정에 성공하였습니다!");
	}
}
