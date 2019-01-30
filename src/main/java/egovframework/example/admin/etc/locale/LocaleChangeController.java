package egovframework.example.admin.etc.locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LocaleChangeController {
	private final Logger logger = org.slf4j.LoggerFactory.getLogger(LocaleChangeController.class);
	
	@RequestMapping(value = "/admin/locale")
	public String changeLocale(@RequestParam("lang")String lang, HttpServletRequest request) throws Exception{
		return "redirect:" + request.getHeader("referer").substring(23);
	}
}
