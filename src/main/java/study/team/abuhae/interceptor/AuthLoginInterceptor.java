package study.team.abuhae.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import study.team.abuhae.model.Member;
import study.team.abuhae.model.Mom_info;

@Slf4j
public class AuthLoginInterceptor implements HandlerInterceptor {
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@Override
	//컨트롤러보다 먼저 수행되는 메서드
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//session 객체 가져오기
	 	HttpSession session = request.getSession();
	 	//login 처리 담당하는 사용자 정보
	 	//Object obj = session.getAttribute("login");
	 	Member member = (Member) session.getAttribute("login");
	 	//String LoginID = (String) session.getAttribute("loginID"); //login id 세션
	 	//String loginType = (String) session.getAttribute("loginType"); //login 회원의 타입
	 	//String loginMemberno = (String) session.getAttribute("loginNum"); //login한 회원의 번호

	 	
	 	
	 	if ( member == null ){
            // 로그인이 안되어 있는 상태임으로 로그인 폼으로 다시 돌려보냄(redirect)
            response.sendRedirect(contextPath+"/login/login.do");
            return false; // 더이상 컨트롤러 요청으로 가지 않도록 false로 반환함
        }
	 	
	 	log.debug("login한 memberno:"+member.getMemberno());
	 	
		return true;
	}
	
	private boolean isAjaxRequest(HttpServletRequest req) {
        String header = req.getHeader("AJAX");
        if ("true".equals(header)){
         return true;
        }else{
         return false;
        }
    }


	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}

}
