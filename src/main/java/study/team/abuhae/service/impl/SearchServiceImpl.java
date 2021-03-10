package study.team.abuhae.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.team.abuhae.model.Heart;
import study.team.abuhae.model.Mom_info;
import study.team.abuhae.model.Sitter_info;
import study.team.abuhae.service.SearchService;

@Service
@Slf4j
public class SearchServiceImpl implements SearchService {
	/** for MyBatis Mapper */
	@Autowired
	SqlSession sqlSession;

	/**
	 * @author Hari 맘시터 찾기 페이지 카드 출력을 위한 시터 데이터 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Sitter_info> searchSitter(Sitter_info input) throws Exception {
		List<Sitter_info> result = null;

		try {
			result = sqlSession.selectList("SearchMapper.searchSitter", input);

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

	/**
	 * @author Hari 일자리 찾기 페이지 카드 출력을 위한 맘 데이터 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Mom_info> searchMom(Mom_info input) throws Exception {
		List<Mom_info> result = null;

		try {
			result = sqlSession.selectList("SearchMapper.searchMom", input);

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

	/**
	 * @author Hari 맘시터 찾기 페이지 카드 총 갯수 조회
	 * @param Sitter_info
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getSitterCount(Sitter_info input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("SearchMapper.selectCountAllSitter", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * @author Hari 일자리 찾기 페이지 카드 총 갯수 조회
	 * @param Mom_info
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getMomCount(Mom_info input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("SearchMapper.selectCountAllMom", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int addHeart(Heart input) throws Exception {
		int result = 0;
		
		try {			
			result = sqlSession.insert("SearchMapper.insertHeart", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public int deleteHeart(Heart input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.delete("SearchMapper.deleteHeart", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 찜 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public int findHeart(Heart input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("SearchMapper.findHeart", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 찜 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		}
		
		return result;	
	}
	

}
