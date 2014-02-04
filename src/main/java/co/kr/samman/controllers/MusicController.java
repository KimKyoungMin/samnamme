package co.kr.samman.controllers;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.samman.dao.MusicDao;
import co.kr.samman.dto.musict;
import co.kr.samman.dto.mymusict;

@Controller
public class MusicController {
	
	@Autowired
	private SqlSession sqlSession;
	
	//음악  목록 페이지
		@RequestMapping("musicmain.user")
		public String music(Model model) {
			MusicDao musicDao = sqlSession.getMapper(MusicDao.class);
			
			List<musict> musicList = musicDao.getMusiclists();
			model.addAttribute("musicList", musicList);
			
			return "music.musicmain";
		}
		
		//음악 다운로드
		@RequestMapping("download.htm")
		public void download(String p, String f, int minfonum, HttpServletRequest req, HttpServletResponse res) throws IOException{
			System.out.println(f); //한글파일명 깨짐
			//String fname = new String(f.getBytes("ISO8859_1"), "UTF-8");
			//System.out.println(fname); //한글파일명 깨짐 해결
			
			res.setHeader("Content-Disposition", "attachment;filename="+new String(f.getBytes(),"ISO8859_1"));
			
			//파일 실 경로에서 읽어와서 써준다
			String fullpath = req.getRealPath(p+"/"+f);
			//System.out.println(fullpath);
			FileInputStream fin = new FileInputStream(fullpath);
			ServletOutputStream sout = res.getOutputStream();
			
			byte[] buf = new byte[1024];
			int size = 0;
			while((size=fin.read(buf,0,buf.length))!=-1){
				sout.write(buf,0,size);
			}
			fin.close();
			sout.close();
			
			//mdlist 에 추가
			MusicDao musicDao = sqlSession.getMapper(MusicDao.class);
			UserDetails user =   
				       (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			
			musicDao.mydownlist(user.getUsername(),minfonum);
			 
	
		}
		
		//mymusict DB에 음악 넣기
		@RequestMapping("myplayerlist.htm")
		public String mpl(HttpServletRequest req){
			String [] checked = req.getParameterValues("check[]");
			   for(int i=0; i<checked.length; i++){
			       //System.out.println(checked[i]); //리스트에 넣을 minfonum
			       MusicDao musicDao = sqlSession.getMapper(MusicDao.class);
			       UserDetails user =   
					       (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
					mymusict m = new mymusict();
					//System.out.println(user.getUsername()); //로그인하고 있는 username
					m.setUserid(user.getUsername());
					m.setMinfonum(Integer.parseInt(checked[i]));
			       musicDao.myplayerlist(m);
			   }
			   
			return "redirect:musicmain.user";
		}
		
		//MyPlayerList 곡 select 
		@RequestMapping("mylist.user")
		public String mylistSelect(Model model){
			MusicDao musicDao = sqlSession.getMapper(MusicDao.class);
			UserDetails user = 
					(UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();            
			System.out.println(user.getUsername());

			List<mymusict> mylists = musicDao.getmylist(user.getUsername());
			model.addAttribute("mylists", mylists);
			
			return "music.mylistpage";
		}
		
		//musict 음악 삭제
		@RequestMapping("musicDelete.htm")
		public String musicDel(HttpServletRequest req){
			System.out.println("delete controller");
			String [] checked = req.getParameterValues("check[]");
			for(int i=0; i<checked.length; i++){
				//System.out.println(checked[i]);
				MusicDao musicDao = sqlSession.getMapper(MusicDao.class);
				musicDao.musicDel(Integer.parseInt(checked[i]));			
			}
			return "redirect:musicmain.user";
		}
		
		//음악 플레이어 
		@RequestMapping("playermv.htm")
		public String playermove(String mfilename, Model model) throws FileNotFoundException{
			System.out.println(mfilename);
            model.addAttribute("mfilename", mfilename);
            
			//return "inc.header?mfilename=aaaaa";
			//return "main.main?mfilename=aaa";
			return "music.test";
		}

}
