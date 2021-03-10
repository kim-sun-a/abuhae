package study.team.abuhae.controllers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import study.team.abuhae.helper.WebHelper;
import study.team.abuhae.model.Coupon;
import study.team.abuhae.model.Cus_bbs;
import study.team.abuhae.model.Leave_member;
import study.team.abuhae.model.Mom_info;
import study.team.abuhae.model.ResiCert;
import study.team.abuhae.model.Sitter_info;
import study.team.abuhae.service.AdminService;
import study.team.abuhae.service.CustomerService;
import study.team.abuhae.service.MemberService;
import study.team.abuhae.service.UploadService;

@RestController
public class AdminRestController {
	@Autowired
	WebHelper webHelper;
	@Autowired
	AdminService adminService;
	@Autowired
	CustomerService customerService;
	@Autowired
	MemberService memberService;
	@Autowired
	UploadService uploadService;
	
	@RequestMapping(value = "admin/jobopening_update", method = RequestMethod.POST)
	public Map<String, Object> admin_jobopening_put(Model model,
			@RequestParam(value = "memberno") int memberno) {

		Mom_info input = new Mom_info();
		input.setMemberno(memberno);
		
		try {
			//jobopeing 수정
			adminService.updateReportMember(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		return webHelper.getJsonData();
	}
	
	@RequestMapping(value = "admin/deletemember", method = RequestMethod.POST)
	public Map<String, Object> admin_leavemember_delete(Model model,
			@RequestParam(value = "id") String id) {

		Leave_member input = new Leave_member();
		input.setId(id);
		
		Mom_info output = null;
		
		try {
			//회원 아이디에 대한 memberno 조회
			output = (Mom_info) memberService.getMemberItem(input);
			adminService.deleteLeaveMember(output);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		return webHelper.getJsonData();
	}
	
	@RequestMapping(value = "admin/insertcoup", method = RequestMethod.POST)
	public Map<String, Object> admin_addcoupon(Model model,
			@RequestParam(value = "memberno") int memberno) {

		Coupon input = new Coupon();
		input.setMemberno(memberno);
		int output = 0;
		
		try {
			output = adminService.getHasCopItem(input);
			if (output > 0) {
				return webHelper.getJsonWarning("aa");
			}
			//쿠폰 발급
			adminService.addCoupon(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		return webHelper.getJsonData();
	}
	
	@RequestMapping(value = "/admin/delete", method = RequestMethod.DELETE)
	public Map<String, Object> delete(Model model,
			@RequestParam(value = "boardnum", defaultValue = "0") int boardno) {
		
		if (boardno == 0)                       
		{ return webHelper.getJsonWarning("삭제할 항목을 클릭해 주세요."); }

        
        //데이터 저장
        Cus_bbs input = new Cus_bbs();
        input.setBoardnum(boardno);

        
        try {
			adminService.deleteBoard(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
        /** 3) 결과를 확인하기 위한 JSON 출력 */
        // 확인할 대상이 삭제된 결과값만 OK로 전달
        return webHelper.getJsonData();
	}
	
	@RequestMapping(value = "/admin/certok", method = RequestMethod.POST)
	public Map<String, Object> certok(Model model,
			@RequestParam(value = "sitterno", defaultValue = "0") int sitterno) {
		
		if (sitterno==0) {
			return webHelper.getJsonWarning("인증 승인할 시터를 선택하세요");
		}
		
		ResiCert input = new ResiCert();
		input.setSitterno(sitterno);
		
		Sitter_info input2 = new Sitter_info();
		input2.setSitterno(sitterno);
		
		Sitter_info output = null;
		int output2 = 0;
		
		try {
			
			output2 = uploadService.getCertifyItemCount(input);
			
			if(output2 > 0) {
				return webHelper.getJsonWarning("aa");
			}
			
			uploadService.updateCertOk(input);
			//시터 넘버로 회원 조회
			output = memberService.getSitterMember(input2);
			
			//조회된 멤버 넘버로 쿠폰 발급
			Coupon cpon = new Coupon();
			cpon.setMemberno(output.getMemberno());
			adminService.addCoupon2(cpon);
			
			
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
        /** 3) 결과를 확인하기 위한 JSON 출력 */
        // 확인할 대상이 삭제된 결과값만 OK로 전달
        return webHelper.getJsonData();
	}
	
	
}

