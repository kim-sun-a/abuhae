package study.team.abuhae.service;

import java.util.List;

import study.team.abuhae.model.Cus_bbs;
import study.team.abuhae.model.Cus_sub_category;

public interface CustomerService {
	
	/** 카테고리 조회 */
	public List<Cus_sub_category> getCateList(Cus_sub_category input) throws Exception;
	
	/** 게시글 목록 조회 */
	public List<Cus_bbs> getCusList(Cus_bbs input) throws Exception;

	/** 게시글 데이터조회 조회 */
	public Cus_bbs getCusItem(Cus_bbs input) throws Exception;
	
	/** 게시글 갯수 조회 */
	public int getCusCount(Cus_bbs input) throws Exception;
}
