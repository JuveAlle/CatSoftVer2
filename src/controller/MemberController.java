package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import domain.Member;
import service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService service;
	
	//중복확인
	@RequestMapping("/check.do")
	@ResponseBody
	public boolean findMember(String id) {
		System.out.println("넘어오는지 알고 싶어요");
		Member member = service.findMember(id);
		if(member.getId().equals(id)) {
			return false;
		}
		System.out.println("아이디 찾아지는지" + member.getId());
		return false;
		
	}
	
	//회원가입
	@RequestMapping("/regist.do")
	public ModelAndView memberRegist(Member member) {
		return null;
		
	}
	// 로그인
	@RequestMapping("login.do")
	public String memberLogin(String id, String password, HttpSession session) {
		// 로그인 성공시 - index로 요청 보내기
		Member member = service.findMember(id);
		if(member.getPassword().equals(password)) {
			System.out.println("여기 까지 인지 알아보자");
			session.setAttribute("id", id);
			return "redirect: successLogin.do";
		}
		// 로그인 실패시
		return "redirect:/views/login.jsp";
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
