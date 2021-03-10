package study.team.abuhae.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.team.abuhae.helper.AgeHelper;
import study.team.abuhae.helper.RegexHelper;
import study.team.abuhae.helper.WebHelper;
import study.team.abuhae.model.Connect;
import study.team.abuhae.model.Heart;
import study.team.abuhae.model.Mom_info;
import study.team.abuhae.model.ProfileFile;
import study.team.abuhae.model.Report;
import study.team.abuhae.model.Review;
import study.team.abuhae.model.Sitter_info;
import study.team.abuhae.service.DetailService;
import study.team.abuhae.service.MemberService;
import study.team.abuhae.service.UploadService;

@Controller
public class Page_detailController {
	
	@Autowired
	DetailService detailService;
	@Autowired
	MemberService memberService;
	@Autowired
	UploadService uploadService;
	
	@Autowired
	WebHelper webHelper;
	@Autowired
	AgeHelper ageHelper;
	@Autowired
	RegexHelper regexHelper;
	@Value("#{servletContext.contextPath}")
    String contextPath;
	
	// 맘 상세페이지
	@RequestMapping(value = "/page_detail/mom_detail.do", method = RequestMethod.GET)
	public ModelAndView mom_detail(Model model,
			@RequestParam(value = "momno", defaultValue = "0") int momno) {
		
			// 데이터 조회에 필요한 조건값을 Beans에 저장하기 
			Mom_info input = new Mom_info();
			ProfileFile input2 = new ProfileFile();
			input.setMomno(momno);
			input2.setMomno(momno);
			
			// 조회결과를 저장할 객체 선언 
			Mom_info output = null;
			ProfileFile output2 = null;
			int age = 0;
			int age2 = 0;
			
			try {
				// 데이터 조회 
				output = detailService.getMomItem(input);
				output2 = uploadService.getMomProfileItem(input2);
				AgeHelper ageHelper = new AgeHelper();
				age = ageHelper.kidsAge(output.getKids_age());
				
				if (output.getKids_num() == 2) {
					age2 = ageHelper.kidsAge(output.getKids_age2());
				}
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			model.addAttribute("output", output);
			model.addAttribute("profile", output2);
			model.addAttribute("age", age);
			model.addAttribute("age2", age2);
			return new ModelAndView("/page_detail/mom_page_detail/mom_detail");
			//return "/page_detail/mom_page_detail/mom_detail";
	}
	
		// 맘 상세페이지 > 인터뷰 페이지
		@RequestMapping(value = "/page_detail/mom_interview.do", method = RequestMethod.GET)
		public ModelAndView mom_interview(Model model, HttpServletResponse response,	
				@RequestParam(value = "momno") int momno) {
			
			// 데이터 조회에 필요한 조건값을 Beans에 저장하기 
			Mom_info input = new Mom_info();
			input.setMomno(momno);
			
			// 조회결과를 저장할 객체 선언 
			Mom_info output = null;
			
			try {
				// 데이터 조회 
				output = detailService.getMomItem(input);
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			model.addAttribute("output", output);
			return new ModelAndView("/page_detail/mom_page_detail/mom_interview");
			//return "/page_detail/mom_page_detail/mom_interview";
	}
		
		// 맘 상세페이지 > 인터뷰하기 
		@RequestMapping(value = "/page_detail/mom_page_detail/mom_interview_ok.do", method = RequestMethod.POST)
		public ModelAndView interview_mom_ok(Model model,
				HttpServletResponse response, 
				@RequestParam(value = "who", required = false) String who,
				@RequestParam(value = "momno", required = false) int momno,
				@RequestParam(value = "sitterno", required = false) int sitterno) {
			
			Connect input = new Connect();
			Sitter_info sitterput = new Sitter_info();
			input.setWho(who);
			input.setMomno(momno);
			input.setSitterno(sitterno);
			sitterput.setSitterno(sitterno);
			
			Sitter_info sitterinfo = null;
			
			try {
				sitterinfo = (Sitter_info) detailService.getSitterItem(sitterput);
			detailService.addConnect(input);
			String redirectUrl = contextPath + "/page_detail/mom_detail.do?momno=" + input.getMomno();
			return webHelper.redirect(redirectUrl, "인터뷰 지원이 완료되었습니다.");
	
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}			
			}
		
		// 시터 상세페이지
		@RequestMapping(value = "/page_detail/sitter_detail.do", method = {RequestMethod.GET, RequestMethod.POST})
		public ModelAndView sitter_detail(Model model, HttpServletResponse response,
			@RequestParam(value = "sitterno", defaultValue = "0") int sitterno) {
			
			// 데이터 조회에 필요한 조건값을 Beans에 저장하기 
			Sitter_info input = new Sitter_info();
			input.setSitterno(sitterno);
			Sitter_info count = new Sitter_info();
			count.setSitterno(sitterno);
			ProfileFile input2 = new ProfileFile();
			
			input2.setSitterno(sitterno);
			
			Review rev = new Review();
			rev.setSitterno(sitterno);
			
			List<Review> reput = null;

			// 조회결과를 저장할 객체 선언 
			Sitter_info output = null;
			ProfileFile output2 = null;
			
			int countput = 0;
			
			try {
				// 데이터 조회 
				reput = detailService.getReviewList(rev);
				output = detailService.getSitterItem(input);
				countput = detailService.editSitter(input);
				output2 = uploadService.getProfileItem(input2);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			model.addAttribute("output", output);
			model.addAttribute("reput", reput);
			model.addAttribute("profile", output2);
			return new ModelAndView("/page_detail/sitter_page_detail/sitter_detail");
			//return "/page_detail/sitter_page_detail/sitter_detail";
		}
		
		
		// 시터 상세페이지 > 인터뷰 페이지
		@RequestMapping(value = "/page_detail/sitter_interview.do", method = RequestMethod.GET)
		public ModelAndView sitter_interview(Model model, HttpServletResponse response,	
			@RequestParam(value = "sitterno") int sitterno) {
		
			// 데이터 조회에 필요한 조건값을 Beans에 저장하기 
			Sitter_info input = new Sitter_info();
			input.setSitterno(sitterno);
			
			// 조회결과를 저장할 객체 선언 
			Sitter_info output = null;
			
			try {
				// 데이터 조회 
				output = detailService.getSitterItem(input);
			
			} catch (Exception e) {
				e.printStackTrace();
			}
				
			model.addAttribute("output", output);
			return new ModelAndView("/page_detail/sitter_page_detail/sitter_interview");
			//return "/page_detail/sitter_page_detail/sitter_interview";
		}
		
		// 시터 상세페이지 > 인터뷰하기
		@RequestMapping(value = "/page_detail/sitter_page_detail/sitter_interview_ok.do", method = RequestMethod.POST)
		public ModelAndView interview_sitter_ok(Model model,
		HttpServletResponse response, 
		@RequestParam(value = "who", required = false) String who,
		@RequestParam(value = "momno", required = false) int momno,
		@RequestParam(value = "sitterno", required = false) int sitterno) {
		
		Connect input = new Connect();
		Mom_info momput = new Mom_info();
		input.setWho(who);
		input.setMomno(momno);
		input.setSitterno(sitterno);
		momput.setMomno(momno);
		
		Mom_info mominfo = null;
		
		
		try {
			mominfo = (Mom_info) detailService.getMomItem(momput);
					
		if (mominfo.getSubscribe() == 'N') {
			String redirectUrl = contextPath + "/buy/mom_ticket.do?momno=" + input.getMomno();
			return webHelper.redirect(redirectUrl, "시터회원에게 지원하기 위해 이용권을 구매해주세요.");
		}
		detailService.addConnect(input);
		String redirectUrl = contextPath + "/page_detail/sitter_detail.do?sitterno=" + input.getSitterno();
		return webHelper.redirect(redirectUrl, "인터뷰 지원이 완료되었습니다.");

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		
		}
				
		// 시터 상세페이지 > 후기 더보기
		@RequestMapping(value = "/page_detail/tab_more.do", method = RequestMethod.GET)
		public String tab_more(Model model, HttpServletResponse response,
				@RequestParam(value = "sitterno", defaultValue = "0") int sitterno) {
			
			// 데이터 조회에 필요한 조건값을 Beans에 저장하기 
			Sitter_info input = new Sitter_info();
			input.setSitterno(sitterno);
			Sitter_info count = new Sitter_info();
			count.setSitterno(sitterno);
			
			Review rev = new Review();
			rev.setSitterno(sitterno);
			
			List<Review> reput = null;

			// 조회결과를 저장할 객체 선언 
			Sitter_info output = null;
			
			int countput = 0;
			
			try {
				// 데이터 조회 
				reput = detailService.getReviewListTotal(rev);
				output = detailService.getSitterItem(input);
				countput = detailService.editSitter(input);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			model.addAttribute("output", output);
			model.addAttribute("reput", reput);

			return "/page_detail/sitter_page_detail/tab_more";
		}
		
}