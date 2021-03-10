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

import study.team.abuhae.helper.RegexHelper;
import study.team.abuhae.helper.WebHelper;
import study.team.abuhae.model.Mom_info;
import study.team.abuhae.service.MomMypageService;

@Controller
public class MypageTestController {
	@Autowired
	MomMypageService momMypageService;
	@Autowired WebHelper webHelper;
	@Autowired RegexHelper regexHelper;
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/** 내 신청서 수정 페이지 */
	@RequestMapping(value = "/mypage/update_appl.do", method = RequestMethod.GET)
	public ModelAndView update_appl(Model model, HttpServletResponse response,
			@RequestParam(value = "memberno") int memberno) {

		// 데이터 조회에 필요한 조건값 Beans에 저장
		Mom_info input = new Mom_info();
		input.setMomno(memberno);
		
		// 조회 결과를 저장할 객체 선언
		Mom_info output = null;
		
		try {
			output = momMypageService.getMemberItem(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// View 처리 
		model.addAttribute("output" ,output);

		return new ModelAndView("mypage/mypage_mom/update_appl");
		//return "mypage/mypage_mom/update_appl";
	}
}
