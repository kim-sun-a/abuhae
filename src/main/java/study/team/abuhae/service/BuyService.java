package study.team.abuhae.service;

import java.util.List;

import study.team.abuhae.model.Coupon;
import study.team.abuhae.model.Member;

/** 결제 기능을 위한 Service 계층 2021-02-20 하리*/
public interface BuyService {
	
	/**
	 * 쿠폰 조회하기
	 * @param  조회할 정보를 담고 있는 Beans
	 * @return Coupon
	 * @throws Exception
	 */
	public List<Coupon> findCoupon(Coupon input) throws Exception;
	
	/**
	 * 고객 결제 정보 저장하기 
	 * @param member 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int newBuy(Member input) throws Exception;
	
	/**
	 * 고객 재결제 정보 저장하기 
	 * @param member 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int reBuy(Member input) throws Exception;

}
