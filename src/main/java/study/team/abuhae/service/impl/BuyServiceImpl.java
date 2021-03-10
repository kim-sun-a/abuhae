package study.team.abuhae.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.team.abuhae.model.Coupon;
import study.team.abuhae.model.Member;
import study.team.abuhae.service.BuyService;

@Slf4j
@Service
public class BuyServiceImpl implements BuyService {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<Coupon> findCoupon(Coupon input) throws Exception {
		List<Coupon> result = null;
		
		try {
			result = sqlSession.selectList("BuyMapper.FindCoupon", input);
			
			if (result==null) {
				throw new NullPointerException("result=null");
			}
			
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}


	@Override
	public int newBuy(Member input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("BuyMapper.NewBuyMember", input);
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int reBuy(Member input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("BuyMapper.ReBuyMember", input);
			result += sqlSession.delete("BuyMapper.UseCoupon", input);
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}

		return result;
	}

}
