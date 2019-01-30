package egovframework.example.admin.login.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.admin.login.domain.UserInfo;

@Controller
@RequestMapping("/admin")
public class AdminLoginController {
	private static final Logger logger = LoggerFactory.getLogger(AdminLoginController.class);
	
	@RequestMapping(value = "/login", method=RequestMethod.GET)
	public String serviceGet(@RequestParam(value = "error", required = false)String error, Model model, @ModelAttribute("login")UserInfo login){
		model.addAttribute("ERROR", error);
		
		return "admin/login/jsp/login";
	}
	
}
