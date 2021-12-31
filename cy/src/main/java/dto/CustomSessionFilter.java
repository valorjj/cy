package dto;

import java.io.IOException;
import java.nio.file.AccessDeniedException;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CustomSessionFilter implements Filter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {

		String ajaxHeader = "X-Requested-With";
		String ajaxHeaderValue = "XMLHttpRequest";

		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;

		String currentURI = request.getRequestURI();
		String redirectURI = "/login.jsp";

		Pattern pattern = Pattern.compile(".+\\.(css|js|jpg|png|ico)(\\?.*)?");

		boolean isAjaxRequest = request.getHeader(ajaxHeader) != null
				&& request.getHeader(ajaxHeader).equals(ajaxHeaderValue);
		boolean currentRequestIsStaticResource = pattern.matcher(currentURI).matches();
		boolean ajaxExcuteFilter = (currentURI.contains(".do") && !currentURI.contains("/act_login.do")
				&& !currentURI.contains("/act_logout.do"));
		boolean generalExcuteFilter = currentURI.contains(".jsp") && !currentURI.contains("login.jsp");

		if (isAjaxRequest) {
			String headerStr = request.getHeader("Access-Control-Request-Headers");
			if (!currentRequestIsStaticResource && ajaxExcuteFilter) {
				HttpSession session = request.getSession();
				if (session == null || session.getAttribute("getUserInfo") == null) {
					try {
						throw new AccessDeniedException("");
					} catch (AccessDeniedException e) {
						response.sendError(HttpServletResponse.SC_FORBIDDEN);
					}
				}
			}
		} else {
			if (!currentRequestIsStaticResource && generalExcuteFilter) {
				HttpSession session = request.getSession();
				if (session == null || session.getAttribute("getUserInfo") == null) {
					response.sendRedirect(redirectURI);
					return;
				}
			}
		}

		chain.doFilter(request, response);
	}
}


