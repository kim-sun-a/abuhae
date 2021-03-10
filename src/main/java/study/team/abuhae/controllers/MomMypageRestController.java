package study.team.abuhae.controllers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import study.team.abuhae.helper.RegexHelper;
import study.team.abuhae.helper.WebHelper;
import study.team.abuhae.model.Mom_info;
import study.team.abuhae.model.Review;
import study.team.abuhae.service.AdminService;
import study.team.abuhae.service.MomMypageService;

@RestController
public class MomMypageRestController {
	@Autowired
	WebHelper webHelper;
	@Autowired
	RegexHelper regexHelper;
	@Autowired
	AdminService adminService;
	@Autowired
	MomMypageService momMypageService;
	
	/** 리뷰 수정 기능 ~~~~ view에서는 리뷰 입력 기능처럼 보임 */
	@RequestMapping(value = "/mypage/edit_review_ok", method = RequestMethod.POST)
	public Map<String, Object> edit_ok(
			@RequestParam(value = "revno", defaultValue = "0") int revno,
			@RequestParam(value = "rev_rate", defaultValue = "") char rev_rate,
			@RequestParam(value = "contents") String contents) {
		/** accept 수정(connect table) - insert */
		Review input = new Review();
		input.setRevno(revno);
		input.setRev_rate(rev_rate);
		input.setContents(contents);
		
		/** 사용자가 입력한 파라미터 유효성 검사 */
		String review = input.getContents(); 
		if(!regexHelper.isValue(review)) {
			return webHelper.getJsonWarning("content");
		}
		
		try {
			// 데이터 수정
			momMypageService.editReview(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		return webHelper.getJsonData();
	}
	
	/** 맘 신청서 수정 */
	@RequestMapping(value = "/mypage/edit_application_ok", method = RequestMethod.POST)
	public Map<String, Object> edit_application_ok(
			@RequestParam(value = "momno") int momno,
			@RequestParam(value = "want_act1") String want_act1,
			@RequestParam(value = "want_act2", required = false) String want_act2,
			@RequestParam(value = "want_act3", required = false) String want_act3, 
			@RequestParam(value = "want_age") String want_age,
			@RequestParam(value = "kids_num") int kids_num,
			@RequestParam(value = "kids_age") String kids_age,
			@RequestParam(value = "kids_age2", required = false) String kids_age2,
			@RequestParam(value = "payment") String paymentstr, 
			@RequestParam(value = "payment_ok") char payment_ok,
			@RequestParam(value = "si") String si, 
			@RequestParam(value = "gu") String gu,
			@RequestParam(value = "dong") String dong, 
			@RequestParam(value = "schedule") String schedulestr,
			@RequestParam(value = "schedule_ok") char schedule_ok,
			@RequestParam(value = "description", required = false) String description,
			@RequestParam(value = "sitter_gender", required = false) char sitter_gender,
			@RequestParam(value = "interview_type", required = false) String interview_type,
			@RequestParam(value = "care_type") String care_type,
			@RequestParam(value = "apply_title") String apply_title,
			@RequestParam(value = "apply_content") String apply_content
			) {
		// 데이터 가공
		paymentstr = paymentstr.replace(",", "");
		int payment = Integer.parseInt(paymentstr);
		String schedule = schedulestr.replace("'", "\"");
		
		Mom_info input = new Mom_info();
		
		input.setMomno(momno);
		input.setWant_act1(want_act1);
		input.setWant_act2(want_act2);
		input.setWant_act3(want_act3);
		input.setWant_age(want_age);
		input.setKids_num(kids_num);
		input.setKids_age(kids_age);
		input.setKids_age2(kids_age2);
		input.setPayment(payment);
		input.setPayment_ok(payment_ok);
		input.setSi(si);
		input.setGu(gu);
		input.setDong(dong);
		input.setSchedule(schedule);
		input.setSchedule_ok(schedule_ok);
		input.setDescription(description);
		input.setSitter_gender(sitter_gender);
		input.setInterview_type(interview_type);
		input.setCare_type(care_type);
		input.setApply_title(apply_title);
		input.setApply_content(apply_content);
		
		
		
		try {
			// 데이터 수정
			momMypageService.editMomInfo(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		return webHelper.getJsonData();
	}
	
	@RequestMapping(value = "mypage/update_mjob_opening", method = RequestMethod.POST)
	public Map<String, Object> upd_sjob(
			@RequestParam(value = "memberno", defaultValue = "0") int memberno,
			@RequestParam(value = "job_opening", defaultValue = "") char job_opening) {
		Mom_info input = new Mom_info();
		input.setMemberno(memberno);
		input.setJob_opening(job_opening);
		
		try {
			//jobopeing 수정
			momMypageService.editMomJobOpening(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		return webHelper.getJsonData();
	}
	
	@RequestMapping(value = "mypage/update_mopening_date", method = RequestMethod.POST)
	public Map<String, Object> upd_sjobdate(
			@RequestParam(value = "momno", defaultValue = "0") int momno ) {
		Mom_info input = new Mom_info();
		input.setMomno(momno);
		
		try {
			//jobopeing 수정
			momMypageService.editMomOpeningDate(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		return webHelper.getJsonData();
	}
}
