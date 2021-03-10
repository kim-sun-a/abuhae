package study.team.abuhae.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.protobuf.ByteString.Output;

import study.team.abuhae.helper.PageData;
import study.team.abuhae.helper.RegexHelper;
import study.team.abuhae.helper.WebHelper;
import study.team.abuhae.model.Admin_info;
import study.team.abuhae.model.Cus_bbs;
import study.team.abuhae.model.Cus_category;
import study.team.abuhae.model.Cus_sub_category;
import study.team.abuhae.model.Leave_member;
import study.team.abuhae.model.Member;
import study.team.abuhae.model.Mom_info;
import study.team.abuhae.model.Report;
import study.team.abuhae.model.ResiCert;
import study.team.abuhae.model.Sitter_info;
import study.team.abuhae.service.AdminService;
import study.team.abuhae.service.CustomerService;
import study.team.abuhae.service.MemberService;
import study.team.abuhae.service.UploadService;

@Controller
public class AdminController {
	//서비스주입
	@Autowired
	AdminService adminService;
	@Autowired
	MemberService memberServcie;
	@Autowired
	CustomerService customerService;
	@Autowired
	UploadService uploadService;
	@Autowired
	WebHelper webHelper;
	@Autowired
	RegexHelper regexHelper;
	@Value("#{servletContext.contextPath}")
    String contextPath;
	
	@RequestMapping(value = "/admin/admin_member.do", method = RequestMethod.GET)
	public ModelAndView member(Model model,
			//회원 검색 조건 -> 회원타입
			@RequestParam(value = "type") char type,
			@RequestParam(value = "page", defaultValue = "1") int nowPage
			) {
		/** 1) 페이지 구현에 필요한 변수값 생성 */
        int totalCount = 0;              // 전체 게시글 수
        int listCount  = 10;             // 한 페이지당 표시할 목록 수
        int pageCount  = 5;              // 한 그룹당 표시할 페이지 번호 수

        /** 2) 데이터 조회하기 */
        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
        Mom_info Minput = new Mom_info();
        Minput.setType(type);
        
        Sitter_info Sinput = new Sitter_info();
        Sinput.setType(type);
        
        

        List<Mom_info> Moutput = null;   // 조회결과가 저장될 객체
        List<Sitter_info> Soutput = null;
        PageData pageData = null;        // 페이지 번호를 계산한 결과가 저장될 객체

        try {
            // 전체 게시글 수 조회
        	if(type=='M') {
        		totalCount = memberServcie.getMomCount(Minput);
        	} else {
        		totalCount = memberServcie.getSitterCount(Sinput);
        	}
            
            // 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
            pageData = new PageData(nowPage, totalCount, listCount, pageCount);

            // SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
            Member.setOffset(pageData.getOffset());
            Member.setListCount(pageData.getListCount());
            
            if(type == 'M') {
            	//부모회원 조회일때
            	// 데이터 조회하기
            	Moutput = memberServcie.getMomList(Minput);
            } else {
            	//시터 회원일때
            	Soutput = memberServcie.getSitterList(Sinput);
            }
            
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        /** 3) View 처리 */
        if(type=='M') {
        	model.addAttribute("output", Moutput);
        	model.addAttribute("type", "M");
        } else {
        	model.addAttribute("output", Soutput);
        	model.addAttribute("type", "S");
        }
        model.addAttribute("pageData", pageData);

        return new ModelAndView("admin/admin_member");
	}
	
	@RequestMapping(value = "/admin/admin_coupon.do", method = RequestMethod.GET)
	public ModelAndView coupon(Model model,
			@RequestParam(value = "page", defaultValue = "1") int nowPage,
			@RequestParam(value = "recent", defaultValue = "startdate") String recent) {

		/** 1) 페이지 구현에 필요한 변수값 생성 */
        int totalCount = 0;              // 전체 게시글 수
        int listCount  = 10;             // 한 페이지당 표시할 목록 수
        int pageCount  = 5;              // 한 그룹당 표시할 페이지 번호 수

        /** 2) 데이터 조회하기 */
        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
        Mom_info input = new Mom_info();
        input.setRecent(recent);

        List<Mom_info> output = null;   // 조회결과가 저장될 객체
        PageData pageData = null;        // 페이지 번호를 계산한 결과가 저장될 객체

        try {
            // 전체 게시글 수 조회
            totalCount = adminService.getSubCount(input);
            // 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
            pageData = new PageData(nowPage, totalCount, listCount, pageCount);

            // SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
            Member.setOffset(pageData.getOffset());
            Member.setListCount(pageData.getListCount());
            
            
            
            // 데이터 조회하기
            output = adminService.getSubList(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        /** 3) View 처리 */
        model.addAttribute("output", output);
        model.addAttribute("pageData", pageData);
        model.addAttribute("recent", recent);

        return new ModelAndView("admin/admin_coupon");
		//return "admin/admin_coupon";
	}

	
	@RequestMapping(value = "/admin/admin_bbs.do", method = RequestMethod.GET)
	public ModelAndView bbs(Model model,
			@RequestParam(value = "cateno") int cateno,
			@RequestParam(value = "page", defaultValue = "1") int nowPage
			) {
		Cus_bbs input = new Cus_bbs();
		input.setCateno(cateno);
		/** 1) 페이지 구현에 필요한 변수값 생성 */
        int totalCount = 0;              // 전체 게시글 수
        int listCount  = 10;             // 한 페이지당 표시할 목록 수
        int pageCount  = 5;              // 한 그룹당 표시할 페이지 번호 수
		
		List<Cus_bbs> output = null;
		PageData pageData = null;        // 페이지 번호를 계산한 결과가 저장될 객체
		Cus_category cate = new Cus_category();
		
		try {
            // 전체 게시글 수 조회
            totalCount = adminService.getboardCount(input);
            // 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
            pageData = new PageData(nowPage, totalCount, listCount, pageCount);

            // SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
            Member.setOffset(pageData.getOffset());
            Member.setListCount(pageData.getListCount());
            
            // 데이터 조회하기
            output = adminService.getBoardList(input);
            cate = adminService.getCategoryItem(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }
		
		 /** 3) View 처리 */
        model.addAttribute("output", output);
        model.addAttribute("category", cate.getCategory());
        model.addAttribute("pageData", pageData);
		

		return new ModelAndView("admin/admin_bbs");
	
	}
	
	
	
	
	@RequestMapping(value = "/admin/admin_leave.do", method = RequestMethod.GET)
	public ModelAndView leave(Model model,
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {
		/** 1) 페이지 구현에 필요한 변수값 생성 */
        int totalCount = 0;              // 전체 게시글 수
        int listCount  = 10;             // 한 페이지당 표시할 목록 수
        int pageCount  = 5;              // 한 그룹당 표시할 페이지 번호 수

        /** 2) 데이터 조회하기 */
        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
        Mom_info input = new Mom_info();
        Leave_member input2 = new Leave_member();


        List<Leave_member> output = null;   // 조회결과가 저장될 객체
        PageData pageData = null;        // 페이지 번호를 계산한 결과가 저장될 객체

        try {
            // 전체 게시글 수 조회
            totalCount = adminService.getLeaveCount(input);
            // 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
            pageData = new PageData(nowPage, totalCount, listCount, pageCount);

            // SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
            Member.setOffset(pageData.getOffset());
            Member.setListCount(pageData.getListCount());
            
            // 데이터 조회하기
            output = adminService.getLeaveList(input2);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        /** 3) View 처리 */
        model.addAttribute("output", output);
        model.addAttribute("pageData", pageData);


        return new ModelAndView("admin/admin_leave");
		//return "admin/admin_leave";
	}
	@RequestMapping(value = "/admin/admin_singo.do", method = RequestMethod.GET)
	public ModelAndView singo(Model model,
		//회원 검색 조건 -> 회원타입
		@RequestParam(value = "who") char who,
		@RequestParam(value = "page", defaultValue = "1") int nowPage,
		@RequestParam(value = "recent", defaultValue = "new") String recent) {
		/** 1) 페이지 구현에 필요한 변수값 생성 */
        int totalCount = 0;              // 전체 게시글 수
        int listCount  = 10;             // 한 페이지당 표시할 목록 수
        int pageCount  = 5;              // 한 그룹당 표시할 페이지 번호 수

        /** 2) 데이터 조회하기 */
        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
        Report input = new Report();
        input.setWho(who);
        input.setRecent(recent); //정렬조건 담기

        List<Mom_info> output = null;   // 조회결과가 저장될 객체
        PageData pageData = null;        // 페이지 번호를 계산한 결과가 저장될 객체

        try {
            // 전체 게시글 수 조회
            totalCount = adminService.getReportCount(input);
            // 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
            pageData = new PageData(nowPage, totalCount, listCount, pageCount);

            // SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
            Member.setOffset(pageData.getOffset());
            Member.setListCount(pageData.getListCount());
            
            // 데이터 조회하기
            output = adminService.getReportList(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        /** 3) View 처리 */
        if(who=='M') {
        	model.addAttribute("who", "M");
        } else {
        	model.addAttribute("who", "S");
        }
        model.addAttribute("output", output);
        model.addAttribute("recent", recent);
        model.addAttribute("pageData", pageData);

        return new ModelAndView("admin/admin_singo");
		//return "admin/admin_singo";
	}
	
	
	//시터 인증 승인 게시판
	@RequestMapping(value = "/admin/admin_injeung_sitter.do", method = RequestMethod.GET)
	public ModelAndView inj_sitter(Model model,
			@RequestParam(value = "page", defaultValue = "1") int nowPage,
			@RequestParam(value = "cert", defaultValue = "N") String cert) {

		ResiCert input = new ResiCert();
		input.setCert(cert);

		/** 1) 페이지 구현에 필요한 변수값 생성 */
        int totalCount = 0;              // 전체 게시글 수
        int listCount  = 10;             // 한 페이지당 표시할 목록 수
        int pageCount  = 5;              // 한 그룹당 표시할 페이지 번호 수
        
		List<ResiCert> output = null;
		PageData pageData = null;        // 페이지 번호를 계산한 결과가 저장될 객체

		try {
			totalCount = uploadService.getCertifyListCount(input);
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			
			output = uploadService.getCertifySitterList(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("certify", output);
		model.addAttribute("pageData", pageData);
		model.addAttribute("cert", cert);
		return new ModelAndView("/admin/admin_injeung_sitter");
		
		//return "admin/admin_injeung_sitter";
	}
	

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String login(Model model) {

		return "admin/admin_login";
	}
	
	@RequestMapping(value = "/admin/admin_login_ok", method = RequestMethod.POST)
	public ModelAndView login_ok(Model model, HttpServletRequest request,
			@RequestParam(value = "adminid") String adminid,
			@RequestParam(value = "adminpw") String adminpw) {
		// session 객체 만들기
		HttpSession session = request.getSession();
		Admin_info admininfo = new Admin_info();
		admininfo.setAdminid(adminid);
		admininfo.setAdminpw(adminpw);
		
		//조회 결과
		Admin_info login = new Admin_info();
		
		try {
			login = adminService.getAdminLogin(admininfo);
			
			if (login != null) {
				// 조회된 데이터가 널이 아니라면 로그인 성공
				//session.setAttribute("islogin", output);
				session.setAttribute("isAdminLogin", true); // 로그인 여부 세션
				session.setAttribute("adminID", login.getAdminid()); // 로그인한 회원 id 세션
				session.setAttribute("Adminlogin", login);
		
			}
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		//return new ModelAndView("admin/admin_member");
		return webHelper.redirect("admin_member.do?type=M", null);
	}
	
	
	@RequestMapping(value = "/admin/admin_bbs_write.do", method = RequestMethod.GET)
	public ModelAndView write(Model model) {

		List<Cus_category> output1 = null;
		List<Cus_sub_category> output2 = null;
		
		
		try {
			output1 = adminService.getCategory();
			output2 = adminService.getSubCategory();
		} catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }
		
		//view 처리
		model.addAttribute("category", output1);
		model.addAttribute("subcate", output2);
		return new ModelAndView("admin/admin_bbs_write");
		//return "admin/admin_bbs_write";
	}
	
	@RequestMapping(value = "/admin/write_ok.do", method = RequestMethod.POST)
	public ModelAndView writeOK(Model model,
			@RequestParam(value = "filter_bbs", defaultValue = "0") int cateno,
			@RequestParam(value = "filter_sub_bbs", defaultValue = "0") int subcateno,
			@RequestParam(value = "subject") String subject,
			@RequestParam(value = "content") String content) {
		
		//입력여부 검사
		if(!regexHelper.isValue(subject)) {
			return webHelper.redirect(null, "제목을 입력하세요.");
		}
		if(!regexHelper.isValue(content)) {
			return webHelper.redirect(null, "내용을 작성하세요.");
		}
	
		if (cateno == 0)                       
		{ return webHelper.redirect(null, "카테고리를 선택하세요."); }
        if (subcateno < 0)                        
        { return webHelper.redirect(null, "하위카테고리를 선택하세요."); }
        
        //데이터 저장
        Cus_bbs input = new Cus_bbs();
        input.setCateno(cateno);
        input.setSubcateno(subcateno);
        input.setTitle(subject);
        input.setText(content);
        
        try {
			adminService.addBoard(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
        String url = contextPath+"/admin/admin_bbs.do?cateno="+cateno;
		return webHelper.redirect(url, null);
	}
	
	@RequestMapping(value = "/admin/edit.do", method = RequestMethod.GET)
	public ModelAndView editBoard(Model model,
			@RequestParam(value = "boardnum", defaultValue = "0") int boardnum) {
		if (boardnum == 0) {
            return webHelper.redirect(null, "게시글 번호가 없습니다.");
        }
		
		
		Cus_bbs input = new Cus_bbs();
		input.setBoardnum(boardnum);

		//조회된 객체
		Cus_bbs output = null;
		//드롭박스를 위한 조회 객체
		List<Cus_category> output1 = null;
		List<Cus_sub_category> output2 = null;
		
		try {    
            // 데이터 조회하기
            output = customerService.getCusItem(input);
            //드롭다운을 위한 카테고리 조회
            output1 = adminService.getCategory();
			output2 = adminService.getSubCategory();
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }
		
		 /** 3) View 처리 */
        model.addAttribute("output", output);
        model.addAttribute("category", output1);
		model.addAttribute("subcate", output2);

		return new ModelAndView("admin/admin_bbs_edit");
	
	}
	
	@RequestMapping(value = "/admin/edit_ok.do", method = RequestMethod.POST)
	public ModelAndView editOK(Model model,
			@RequestParam(value = "boardno") int boardno,
			@RequestParam(value = "filter_bbs", defaultValue = "0") int cateno,
			@RequestParam(value = "filter_sub_bbs", defaultValue = "0") int subcateno,
			@RequestParam(value = "subject") String subject,
			@RequestParam(value = "content") String content) {
		
		//입력여부 검사
		if(!regexHelper.isValue(subject)) {
			return webHelper.redirect(null, "제목을 입력하세요.");
		}
		if(!regexHelper.isValue(content)) {
			return webHelper.redirect(null, "내용을 작성하세요.");
		}
	
		if (cateno == 0)                       
		{ return webHelper.redirect(null, "카테고리를 선택하세요."); }
        if (subcateno < 0)                        
        { return webHelper.redirect(null, "하위카테고리를 선택하세요."); }
        
        //데이터 저장
        Cus_bbs input = new Cus_bbs();
        input.setBoardnum(boardno);
        input.setCateno(cateno);
        input.setSubcateno(subcateno);
        input.setTitle(subject);
        input.setText(content);
        
        try {
			adminService.editBoard(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
        String url = contextPath+"/admin/admin_bbs.do?cateno="+cateno;
		return webHelper.redirect(url, null);
	}
	
	// 테스트 
	/*@RequestMapping(value = "/admin/leave_ok.do", method = RequestMethod.GET)
	public ModelAndView delete_OK(Model model,
			@RequestParam(value = "leav_mem", defaultValue = "0") int leav_mem,
			@RequestParam(value = "filter_bbs", defaultValue = "0") int cateno
		) {
		
		Cus_bbs bbsinput = new Cus_bbs();
		 bbsinput.setCateno(cateno);
		
		if (leav_mem == 0) {
			return webHelper.redirect(null, "삭제될 회원이 없습니다.");
		}
		
		Leave_member input = new Leave_member();
		input.setLeav_mem(leav_mem);
		
		try {
			memberServcie.delete3MonthMember(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
        String url = contextPath+"/admin/admin_bbs.do?cateno="+cateno;
		return webHelper.redirect(url, null);
	}*/
	
	
	
}
