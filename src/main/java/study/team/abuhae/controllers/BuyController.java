package study.team.abuhae.controllers;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import study.team.abuhae.helper.WebHelper;
import study.team.abuhae.model.Coupon;
import study.team.abuhae.model.Member;
import study.team.abuhae.model.Mom_info;
import study.team.abuhae.service.BuyService;

@Controller
public class BuyController {

	@Autowired
	BuyService buyService;
	@Autowired
	WebHelper webHelper;
	@Value("#{servletContext.contextPath}")
	String contextPath;

	// 이용권 페이지
	@RequestMapping(value = "/buy/buy.do", method = RequestMethod.GET)
	public String buy(Model model) {

		return "/buy/buy";
	}

	// 맘 이용권 페이지
	@RequestMapping(value = "/buy/mom_ticket.do", method = RequestMethod.GET)
	public String mom_ticket(Model model) {

		return "/buy/mom_ticket";
	}

	// 시터 이용권 페이지
	@RequestMapping(value = "/buy/sitter_ticket.do", method = RequestMethod.GET)
	public String sitter_ticket(Model model) {

		return "/buy/sitter_ticket";
	}

	// 이용권 금액 계산 페이지
	@RequestMapping(value = "/buy/receipt.do", method = RequestMethod.GET)
	public String receipt(Model model, HttpServletResponse response,
			@RequestParam(value = "tktype", required = false) int tktype,
			@RequestParam(value = "memberno", required = false, defaultValue = "0") int memberno) {

		// 로그인 세션 객체를 받아와서 Mom_info의 memberno 조회
		Mom_info input = new Mom_info();
		input.setMemberno(memberno);
		
		if (memberno == 0) {
			String url = contextPath+"/login/login";
			webHelper.redirect(url, "로그인이 필요한 서비스입니다.");
		}

		/** 쿠폰 목록 조회하기 */
		// 조회 결과를 저장할 객체 선언
		List<Coupon> cpout = null;
		// 조회할 값을 Beans에 담는다.
		Coupon cp = new Coupon();
		cp.setMemberno(input.getMemberno());

		try {
			// 데이터 조회 --> 해당 멤버에게 부여된 쿠폰 리스트 조회
			cpout = buyService.findCoupon(cp);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 이용권 가격
		int tkprice = 0;

		switch (tktype) {
		case 1: {
			tkprice = 29900;
			break;
		}
		case 3: {
			tkprice = 49900;
			break;
		}
		case 6: {
			tkprice = 79900;
			break;
		}
		}

		// 저장할 값들을 Beans에 담는다.
		Mom_info output = new Mom_info();

		// 쿠폰 적용 가격 계산
		if (!cpout.isEmpty()) {
			double temp1 = tkprice * 0.7;
			int temp2 = (int) temp1;
			tkprice = temp2;
			// 재구매
			output.setMemberno(memberno);
			output.setTicket_type(tktype);
			output.setTicket_price(tkprice);
		} else {
			// 신규 구매
			output.setMemberno(memberno);
			output.setTicket_type(tktype);
			output.setTicket_price(tkprice);
		}

		// View에 추가
		model.addAttribute("cpout", cpout);
		model.addAttribute("output", output);

		return "/buy/receipt";
	}

	// 이용권 결제 페이지
	@RequestMapping(value = "/buy/receipt_ok.do", method = RequestMethod.GET)
	public String receipt_ok(Model model, HttpServletResponse response,
			@RequestParam(value = "tktype", required = false) int tktype,
			@RequestParam(value = "memberno", required = false, defaultValue = "0") int memberno,
			@RequestParam(value = "tkprice", required = false) int tkprice) {
	
		
		// 로그인 세션 객체를 받아와서 Mom_info의 memberno 조회
		Mom_info input = new Mom_info();
		input.setMemberno(memberno);
		
		// 조회 결과를 저장할 객체 선언
		List<Coupon> cpout = null;
		
		Coupon cp = new Coupon();
		cp.setMemberno(input.getMemberno());
		
		try {
			// 데이터 조회 --> 해당 멤버에게 부여된 쿠폰 리스트 조회
			cpout = buyService.findCoupon(cp);
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		
		// 저장할 값들을 Beans에 담는다.
		Mom_info output = new Mom_info();
		
		output.setMemberno(memberno);
		output.setTicket_type(tktype);
		output.setTicket_price(tkprice);


		// 구매 처리
		if (!cpout.isEmpty()) {
			// 쿠폰 적용시 재구매 고객
			try {
				buyService.reBuy(output);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else { 
			// 쿠폰 미적용시 신규구매 고객
			try {
				buyService.newBuy(output);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		

		return "/buy/receipt_ok";
	}
}
