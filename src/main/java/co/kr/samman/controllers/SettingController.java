package co.kr.samman.controllers;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;




import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import co.kr.samman.dao.SettingDao;
import co.kr.samman.dto.musict;
import co.kr.samman.dto.musict_adtable;
import co.kr.samman.dto.usert;

@Controller
public class SettingController {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	//관리자 관리
	
	    //회원 List
		@RequestMapping("ausers.admin")
		public String users(Model model) {
			SettingDao settingDao = sqlSession.getMapper(SettingDao.class);
			List<usert> userList = settingDao.userlists();
			model.addAttribute("userList", userList);
			
			return "setting.ausers";
		}
		
		//음악 등록
		@RequestMapping(value="amusicform.admin", method=RequestMethod.GET)
		public String musicform(){
			return "setting.amusicform";
		}
		
		@RequestMapping(value="amusicform.admin", method=RequestMethod.POST)
		public String musicInsert(musict_adtable ma, HttpServletRequest request, Model model) throws IOException{
			System.out.println("컨트롤 들어옴");
			
			System.out.println(ma.getAid());
			
			//파일 읽어오기 
			ArrayList<MultipartFile> files = ma.getFiles();
			ArrayList<String> filenames = new ArrayList<String>();
			
			for(MultipartFile multipartfile : files){
				String fname = multipartfile.getOriginalFilename();
				String path = request.getRealPath("/upload/"+fname);
				//String path = request.getServletContext().getRealPath("/upload");
			   
				System.out.println(fname);
				System.out.println(path);
			    
			    if(!fname.equals("")){
			    	FileOutputStream fs = new FileOutputStream(path);
			    	fs.write(multipartfile.getBytes());
			    	fs.close();
			    }
			    filenames.add(fname);   
			}
			//System.out.println(filenames.get(0)+"////"+filenames.get(1));
			ma.setMpicname(filenames.get(0));
			ma.setMfilename(filenames.get(1));

     		SettingDao settingDao = sqlSession.getMapper(SettingDao.class);
			settingDao.musicInsert(ma);
			
			return "redirect:musicmain.user";
		}
		
		@RequestMapping(value="acform.admin", method=RequestMethod.GET)
		public String concertform(){	
			return "setting.acform";
		}
		
		@RequestMapping(value="acform.admin", method=RequestMethod.POST)
		public String concertInsert(){
			
			return "redirect:concert.user";
		}
		@RequestMapping(value="aconcertform.admin", method=RequestMethod.GET)
		public String concertinputform(HttpServletRequest req, Model model){
			System.out.println("Concertinput start");
			
			return "setting.aconcertform";
		}
		
		@RequestMapping(value="aconcertform.admin", method=RequestMethod.POST)
		public String concertinputaction(HttpServletRequest req, Model model){
			
			return null;
		}
}
