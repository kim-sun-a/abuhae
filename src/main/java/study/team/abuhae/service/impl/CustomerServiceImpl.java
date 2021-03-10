package study.team.abuhae.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.team.abuhae.model.Cus_bbs;
import study.team.abuhae.model.Cus_sub_category;
import study.team.abuhae.service.CustomerService;

@Slf4j
@Service
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<Cus_bbs> getCusList(Cus_bbs input) throws Exception {
		List<Cus_bbs> result = null;
		
		try {
			result = sqlSession.selectList("CustomerMapper.selectCusList", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			} 
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public Cus_bbs getCusItem(Cus_bbs input) throws Exception {
		Cus_bbs result = null;
		
		try {
			result = sqlSession.selectOne("CustomerMapper.selectCusItem", input);
			
			if (result==null) {
				throw new NullPointerException("result=null");
			} 
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}

	/** 게시글 갯수 조회 */
	@Override
	public int getCusCount(Cus_bbs input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("CustomerMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	/** 카테고리 목록 조회 */
	@Override
	public List<Cus_sub_category> getCateList(Cus_sub_category input) throws Exception {
		List<Cus_sub_category> result = null;
		
		try {
			result = sqlSession.selectList("CustomerMapper.selectCateItem", input);
			
			if (result==null) {
				throw new NullPointerException("result=null");
			} 
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}
}
