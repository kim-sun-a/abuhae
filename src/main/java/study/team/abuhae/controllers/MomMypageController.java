package study.team.abuhae.controllers;

import java.util.List;
import java.util.Locale;

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
import study.team.abuhae.model.Connect;
import study.team.abuhae.model.Coupon;
import study.team.abuhae.model.Heart;
import study.team.abuhae.model.Leave_member;
import study.team.abuhae.model.Mom_info;
import study.team.abuhae.model.ProfileFile;
import study.team.abuhae.model.Report;
import study.team.abuhae.model.Review;
import study.team.abuhae.service.AdminService;
import study.team.abuhae.service.MomMypageService;
import study.team.abuhae.service.UploadService;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class MomMypageController {
	@Autowired
	MomMypageService momMypageService;
	@Autowired
	AdminService adminService;
	@Autowired WebHelper webHelper;
	@Autowired RegexHelper regexHelper;
	@Autowired
	UploadService uploadService;
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/** mypage controller */
	@RequestMapping(value = "/mypage/mypage_mom/mom_mypage.do", method = RequestMethod.GET)
	public ModelAndView mom_mypage(Model model,HttpServletResponse response, HttpServletRequest request,
			@RequestParam(value = "momno") int momno) {
		// 데이터 조회에 필요한 조건값 Beans에 저장
		Mom_info input = new Mom_info();
		ProfileFile input2 = new ProfileFile();
		input.setMomno(momno);
		input2.setMomno(momno);
		
		// 조회 결과를 저장할 객체 선언
		Mom_info output = null;
		ProfileFile output2 = null;
		int heartcount = 0;
		int couponcount = 0;
		int workcount = 0;
		int reportcount = 0;
		
		try {
			output = momMypageService.getMemberItem(input);
			output2 = uploadService.getMomProfileItem(input2);
			heartcount = momMypageService.getMomHeartCount(input);
			couponcount = momMypageService.getCouponCount(input);
			workcount = momMypageService.getMomWorkCount(input);
			reportcount = momMypageService.getMomReprotCount(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// View 처리 
		model.addAttribute("output" ,output);
		model.addAttribute("profile", output2);
		model.addAttribute("heartcount", heartcount);
		model.addAttribute("couponcount", couponcount);
		model.addAttribute("workcount", workcount);
		model.addAttribute("reportcount", reportcount);
		
		return new ModelAndView("mypage/mypage_mom/mom_mypage");
	}
	
	/** 내 구인 현황 페이지 */
	@RequestMapping(value = "/mypage/mypage_mom/gets/{momno}", method = RequestMethod.GET)
	public ModelAndView get_sitter(Model model, HttpSession session,
			@PathVariable int momno) {
		Connect input = new Connect();
		input.setMomno(momno);
		
		List<Connect> output = null;
		List<Connect> output2 = null;
		
		try {
			output = momMypageService.getMomInputApplyList(input);
			output2 = momMypageService.getMomOutputApplyList(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		/** Veiw 처리 */
		model.addAttribute("in", output);
		model.addAttribute("out", output2);
		
		return new ModelAndView("mypage/mypage_mom/get_sitter_mpm");
	}
	
	/** 찜한 맘시터 페이지 */
	@RequestMapping(value = "/mypage/mypage_mom/likes/{momno}", method = RequestMethod.GET)
	public ModelAndView like_sitter(Model model,  HttpSession session,
			@PathVariable int momno) {
		// 데이터 조회에 필요한 조건값 Beans에 저장
		Mom_info in = new Mom_info();
		in.setMomno(momno);
		
		// 조회 결과를 저장할 객체 선언
		int heartcount = 0;
		
		try {
			heartcount = momMypageService.getMomHeartCount(in);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("heartcount", heartcount);
		
		/** 데이터 조회 */
		Heart input = new Heart();
		input.setMomno(momno);
		
		/** 후기 작성할 수 있는 회원 목록*/
		List<Heart> output = null;
		
		try {
			output = momMypageService.getHeartList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output", output);

		return new ModelAndView("mypage/mypage_mom/like_sitter_mpm");
	}
	
	/** 내 신청서 수정 페이지 */
	@RequestMapping(value = "/mypage/mypage_mom/update_appl.do", method = RequestMethod.GET)
	public String update_appl(Model model, HttpServletResponse response,
			@RequestParam(value = "momno") int momno) {

		// 데이터 조회에 필요한 조건값 Beans에 저장
		Mom_info input = new Mom_info();
		input.setMomno(momno);
		
		// 조회 결과를 저장할 객체 선언
		Mom_info output = null;
		
		try {
			output = momMypageService.getMemberItem(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// View 처리 
		model.addAttribute("output" ,output);

		return "mypage/mypage_mom/update_appl";
	}
	
	/** 내 쿠폰함 페이지 */
	@RequestMapping(value = "/mypage/mypage_mom/coup/{momno}", method = RequestMethod.GET)
	public ModelAndView coupon_mom(Model model, HttpServletResponse response,
			@PathVariable int momno) {
		Mom_info in = new Mom_info();
		in.setMomno(momno);
		
		// 조회 결과를 저장할 객체 선언
		int couponcount = 0;
		
		try {
			couponcount = momMypageService.getCouponCount(in);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		/** 데이터 조회 */
		Coupon input = new Coupon();
		input.setMomno(momno);
		
		/** 후기 작성할 수 있는 회원 목록*/
		List<Coupon> output = null;
		
		try {
			output = momMypageService.getCouponList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		// View 처리 
		model.addAttribute("couponcount" ,couponcount);
		model.addAttribute("output", output);

		return new ModelAndView("mypage/mypage_mom/coupon");
	}
	
	/** 후기 관리 페이지 */
	@RequestMapping(value = "/mypage/mypage_mom/review.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView review_mom(Model model,
			@RequestParam(value = "momno", defaultValue = "0") int momno,
			@RequestParam(value = "sitterno", defaultValue = "0") int sitterno) {
		
		/** 데이터 조회 */
		Review input = new Review();
		input.setMomno(momno);
		
		/** 후기 작성할 수 있는 회원 목록*/
		List<Review> output1 = null;
		
		try {
			output1 = momMypageService.getReviewMemberList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 작성한 후기 목록 */
		List<Review> output2 = null;
		
		try {
			output2 = momMypageService.getReviewList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** View 출력 */
		model.addAttribute("output1", output1);
		model.addAttribute("output2", output2);
		
		return new ModelAndView("mypage/mypage_mom/review");
	}
	
	/** 내 채용내역 페이지 */
	@RequestMapping(value = "/mypage/mypage_mom/counts/{momno}", method = RequestMethod.GET)
	public ModelAndView count_mom(Model model, HttpServletResponse response,
			@PathVariable int momno) {

		// 데이터 조회에 필요한 조건값 Beans에 저장
		Mom_info in = new Mom_info();
		in.setMomno(momno);
		
		// 조회 결과를 저장할 객체 선언
		int workcount = 0;
		
		try {
			workcount = momMypageService.getMomWorkCount(in);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// View 처리 
		model.addAttribute("workcount" ,workcount);
		
		/** 데이터 조회 */
		Connect input = new Connect();
		input.setMomno(momno);
		
		/** 후기 작성할 수 있는 회원 목록*/
		List<Connect> output = null;
		
		try {
			output = momMypageService.getWorkList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output", output);

		return new ModelAndView("mypage/mypage_mom/count_mom_mps");
	}
	
	/** 신고 내역 페이지 */
	@RequestMapping(value = "/mypage/mypage_mom/rep/{momno}", method = RequestMethod.GET)
	public ModelAndView sue_mom(Model model, HttpServletResponse response,
			@PathVariable int momno) {
		// 데이터 조회에 필요한 조건값 Beans에 저장
		Mom_info in = new Mom_info();
		in.setMomno(momno);
		
		// 조회 결과를 저장할 객체 선언
		int reportcount = 0;
		
		try {
			reportcount = momMypageService.getMomReprotCount(in);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// View 처리 
		model.addAttribute("reportcount" ,reportcount);
		
		/** 데이터 조회 */
		Report input = new Report();
		input.setMomno(momno);
		
		/** 후기 작성할 수 있는 회원 목록*/
		List<Report> output = null;
		
		try {
			output = momMypageService.getReprotList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output", output);

		
		return new ModelAndView("mypage/mypage_mom/sue");
	}
	
	/** 결제 내역 페이지 */
	@RequestMapping(value = "/mypage/mypage_mom/pm/{momno}", method = RequestMethod.GET)
	public ModelAndView payment_list_mom(Model model, HttpServletResponse response,
			@PathVariable int momno) {
		/** 데이터 조회 */
		Mom_info input = new Mom_info();
		input.setMomno(momno);
		
		/** 후기 작성할 수 있는 회원 목록*/
		Mom_info output = null;
		
		try {
			output = momMypageService.getBuyList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output", output);
		
		return new ModelAndView("mypage/mypage_mom/payment_list");
	}
	
	/** 회원탈퇴 신청 페이지 */
	@RequestMapping(value = "/mypage/mypage_mom/la", method = RequestMethod.GET)
	public String leave_mom(Locale locale, Model model) {

		return "mypage/mypage_mom/leave_abu";
	}
	
	/** 회원탈퇴 신청 ok */
	@RequestMapping(value = "/mypage/mypage_mom/leaveok.do", method = RequestMethod.POST)
	public ModelAndView leave_momOK(Model model,
			@RequestParam(value = "memberno", defaultValue = "0") int memberno,
			@RequestParam(value = "leave_reason") String reason) {
		
		//데이터 불러올 객체
		Leave_member input = new Leave_member();
		Mom_info input2 = new Mom_info();
		input2.setMemberno(memberno);
		
		//회원 조회 먼저
		Mom_info output = null;
		int output2=0;
		
		try {
			//memberno을 통해 회원 단일 조회
			output = momMypageService.getAccountItem(input2);
			
			//조회된 회원 객체로 leavemember에 있는지 확인
			output2 = adminService.getLeaveCount(output);
			
			//조회된 내용이 null이라면 신청 X
			if(output2 == 0) {
				input.setType(output.getType());
				input.setId(output.getId());
				input.setName(output.getName());
				input.setEmail(output.getEmail());
				input.setPhone(output.getPhone());
				input.setReason(reason);
				momMypageService.addAbuOut(input);
			} else {
				return webHelper.redirect(null, "이미 탈퇴신청이 되었습니다.");
			}
			
			
			
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		String url = contextPath+"/logout";
		return webHelper.redirect(url, "탈퇴 신청이 완료되었습니다.");
	}
	
	
	/** 아부해 서비스 이용 동의 페이지 */
	@RequestMapping(value = "/mypage/mypage_mom/agree_service.do", method = RequestMethod.GET)
	public String agree_mom(Locale locale, Model model) {

		return "mypage/mypage_mom/agree_service";
	}
	
	//선아 작업/////////////////////////////////////////////////////////////////
	   /** 계정관리 페이지 */
	   @RequestMapping(value = "/mypage/mypage_mom/ac/{memberno}", method = RequestMethod.GET)
	   public ModelAndView manage_account_mom(Locale locale, Model model,
	         @PathVariable int memberno) {
	      if(memberno ==0 ) {
	         webHelper.getJsonWarning("회원 번호 없이는 조회할 수 없습니다");
	      }
	      
	      //데이터 조회
	      Mom_info input = new Mom_info();
	      input.setMemberno(memberno);
	      
	      //데이터 저장 
	      Mom_info output = null;
	      
	      try {
	         output = momMypageService.getAccountItem(input);
	      } catch (Exception e) {
	         return webHelper.redirect(null, e.getLocalizedMessage());
	      }
	      
	      //데이터 출력
	      model.addAttribute("output", output);
	      
	      
	      return new ModelAndView ("mypage/mypage_mom/manage_account");
	   }
	   
	   @RequestMapping(value = "/mypage/updatePhone.do", method = RequestMethod.POST)
	   public ModelAndView updatePhone(Model model,
	         @RequestParam(value = "memberno", defaultValue = "0") int memberno,
	         @RequestParam(value = "phone", defaultValue = "") String phone) {
	      if(memberno ==0 ) {
	         webHelper.redirect(null, "회원 번호 없이는 접근 불가능합니다");
	      }
	      if(phone =="" || phone==null ) {
	         webHelper.redirect(null, "수정할 핸드폰 번호를 입력해 주세요");
	      }
	      
	      //데이터 조회
	      Mom_info input = new Mom_info();
	      input.setMemberno(memberno);
	      input.setPhone(phone);
	      
	      Mom_info output = null;
	      
	      try {
	         momMypageService.editPhone(input);
	         output = momMypageService.getAccountItem(input);
	         
	      } catch (Exception e) {
	         return webHelper.redirect(null, e.getLocalizedMessage());
	      }
	      
	      String url = contextPath+"/mypage/mypage_mom/ac/"+output.getMemberno();
	      
	      return webHelper.redirect(url, null);
	   }
	   
	   /** 아부해 서비스 이용 동의 페이지 */
	   @RequestMapping(value = "/mypage/updateEmail.do", method = RequestMethod.POST)
	   public ModelAndView updateMemberPhone(Model model,
	         @RequestParam(value = "memberno", defaultValue = "0") int memberno,
	         @RequestParam(value = "email", defaultValue = "") String email) {
	      if(memberno ==0 ) {
	         webHelper.redirect(null, "회원 번호 없이는 접근 불가능합니다");
	      }
	      if(email =="" || email==null ) {
	         webHelper.redirect(null, "수정할 핸드폰 번호를 입력해 주세요");
	      }
	      
	      //데이터 조회
	      Mom_info input = new Mom_info();
	      input.setMemberno(memberno);
	      input.setEmail(email);
	      
	      Mom_info output = null;
	      
	      try {
	         momMypageService.editEmail(input);
	         output = momMypageService.getAccountItem(input);
	         
	      } catch (Exception e) {
	         return webHelper.redirect(null, e.getLocalizedMessage());
	      }
	      
	      String url = contextPath+"/mypage/mypage_mom/ac/"+output.getMemberno();
	      
	      return webHelper.redirect(url, null);
	   }
	   
	   /** 비밀번호 변경 페이지 */
	   @RequestMapping(value = "/mypage/mypage_mom/updp/{memberno}", method = RequestMethod.GET)
	   public ModelAndView update_password_mom(Model model, HttpSession session,
	         @PathVariable int memberno) {

	      /** 1) 파라미터 유효성 검사 */
	      if (memberno == 0) {
	         return webHelper.redirect(null, "회원번호가 없습니다.");
	      }
	      
	      /** 2) 데이터 조회하기 */
	      Mom_info input = new Mom_info();
	      input.setMemberno(memberno);
	      
	      // 조회 결과 저장
	      Mom_info output = null;
	      
	      try {
	         output = momMypageService.getAccountItem(input);
	      } catch (Exception e) {
	         return webHelper.redirect(null, e.getLocalizedMessage());
	      }
	      
	      /** 3) View 처리 */
	      
	      return new ModelAndView("mypage/mypage_mom/update_password");
	   }
	   
	   /** 비밀번호 변경 페이지 */
	   @RequestMapping(value = "/mypage/mypage_mom/update_passwordOk.do", method = RequestMethod.POST)
	   public ModelAndView update_passwordOK(Model model, HttpSession session,
	         @RequestParam(value = "memberno", defaultValue = "0") int memberno,
	         @RequestParam(value = "now_pw") String oldpassword,
	         @RequestParam(value = "new_pw") String newpassword) {

	      /** 1) 파라미터 유효성 검사 */
	      if (memberno == 0) {
	         return webHelper.redirect(null, "존재하지 않은 회원번호입니다.");
	      }
	      if(oldpassword=="" || oldpassword==null) {
	         return webHelper.redirect(null, "현재 비밀번호를 입력하세요.");
	      }
	      if(newpassword=="" || newpassword==null) {
	         return webHelper.redirect(null, "새로운 비밀번호를 입력하세요.");
	      }
	      
	      /** 2) 데이터 조회하기 */
	      Mom_info input = new Mom_info();
	      input.setMemberno(memberno);
	      input.setPassword(oldpassword);
	      
	      // 조회 결과 저장
	      int bigyo =0;
	      //새로운 비밀번호 저장할 객체 
	      Mom_info newpw = new Mom_info();
	      newpw.setPassword(newpassword);
	      newpw.setMemberno(memberno);
	      
	      Mom_info output = null;
	      
	      try {
	         //현재 비밀번호 조회
	         bigyo = momMypageService.bigyoPassword(input);
	         
	         if(bigyo==0) {
	            return webHelper.redirect(null, "현재 비밀번호를 확인하세요!");
	         }
	         //현재 비밀번호와 일치하면 새로운 비밀번호로 업데이트
	         momMypageService.updatePassword(newpw);
	         output = momMypageService.getAccountItem(input);

	      } catch (Exception e) {
	         return webHelper.redirect(null, e.getLocalizedMessage());
	      }
	      
	      /** 3) View 처리 */
	      String url = contextPath+"/mypage/mypage_mom/mom_mypage.do?&momno="+output.getMomno();
	      return webHelper.redirect(url, "비밀번호 변경이 완료되었습니다.");
	   }
	   
	   //////////////end 선아작업////////////////////////////////////////
}
