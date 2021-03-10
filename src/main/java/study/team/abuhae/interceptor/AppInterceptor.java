package study.team.abuhae.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import study.team.abuhae.helper.WebHelper;
import study.team.abuhae.model.Member;
import study.team.abuhae.model.Mom_info;
import study.team.abuhae.model.Sitter_info;

@Slf4j
public class AppInterceptor implements HandlerInterceptor {
	@Autowired
    WebHelper webHelper;
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		webHelper.init(request, response);
		//session 객체 가져오기
	 	HttpSession session = request.getSession();
	 	//login 처리 담당하는 사용자 정보
	 	//Object obj = session.getAttribute("login");
	 	Member member = (Member) session.getAttribute("login");

	 	
	 	if(member != null) {
	 		log.debug("현재 로그인한 session: "+member.getMemberno());
	 	} else {
	 		log.debug("현재 로그인한 session: 없음");
	 	}
	 	

		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		//log.debug("AppInterceptor.postHandle");
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		//log.debug("AppInterceptor.afterCompletion");
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}

	
}
