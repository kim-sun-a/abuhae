package study.team.abuhae.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import lombok.extern.slf4j.Slf4j;
import study.team.abuhae.service.MemberService;

@Controller
@Slf4j
public class AbuScheduler {
	
	@Autowired
	MemberService memberService;
	
	// 3개월 지난 회원들 탈퇴 시키기
	public void everyMidnight_Delete() {
		log.debug("매일 자정에 삭제되는 탈퇴멤버 >> " + memberService.delete3Month());
	}
	
	// 지난 이용권 업데이트 
	public void everyMidnight_Update() {
		log.debug("매일 자정에 삭제되는 지난 이용권 >> " + memberService.updateEnddate());
	}
	
}
