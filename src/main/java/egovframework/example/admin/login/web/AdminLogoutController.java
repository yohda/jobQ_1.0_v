package egovframework.example.admin.login.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

@Controller
public class AdminLogoutController {
	private static final Logger logger = LoggerFactory.getLogger(AdminLogoutController.class);
	private static final String LOGIN_URI = "/sample/admin/login";
	
	/*@RequestMapping("/admin/logout")
	public void logout(HttpSession session, HttpServletResponse response) throws Exception{
		session.invalidate();
		
		response.sendRedirect(LOGIN_URI);
	}*/
}
