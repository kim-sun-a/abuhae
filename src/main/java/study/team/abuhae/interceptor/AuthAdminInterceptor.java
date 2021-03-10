package study.team.abuhae.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class AuthAdminInterceptor implements HandlerInterceptor {
	
	@Value("#{servletContext.contextPath}")
	String contextPath;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//session 객체 가져오기
	 	HttpSession session = request.getSession();
	 	//admin의 login 여부 확인하는 여부
	 	Object obj = session.getAttribute("Adminlogin");
	 	
	 	if ( obj == null ){
            // 로그인이 안되어 있는 상태임으로 관리자 메인으로 돌려보냄
            response.sendRedirect(contextPath+"/admin");
            return false; // 더이상 컨트롤러 요청으로 가지 않도록 false로 반환함
        }
	 	
	 	
	 	
		// TODO Auto-generated method stub
		return HandlerInterceptor.super.preHandle(request, response, handler);
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
