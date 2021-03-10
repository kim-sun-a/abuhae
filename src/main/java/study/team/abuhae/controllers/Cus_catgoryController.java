package study.team.abuhae.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Cus_catgoryController {
	
	@RequestMapping(value = "/customer/mom_information.do", method = RequestMethod.GET)
	public String mom_information(Model model) {

		return "customer/mom_information";
	}
	@RequestMapping(value = "/customer/mom_product.do", method = RequestMethod.GET)
	public String mom_product(Model model) {

		return "customer/mom_product";
	}
	
	@RequestMapping(value = "/customer/question_danger_ch1.do", method = RequestMethod.GET)
	public String question_danger_ch1(Model model) {

		return "customer/question_danger_ch1";
	}
	@RequestMapping(value = "/customer/question_mom_ch1.do", method = RequestMethod.GET)
	public String question_mom_ch1(Model model) {

		return "customer/question_mom_ch1";
	}
	@RequestMapping(value = "/customer/question_mom_ch2.do", method = RequestMethod.GET)
	public String question_mom_ch2(Model model) {

		return "customer/question_mom_ch2";
	}
	
	@RequestMapping(value = "/customer/question_solution_ch1.do", method = RequestMethod.GET)
	public String question_solution_ch1(Model model) {

		return "customer/question_solution_ch1";
	}
	@RequestMapping(value = "/customer/sitter_activity.do", method = RequestMethod.GET)
	public String sitter_activity(Model model) {

		return "customer/sitter_activity";
	}
	@RequestMapping(value = "/customer/sitter_contract.do", method = RequestMethod.GET)
	public String sitter_contract(Model model) {

		return "customer/sitter_contract";
	}
	@RequestMapping(value = "/customer/sitter_epilogue.do", method = RequestMethod.GET)
	public String sitter_epilogue(Model model) {

		return "customer/sitter_epilogue";
	}
	@RequestMapping(value = "/customer/sitter_information.do", method = RequestMethod.GET)
	public String sitter_information(Model model) {

		return "customer/sitter_information";
	}
}
