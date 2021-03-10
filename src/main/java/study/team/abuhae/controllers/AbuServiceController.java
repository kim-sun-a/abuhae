package study.team.abuhae.controllers;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AbuServiceController {
	@RequestMapping(value = "/abu-service/agreement.do", method = RequestMethod.GET)
	public String agreement(Model model, HttpServletResponse response) {

		return "/abu-service/agreement";
	}
	@RequestMapping(value = "/abu-service/privacy.do", method = RequestMethod.GET)
	public String privacy(Model model, HttpServletResponse response) {

		return "/abu-service/privacy";
	}
	@RequestMapping(value = "/abu-service/team.do", method = RequestMethod.GET)
	public String team(Model model, HttpServletResponse response) {

		return "/abu-service/team";
	}
	@RequestMapping(value = "/abu-service/introduce.do", method = RequestMethod.GET)
	public String introduce(Model model, HttpServletResponse response) {

		return "/abu-service/introduce";
	}
	
	@RequestMapping(value = "/abu-service/introduce_what.do", method = RequestMethod.GET)
	public String introduce_waht(Model model, HttpServletResponse response) {

		return "/abu-service/introduce_what";
	}
	
	@RequestMapping(value = "/abu-service/introduce_when.do", method = RequestMethod.GET)
	public String introduce_when(Model model, HttpServletResponse response) {

		return "/abu-service/introduce_when";
	}
	
}
