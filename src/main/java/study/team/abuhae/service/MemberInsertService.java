package study.team.abuhae.service;

import study.team.abuhae.model.Connect;
import study.team.abuhae.model.Mom_info;
import study.team.abuhae.model.ResiCert;
import study.team.abuhae.model.Review;
import study.team.abuhae.model.Sitter_info;

/** 대량의 회원 데이터 입력을 제공하기 위한 Service 계층 2021-02-04 하리*/
public interface MemberInsertService {
	/**
	 * 맘 데이터 등록하기 
	 * @param Mom_info 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addMom(Mom_info input) throws Exception;
	
	// 맘 지원자 수 데이터 입력
	public int applyStInsert(Connect input) throws Exception;
	
	/**
	 * 시터 데이터 등록하기
	 * @param Sitter_info 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addSitter(Sitter_info input) throws Exception;

	
	// 시터 후기 데이터 입력
	public int reviewInsert(Review input) throws Exception;
	
	
	// 시터 응답률 데이터 입력
	public int AcceptInsert(Connect input) throws Exception;
	
	// 시터 인증 데이터 입력
	public int ResiInsert(ResiCert input) throws Exception;
	
	public Connect getConnect(Connect input) throws Exception;
}
