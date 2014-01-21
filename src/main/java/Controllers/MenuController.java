package Controllers;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MenuController {

	@RequestMapping(value = "main.htm", method = RequestMethod.GET)
	public String home() {
		
		return "main";
	}
	
	@RequestMapping(value = "music.htm", method = RequestMethod.GET)
	public String music() {
		return "music/music";
	}
	
	@RequestMapping(value = "video.htm", method = RequestMethod.GET)
	public String video() {
		return "video/video";
	}
	
	@RequestMapping(value = "free.htm", method = RequestMethod.GET)
	public String free() {
		return "board/free";
	}
	
	@RequestMapping(value = "notice.htm", method = RequestMethod.GET)
	public String notice() {
		return "board/notice";
	}
	
	@RequestMapping(value = "concert.htm", method = RequestMethod.GET)
	public String conertdetail() {
		return "concert/concert";
	}
	
	@RequestMapping(value = "setting.htm", method = RequestMethod.GET)
	public String setting() {
		return "setting/admin";
	}
	
	@RequestMapping(value = "account.htm", method = RequestMethod.GET)
	public String account() {
		return "account/usetting";
	}
	
	
	
}
