package study.team.abuhae.controllers;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.team.abuhae.helper.RegexHelper;
import study.team.abuhae.helper.WebHelper;
import study.team.abuhae.model.ProfileFile;
import study.team.abuhae.model.Sitter_info;
import study.team.abuhae.service.SitterMypageService;
import study.team.abuhae.service.UploadService;

/** 시터회원 프로필 수정 컨트롤러 */
@Controller
public class UpdateProfileController {
	@Autowired
	WebHelper webHelper;
	@Autowired
	RegexHelper regexHelper;
	@Autowired
	SitterMypageService sitterMypageService;
	@Autowired
	UploadService uploadService;
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/** 프로필 수정 페이지 */
	/** 업로드 폼을 구성하는 페이지 */
	@RequestMapping(value = "/mypage/mypage_sitter/update_sitter_profile.do", method = RequestMethod.GET)
	public ModelAndView upload(Model model,
			@RequestParam(value = "sitterno", defaultValue = "0") int sitterno) {
		
		ProfileFile input = new ProfileFile();
		input.setSitterno(sitterno);
		//input.setMemberno(memberno);
		Sitter_info input2 = new Sitter_info();
		input2.setSitterno(sitterno);
		
		ProfileFile output = null;
		Sitter_info output2 = null;
		
		try {
			output = uploadService.getProfileItem(input);
			output2 = sitterMypageService.getSitterItem(input2);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output", output);
		model.addAttribute("sitterinfo", output2);
		
		return new ModelAndView("/mypage/mypage_sitter/update_sitter_profile");
	}

	/** 선호하는 돌봄 유형 */
	@RequestMapping(value = "/mypage_update/favoriteCare.do", method = RequestMethod.POST)
	public ModelAndView choice_care(Model model,
			@RequestParam(value = "sitterno", defaultValue = "0") int sitterno,
			@RequestParam(value = "favorite_act", defaultValue = "") String favorite_act) {
		/** 1) 파라미터 유효성 검사 */
		if (sitterno==0) {
			return webHelper.redirect(null, "회원번호가 없습니다");
		}
		if(!regexHelper.isValue(favorite_act)) {
			return webHelper.redirect(null, "변경할 선호하는 활동을 선택해 주세요.");
		}

		/** 2) 데이터 조회하기 */
		Sitter_info input = new Sitter_info();
		input.setSitterno(sitterno);
		input.setFavorite_act(favorite_act);

		try {

			sitterMypageService.updateFavoriteact(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		String url = contextPath + "/mypage/mypage_sitter/update_sitter_profile.do?sitterno=" + sitterno;
		return webHelper.redirect(url, "신청서 수정이 완료되었습니다!");
	}
	
	
	/** 돌봄 가능 연령 페이지 */
	@RequestMapping(value = "/mypage_update/sitter_wantage.do", method = RequestMethod.POST)
	public ModelAndView update_want_age(Model model,
			@RequestParam(value = "sitterno", defaultValue = "0") int sitterno,
			@RequestParam(value = "want_age", defaultValue = "") String want_age) {
		/** 1) 파라미터 유효성 검사 */
		if (sitterno==0) {
			return webHelper.redirect(null, "회원번호가 없습니다");
		}
		if(!regexHelper.isValue(want_age)) {
			return webHelper.redirect(null, "변경할 연령대를 선택해 주세요.");
		}

		/** 2) 데이터 조회하기 */
		Sitter_info input = new Sitter_info();
		input.setSitterno(sitterno);
		input.setWant_age(want_age);

		try {

			sitterMypageService.updateWantage(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		String url = contextPath + "/mypage/mypage_sitter/update_sitter_profile.do?sitterno=" + sitterno;
		return webHelper.redirect(url, "신청서 수정이 완료되었습니다!");
	}

	/** 가능한 활동 페이지 */
	@RequestMapping(value = "/mypage_update/sitter_wantact.do", method = RequestMethod.POST)
	public ModelAndView update_activity_sitter(Model model,
			@RequestParam(value = "sitterno", defaultValue = "0") int sitterno,
			@RequestParam(value = "want_act1", defaultValue = "") String want_act1,
			@RequestParam(value = "want_act2", required = false) String want_act2,
			@RequestParam(value = "want_act3", required = false) String want_act3) {

		/** 1) 파라미터 유효성 검사 */
		if (sitterno==0) {
			return webHelper.redirect(null, "회원번호가 없습니다");
		}
		if(!regexHelper.isValue(want_act1)) {
			return webHelper.redirect(null, "변경할 활동을 선택해 주세요.");
		}
		

		/** 2) 데이터 조회하기 */
		Sitter_info input = new Sitter_info();
		input.setSitterno(sitterno);
		input.setWant_act1(want_act1);
		input.setWant_act2(want_act2);
		input.setWant_act3(want_act3);

		try {

			sitterMypageService.updateWantact(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		String url = contextPath + "/mypage/mypage_sitter/update_sitter_profile.do?sitterno=" + sitterno;
		return webHelper.redirect(url, "신청서 수정이 완료되었습니다!");
	}
	
	
	/** 활동 가능 시간 페이지 */
	@RequestMapping(value = "/mypage_update/sitter_schedule.do", method = RequestMethod.POST)
	public ModelAndView update_shcedule(Model model,
			@RequestParam(value = "sitterno", defaultValue = "0") int sitterno,
			@RequestParam(value = "schedule", defaultValue = "") String schedulestr) {
		/** 1) 파라미터 유효성 검사 */
		if (sitterno==0) {
			return webHelper.redirect(null, "회원번호가 없습니다");
		}
		if (!regexHelper.isValue(schedulestr)) {
			return webHelper.redirect(null, "변경할 활동 가능한 시간을 입력해 주세요.");
		}
		
		String schedule = schedulestr.replace("'", "\"");

		/** 2) 데이터 조회하기 */
		Sitter_info input = new Sitter_info();
		input.setSitterno(sitterno);
		input.setSchedule(schedule);

		try {
			sitterMypageService.updateSchedule(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		String url = contextPath + "/mypage/mypage_sitter/update_sitter_profile.do?sitterno=" + sitterno;
		return webHelper.redirect(url, "신청서 수정이 완료되었습니다!");
	}
	
	
	/** 희망 시급 페이지 */
	@RequestMapping(value = "/mypage_update/payment.do", method = RequestMethod.POST)
	public ModelAndView update_wage( Model model,
			@RequestParam(value = "sitterno", defaultValue = "0") int sitterno,
			@RequestParam(value = "want_wage", defaultValue = "") String paymentstr) {
		/** 1) 파라미터 유효성 검사 */
		if (sitterno==0) {
			return webHelper.redirect(null, "회원번호가 없습니다");
		}
		if (!regexHelper.isValue(paymentstr)) {
			return webHelper.redirect(null, "시급을 입력해 주세요.");
		}
		
		paymentstr = paymentstr.replace(",", "");
		int payment = Integer.parseInt(paymentstr);

		/** 2) 데이터 조회하기 */
		Sitter_info input = new Sitter_info();
		input.setSitterno(sitterno);
		input.setPayment(payment);

		try {
			sitterMypageService.updatePayment(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		String url = contextPath + "/mypage/mypage_sitter/update_sitter_profile.do?sitterno=" + sitterno;
		return webHelper.redirect(url, "신청서 수정이 완료되었습니다!");
	}

	
	/** 자기소개 페이지 */
	@RequestMapping(value = "/mypage_update/introduce.do", method = RequestMethod.POST)
	public ModelAndView update_introduce(Model model,
			@RequestParam(value = "sitterno", defaultValue = "0") int sitterno,
			@RequestParam(value = "introduce", defaultValue = "") String introduce) {
		/** 1) 파라미터 유효성 검사 */
		if (sitterno==0) {
			return webHelper.redirect(null, "회원번호가 없습니다");
		}
		if (!regexHelper.isValue(introduce)) {
			return webHelper.redirect(null, "변경할 자기소개서를 입력해 주세요.");
		}
	
		/** 2) 데이터 조회하기 */
		Sitter_info input = new Sitter_info();
		input.setSitterno(sitterno);
		input.setIntroduce(introduce);

		try {
			sitterMypageService.updateIntoroduce(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		String url = contextPath + "/mypage/mypage_sitter/update_sitter_profile.do?sitterno=" + sitterno;
		return webHelper.redirect(url, "신청서 수정이 완료되었습니다!");
	}
	
	/** 활동 지역 페이지 */
	@RequestMapping(value = "/mypage_update/sitter_location.do", method = RequestMethod.POST)
	public ModelAndView update_location_sitter(Model model,
			@RequestParam(value = "sitterno", defaultValue = "0") int sitterno,
			@RequestParam(value = "si", defaultValue = "") String si,
			@RequestParam(value = "gu", defaultValue = "") String gu,
			@RequestParam(value = "dong", defaultValue = "") String dong) {
		/** 1) 파라미터 유효성 검사 */
		if (sitterno==0) {
			return webHelper.redirect(null, "회원번호가 없습니다");
		}
		if (!regexHelper.isValue(si)) {
			return webHelper.redirect(null, "변경할 지역을 선택해 주세요.");
		}
		if (!regexHelper.isValue(gu)) {
			return webHelper.redirect(null, "변경할 지역을 선택해 주세요.");
		}
		if (!regexHelper.isValue(dong)) {
			return webHelper.redirect(null, "변경할 지역을 선택해 주세요.");
		}
	
		/** 2) 데이터 조회하기 */
		Sitter_info input = new Sitter_info();
		input.setSitterno(sitterno);
		input.setSi(si);
		input.setGu(gu);
		input.setDong(dong);

		try {
			sitterMypageService.updateLocation(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		String url = contextPath + "/mypage/mypage_sitter/update_sitter_profile.do?sitterno=" + sitterno;
		return webHelper.redirect(url, "신청서 수정이 완료되었습니다!");
	}
}
