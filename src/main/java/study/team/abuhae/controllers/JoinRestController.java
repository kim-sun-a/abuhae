package study.team.abuhae.controllers;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import study.team.abuhae.helper.AgeHelper;
import study.team.abuhae.helper.RegexHelper;
import study.team.abuhae.helper.WebHelper;
import study.team.abuhae.model.Mom_info;
import study.team.abuhae.model.Sitter_info;
import study.team.abuhae.service.MemberService;

@RestController
public class JoinRestController {
	@Autowired
	WebHelper webhelper;
	@Autowired
	RegexHelper regexHelper;
	@Autowired
	MemberService memberService;
	Mom_info mominfo = new Mom_info();
	Sitter_info sitterinfo = new Sitter_info();

	// 맘 회원가입 최종 OK
	@RequestMapping(value = "join/parent/add_ok", method = RequestMethod.POST)
	public Map<String, Object> m_join_success(Model model, 
			@RequestParam(value = "type") char type,
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
			@RequestParam(value = "user_id") String user_id, 
			@RequestParam(value = "user_pw") String user_pw,
			@RequestParam(value = "name") String name,
			@RequestParam(value = "email") String email,
			@RequestParam(value = "tel") String tel, 
			@RequestParam(value = "birthdate") String birthdate,
			@RequestParam(value = "gender") char gender) {

		// 데이터 가공
		paymentstr = paymentstr.replace(",", "");
		int payment = Integer.parseInt(paymentstr);
		String schedule = schedulestr.replace("'", "\"");

		// 유효성 검사에 사용될 객체
		Mom_info check = new Mom_info();
		check.setId(user_id);
		check.setEmail(email);
		check.setPhone(tel);
		
		//입력한 나이로 아이 연령대 검사
		AgeHelper ageHelper = new AgeHelper();
		String nai = ageHelper.kidsEng(kids_age);
		String nai2 = "";
		//아이가 2명일 경우
		if(regexHelper.isValue(kids_age2)) {
			nai2 = ageHelper.kidsEng(kids_age2);
		}
		
		

		// 아이디 검사
		try {

			int result = memberService.idCheck(check);
			if (result == 1) {
				return webhelper.getJsonWarning("id");
			}
			mominfo.setId(user_id);
		} catch (Exception e) {
			return webhelper.getJsonError(e.getLocalizedMessage());
		}
		// 이메일 검사
		try {
			int result = memberService.emailCheck(check);
			if (result == 1) {
				return webhelper.getJsonWarning("email");
			}
			mominfo.setEmail(email);
		} catch (Exception e) {
			return webhelper.getJsonError(e.getLocalizedMessage());
		}
		// 핸드폰번호 검사
		try {
			int result = memberService.phoneCheck(check);
			if (result == 1) {
				return webhelper.getJsonWarning("phone");
			}
			mominfo.setPhone(tel);
		} catch (Exception e) {
			return webhelper.getJsonError(e.getLocalizedMessage());
		}

		// 저장할 값 beans에 담기
		mominfo.setType(type);
		mominfo.setWant_act1(want_act1);
		mominfo.setWant_act2(want_act2);
		mominfo.setWant_act3(want_act3);
		mominfo.setWant_age(want_age);
		mominfo.setKids_num(kids_num);
		mominfo.setKids_age(kids_age);
		mominfo.setKids_age2(kids_age2);
		mominfo.setKids_nai(nai);
		mominfo.setKids_nai2(nai2);
		mominfo.setPayment(payment);
		mominfo.setPayment_ok(payment_ok);
		mominfo.setSi(si);
		mominfo.setGu(gu);
		mominfo.setDong(dong);
		mominfo.setSchedule(schedule);
		mominfo.setSchedule_ok(schedule_ok);
		mominfo.setDescription(description);

		mominfo.setPassword(user_pw);
		mominfo.setName(name);
		mominfo.setBirthdate(birthdate);
		mominfo.setGender(gender);
		mominfo.setJob_opening('N');
		mominfo.setSubscribe('N');
		// mominfo.setSitter_gender('F');
		// mominfo.setInterview_type('1');
		// mominfo.setCare_type("주1회");
		// mominfo.setOpeningdate("2021-02-04");

		int memberno = mominfo.getMemberno();
		mominfo.setMemberno(memberno);

		// log.debug(mominfo.toString());

		try {
			// 데이터 저장 --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			memberService.addMom(mominfo);

		} catch (Exception e) {
			return webhelper.getJsonError(e.getLocalizedMessage());
		}
		return webhelper.getJsonData();
	}
	
	// 시터 회원가입 최종 OK
	@RequestMapping(value = "join/sitter/add_ok", method = RequestMethod.POST)
	public Map<String, Object> s_join_success(Model model, 
			@RequestParam(value = "type") char type,
			@RequestParam(value = "sitter_type") String sitter_type,
			@RequestParam(value = "want_act1") String want_act1,
			@RequestParam(value = "want_act2", required = false) String want_act2,
			@RequestParam(value = "want_act3", required = false) String want_act3, 
			@RequestParam(value = "want_age") String want_age,
			@RequestParam(value = "si") String si,
			@RequestParam(value = "gu") String gu, 
			@RequestParam(value = "dong") String dong,
			@RequestParam(value = "schedule") String schedulestr, 
			@RequestParam(value = "payment") String paymentstr, 
			@RequestParam(value = "cctv") char cctv,
			@RequestParam(value = "introduce", required = false) String introduce,
			@RequestParam(value = "user_id") String user_id, 
			@RequestParam(value = "user_pw") String user_pw,
			@RequestParam(value = "name") String name, 
			@RequestParam(value = "email") String email,
			@RequestParam(value = "tel") String tel, 
			@RequestParam(value = "birthdate") String birthdate,
			@RequestParam(value = "gender") char gender) {

		// 데이터 가공
		paymentstr = paymentstr.replace(",", "");
		int payment = Integer.parseInt(paymentstr);
		String schedule = schedulestr.replace("'", "\"");

		// 유효성 검사에 사용될 객체
		Sitter_info check = new Sitter_info();
		check.setId(user_id);
		check.setEmail(email);
		check.setPhone(tel);

		// 아이디 검사
		try {

			int result = memberService.idCheck(check);
			if (result == 1) {
				return webhelper.getJsonWarning("id");
			}
			sitterinfo.setId(user_id);
		} catch (Exception e) {
			return webhelper.getJsonError(e.getLocalizedMessage());
		}
		// 이메일 검사
		try {
			int result = memberService.emailCheck(check);
			if (result == 1) {
				return webhelper.getJsonWarning("email");
			}
			sitterinfo.setEmail(email);
		} catch (Exception e) {
			return webhelper.getJsonError(e.getLocalizedMessage());
		}
		// 핸드폰번호 검사
		try {
			int result = memberService.phoneCheck(check);
			if (result == 1) {
				return webhelper.getJsonWarning("phone");
			}
			sitterinfo.setPhone(tel);
		} catch (Exception e) {
			return webhelper.getJsonError(e.getLocalizedMessage());
		}

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

		sitterinfo.setPassword(user_pw);
		sitterinfo.setName(name);
		sitterinfo.setBirthdate(birthdate);
		sitterinfo.setGender(gender);
		sitterinfo.setJob_opening('N');
		sitterinfo.setSubscribe('N');
		// mominfo.setSitter_gender('F');
		// mominfo.setInterview_type('1');
		// mominfo.setCare_type("주1회");
		// mominfo.setOpeningdate("2021-02-04");

		int memberno = sitterinfo.getMemberno();
		sitterinfo.setMemberno(memberno);

		// log.debug(mominfo.toString());

		try {
			// 데이터 저장 --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			memberService.addSitter(sitterinfo);

		} catch (Exception e) {
			return webhelper.getJsonError(e.getLocalizedMessage());
		}
		return webhelper.getJsonData();
	}

	// 임시비밀번호 발급
	/* 비밀번호 찾기 */
	@RequestMapping(value = "login/findpw", method = RequestMethod.POST)
	public ModelAndView findPwPOST(Model model, HttpServletResponse response,
			@RequestParam(value = "id") String id) throws Exception {
		mominfo.setId(id);
		memberService.findPw(response, mominfo);
		return webhelper.redirect(null, "임시 비밀번호가 발송되었습니다");
		
		
		
	}

}
