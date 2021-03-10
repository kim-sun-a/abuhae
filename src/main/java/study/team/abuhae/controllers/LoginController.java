package study.team.abuhae.controllers;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import study.team.abuhae.model.Cus_bbs;
import study.team.abuhae.model.Mom_info;
import study.team.abuhae.service.MemberService;

@Controller
public class LoginController {
	// 서비스 주입
	@Autowired
	MemberService memberService;
	@Autowired
	WebHelper webHelper;
	@Autowired
	RegexHelper regexHelper;
	@Value("#{servletContext.contextPath}")
	String contextPath;

	@RequestMapping(value = "/login/login.do", method = RequestMethod.GET)
	public ModelAndView login(Model model, HttpServletResponse response) {

		return new ModelAndView("/login/login");
	}

	@RequestMapping(value = "/login/login_ok.do", method = RequestMethod.POST)
	private ModelAndView login_ok(Model model, HttpServletResponse response, 
			HttpServletRequest request, HttpSession session,
			@RequestParam(value = "user_id") String user_id, 
			@RequestParam(value = "user_pw") String user_pw) {

		// 데이터 조회할 객체
		Mom_info input = new Mom_info();
		input.setId(user_id);
		input.setPassword(user_pw);

		// 조회된 데이터 저장 객체
		Mom_info login = null;

		try {
			// 특정 아이디에 대한 결과 조회
			login = (Mom_info) memberService.getMemberLogin(input);
			
		
			if ( session.getAttribute("isLogin") != null ){
	            // 기존에 login이란 세션 값이 존재한다면
	            session.removeAttribute("isLogin"); // 기존값을 제거해 준다.
	        }

			if (login != null) {
				// 조회된 데이터가 널이 아니라면 로그인 성공
				// session.setAttribute("islogin", output);
				session.setAttribute("isLogin", true); // 로그인 여부 세션
				//session.setAttribute("loginID", login.getId()); // 로그인한 회원 id 세션
				session.setAttribute("loginType", login.getType()); // 로그인한 회원 type 세션
				//session.setAttribute("loginNo", login.getMemberno()); // 로그인한 회원 number 세션
				session.setAttribute("login", login);

			}
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		String url = contextPath;
		return webHelper.redirect(url, null);
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {
		session.invalidate();

		String url = contextPath;
		return webHelper.redirect(url, null);
	}

	@RequestMapping(value = "/login/find.do", method = RequestMethod.GET)
	public String find(Model model, HttpServletResponse response) {
	

		return "/login/find";
	}

	// 아이디 찾기
	@RequestMapping(value = "login/find_ok", method = RequestMethod.POST)
	public ModelAndView m_find_id_ok(Model model, 
			@RequestParam(value = "name", defaultValue = "") String name,
			@RequestParam(value = "birthdate", defaultValue = "") String birthdate_str, 
			@RequestParam(value = "tel", defaultValue = "") String phone) {
		
		//파라미터 유효성 검사
		if(!regexHelper.isValue(name)) {
			return webHelper.redirect(null, "이름을 입력해 주세요");
		}
		if(!regexHelper.isValue(birthdate_str)) {
			return webHelper.redirect(null, "생년월일을 입력해 주세요");
		}
		if(!regexHelper.isValue(phone)) {
			return webHelper.redirect(null, "연락처를 입력해 주세요");
		}
		
		Mom_info mominfo = new Mom_info();
		
		// 데이터 가공
		String year = birthdate_str.substring(0, 4);
		String mon = birthdate_str.substring(4, 6);
		String day = birthdate_str.substring(6, 8);

		String birthdate = year+"-"+mon+"-"+day;

		// 저장할 값 beans에 담기
		mominfo.setName(name);
		mominfo.setBirthdate(birthdate);
		mominfo.setPhone(phone);

		// log.debug(mominfo.toString());
		Mom_info output = null;

		try {
			// 요청한 값으로 id 찾아오기
			output = (Mom_info) memberService.findId(mominfo);
			if(output == null) {
				return webHelper.redirect(null, "조회된 정보가 없습니다. 회원 정보를 다시 확인해 주세요!");
			}

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		//view 
		model.addAttribute("id", output.getId());
		model.addAttribute("isfind", "OK");
		return new ModelAndView("login/find");
	}
	
	
}
