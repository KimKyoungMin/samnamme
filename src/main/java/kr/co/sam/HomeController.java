package kr.co.sam;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping(value = "home.htm", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		
		return "NewFile";
	}
	
	@RequestMapping(value = "login.htm", method = RequestMethod.GET)
	public String login(Model model){
		return "loginForm";
	}
	
	@RequestMapping(value = "join.htm", method = RequestMethod.GET)
	public String join(Model model){
		return "joinForm";
	}
}
