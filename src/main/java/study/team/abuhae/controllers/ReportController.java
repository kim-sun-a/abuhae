package study.team.abuhae.controllers;

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
import study.team.abuhae.model.Mom_info;
import study.team.abuhae.model.ProfileFile;
import study.team.abuhae.model.Report;
import study.team.abuhae.model.Sitter_info;
import study.team.abuhae.service.DetailService;
import study.team.abuhae.service.UploadService;

@Controller
public class ReportController {
	
		@Autowired
		DetailService detailService;
		
		@Autowired
		WebHelper webHelper;
		@Autowired
		RegexHelper regexHelper;
		@Value("#{servletContext.contextPath}")
	    String contextPath;
		@Autowired
		UploadService uploadService;
	
		// 맘 신고 페이지
		@RequestMapping(value = "/page_detail/mom_page_detail/mom_report.do", method = RequestMethod.GET)
		public String report_mom(Model model, HttpServletResponse response,
			@RequestParam(value = "momno") int momno) {
			
			// 데이터 조회에 필요한 조건값을 Beans에 저장하기 
			Mom_info input = new Mom_info();
			ProfileFile input2 = new ProfileFile();
			input.setMomno(momno);
			input2.setMomno(momno);
			
			// 조회결과를 저장할 객체 선언 
			Mom_info output = null;
			ProfileFile output2 = null;
			
			try {
				// 데이터 조회 
				output = detailService.getMomItem(input);
				output2 = uploadService.getMomProfileItem(input2);
			
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			model.addAttribute("output", output);
			model.addAttribute("profile", output2);
			return "/page_detail/mom_page_detail/mom_report";
		}
		
		@RequestMapping(value = "/page_detail/mom_page_detail/mom_report_ok.do", method = RequestMethod.POST)
		public ModelAndView report_mom_ok(Model model,
				HttpServletResponse response, HttpSession session,
				@RequestParam(value = "who", required = false) char who,
				@RequestParam(value = "type", required = false) String type,
				@RequestParam(value = "contents", required = false) String contents,
				@RequestParam(value = "momno", required = false) int momno,
				@RequestParam(value = "sitterno", required = false) int sitterno) {
			
			if(!regexHelper.isValue(type)) {
				return webHelper.redirect(null, "신고 타입은 무조건 선택해야 합니다.");
			}
			
			Report input = new Report();
			input.setWho(who);
			input.setType(type);
			input.setContents(contents);
			input.setMomno(momno);
			input.setSitterno(sitterno);
			
			try {
				detailService.addReport(input);
				
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			
			String redirectUrl = contextPath + "/page_detail/mom_detail.do?momno=" + input.getMomno();
			return webHelper.redirect(redirectUrl, "신고가 완료되었습니다.");
		}
				
		
		// 시터 신고 페이지
		@RequestMapping(value = "/page_detail/sitter_page_detail/sitter_report.do", method = RequestMethod.GET)
		public String report_sitter(Model model, HttpServletResponse response,
				@RequestParam(value = "sitterno" ) int sitterno) {
			
			// 데이터 조회에 필요한 조건값을 Beans에 저장하기 
			Sitter_info input = new Sitter_info();
			ProfileFile input2 = new ProfileFile();
			input.setSitterno(sitterno);
			input2.setSitterno(sitterno);
			
			// 조회결과를 저장할 객체 선언 
			Sitter_info output = null;
			ProfileFile output2 = null;
			
			try {
				// 데이터 조회 
				output = detailService.getSitterItem(input);
				output2 = uploadService.getProfileItem(input2);
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			model.addAttribute("output", output);
			model.addAttribute("profile", output2);
			return "/page_detail/sitter_page_detail/sitter_report";
			
		}
		
		@RequestMapping(value = "/page_detail/sitter_page_detail/sitter_report_ok.do", method = RequestMethod.POST)
		public ModelAndView report_sitter_ok (Model model,
				HttpServletResponse response,
				@RequestParam(value = "who", required = false) char who,
				@RequestParam(value = "type", required = false) String type,
				@RequestParam(value = "contents", required = false) String contents,
				@RequestParam(value = "momno", required = false) int momno,
				@RequestParam(value = "sitterno", required = false) int sitterno) {
			
			if(!regexHelper.isValue(type)) {
				return webHelper.redirect(null, "신고 타입은 무조건 선택해야 합니다.");
			}
			
			Report input = new Report();
			input.setWho(who);
			input.setType(type);
			input.setContents(contents);
			input.setMomno(momno);
			input.setSitterno(sitterno);
			
			try {
				detailService.addReport(input);
				
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			
			String redirectUrl = contextPath + "/page_detail/sitter_detail.do?sitterno=" + input.getSitterno();
			return webHelper.redirect(redirectUrl, "신고가 완료되었습니다.");
		}
}
