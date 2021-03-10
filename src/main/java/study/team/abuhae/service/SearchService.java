package study.team.abuhae.service;

import java.util.List;

import javax.annotation.PostConstruct;

import study.team.abuhae.model.Connect;
import study.team.abuhae.model.Heart;
import study.team.abuhae.model.Mom_info;
import study.team.abuhae.model.Sitter_info;

public interface SearchService {
	// 맘시터 찾기 카드 출력
	public List<Sitter_info> searchSitter(Sitter_info input) throws Exception;
	
	// 일자리 찾기 카드 출력
	public List<Mom_info> searchMom(Mom_info input) throws Exception;
	
	// 맘시터 찾기 총 카드 수
	public int getSitterCount(Sitter_info input) throws Exception;
	
	// 일자리 찾기 총 카드 수
	public int getMomCount(Mom_info input) throws Exception;
	
	// 찜하기
	public int addHeart(Heart input) throws Exception;
	
	// 찜하기 취소
	public int deleteHeart(Heart input) throws Exception;
	
	// 찜 여부 조회(찜 버튼용)
	public int findHeart(Heart input) throws Exception;

	
}
