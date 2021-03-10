package study.team.abuhae.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import study.team.abuhae.model.Leave_member;
import study.team.abuhae.model.Member;
import study.team.abuhae.model.Mom_info;
import study.team.abuhae.model.Sitter_info;

public interface MemberService {
	//로그인 하는 회원 조회
	public Member getMemberLogin(Mom_info input) throws Exception;
	
	//회원 탈퇴를 위한 특정 아이디 단일행 조회
	public Member getMemberItem(Leave_member input) throws Exception;
	
	//맘시터 회원 조회
	public Mom_info getMomMember(Mom_info input) throws Exception;
		
	//시터회원 회원 조회
	public Sitter_info getSitterMember(Sitter_info input) throws Exception;
	
	//부모회원 리스트 조회
	public List<Mom_info> getMomList(Mom_info input) throws Exception;
	
	//맘회원 수 조회
	public int getMomCount(Mom_info input) throws Exception;
	
	//부모회원 리스트 조회
	public List<Sitter_info> getSitterList(Sitter_info input) throws Exception;
		
	//시터회원 수 조회
	public int getSitterCount(Sitter_info input) throws Exception;
	
	//회원 데이터 수정
	public int editMember(Member input) throws Exception;
	
	//회원 탈퇴
	public int leaveMember(Member input) throws Exception;
	
	// 3개월 지난 회원 완전 탈퇴 
	public int delete3Month();
	
	// 지난 이용권 업데이트 처리 
	public int updateEnddate();
	
	/**
	 * 맘 데이터 등록하기 
	 * @param Mom_info 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addMom(Mom_info input) throws Exception;
	
	/**
	 * 시터 데이터 등록하기 
	 * @param Sitter_info 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addSitter(Sitter_info input) throws Exception;
	
	/*
	 * id 중복 체크
	 * @param member 저장정보 담는 beans
	 * @return int
	 */
	public int idCheck(Member input) throws Exception;
	
	/*
	 * email 중복 체크
	 * @param member 저장정보 담는 beans
	 * @return int
	 */
	public int emailCheck(Member input) throws Exception;
	
	/*
	 * phone 중복 체크
	 * @param member 저장정보 담는 beans
	 * @return int
	 */
	public int phoneCheck(Member input) throws Exception;
	
	//아이디 찾기
	public Member findId(Member input) throws Exception;
	
	//이메일발송
	public void sendEmail(Mom_info input, String div) throws Exception;

	//비밀번호찾기
	public void findPw(HttpServletResponse resp, Mom_info input) throws Exception;
}
