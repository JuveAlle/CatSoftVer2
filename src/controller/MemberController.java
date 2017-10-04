package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import domain.Member;
import service.MemberService;

@Controller
//@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService service;
	
	//중복확인
	@RequestMapping("/check.do")
	@ResponseBody
	public boolean findMember(String id) {
		System.out.println("넘어오는지 알고 싶어요");
		System.out.println("트루인지 참인지 : "+service.findMember(id));
		if(service.findMember(id)==false) {
			System.out.println("false이므로 중복");
			return false;
		} else {
			System.out.println("true이므로 중복아님");
			return true;
		}
	}
	
	//회원가입
	@RequestMapping("/regist.do")
	public ModelAndView memberRegist(Member member) {
		System.out.println("회원가입성공하면 여기로 와야됨");
		ModelAndView mav = new ModelAndView();
		if(service.createMember(member)==0) {
			mav.setViewName("/index.jsp");
			return mav;
		}else {
			mav.setViewName("/views/join.jsp");
			return mav;
		}
		
	}
	// 로그인
	@RequestMapping("login.do")
	public String memberLogin(String id, String password, HttpSession session, Model md) {
		Member member = service.loginMember(id);
		List <Member> memberList = service.memberList();
		if(member.getPassword().equals(password)) {
			session.setAttribute("id", id);
			md.addAttribute("memberList", memberList);
			return "successLogin.do";
		}
			return "/views/login.jsp";
	}
	// 로그인 성공시 메인으로 넘어가는 페이지
	
	@RequestMapping("/successLogin.do")
	public ModelAndView main(HttpSession session) {
		System.out.println("여기로 오는거 맞지??");
		String id = (String) session.getAttribute("id");
		ModelAndView mav = new ModelAndView();
		mav.addObject("id", id);
		mav.setViewName("/index.jsp");
		return mav;
		
	}
	//로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {

		session.invalidate();

		return "redirect:/index.jsp";
	}
	//회원정보 수정
	
	//회원 탈퇴
	
	
	
	
	
	
}
