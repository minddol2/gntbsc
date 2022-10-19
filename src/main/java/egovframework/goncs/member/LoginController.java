package egovframework.goncs.member;

import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.utl.sim.service.EgovClntInfo;
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.goncs.member.service.LoginService;
import egovframework.goncs.member.service.LoginVO;
import egovframework.goncs.member.service.MemberService;
import egovframework.goncs.member.service.MemberVO;

@Controller
public class LoginController {

	/** EgovLoginService */
	@Resource(name = "loginService")
	private LoginService loginService;
	
	@Resource(name = "memberService")
	private MemberService memberService;
	
	/** log */
	private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);
	
	/**
	 * 로그인 화면으로 들어간다
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return 로그인 페이지
	 * @exception Exception
	 */
	@RequestMapping(value = "/wssms/LoginUsr.do")
	public String loginUsrView(HttpServletRequest request, ModelMap model) throws Exception {
		
		String resultMsg = "";
		Map<String, ?> redirectMap = RequestContextUtils.getInputFlashMap(request);
		if(redirectMap != null) {
			resultMsg = (String)redirectMap.get("resultMsg");
		}
		
		model.addAttribute("resultMsg", resultMsg);
		
		return "egovframework/gntbsc/wssms/login";
	}
	
	/**
	 * 일반(세션) 로그인을 처리한다
	 * @param vo - 아이디, 비밀번호가 담긴 LoginVO
	 * @param request - 세션처리를 위한 HttpServletRequest
	 * @return result - 로그인결과(세션정보)
	 * @exception Exception
	 */
	@RequestMapping(value = "/wssms/actionLogin.do")
	public String actionLogin(@RequestParam Map<String, Object> commandMap, HttpServletRequest request, ModelMap model, RedirectAttributes rttr) throws Exception {

		// 접속IP
		String userIp = EgovClntInfo.getClntIP(request);
		//System.out.println("접속아이피:" + userIp);
		String us_id = (String) commandMap.get("us_id");
		String us_pw = (String) commandMap.get("us_pw");
		
		us_id = EgovStringUtil.clearXSS(us_id,"");
		us_pw = EgovStringUtil.clearXSS(us_pw,"");
		String enpassword = EgovFileScrty.encryptPassword(us_pw, us_id);
		
		LoginVO loginVO = new LoginVO();
		loginVO.setUs_id(us_id);
		loginVO.setUs_pw(enpassword);
		
		LoginVO resultVO = loginService.actionLogin(loginVO);
		//System.out.println("로그인디비1");

		if (resultVO != null && resultVO.getUs_id() != null && !resultVO.getUs_id().equals("")) {

			//System.out.println("로그인디비3");
			loginVO.setIdx(resultVO.getIdx());
			
			LOGGER.debug("User Id : {}", resultVO.getUs_id());
			
			//System.out.println("로그인디비3");
			request.getSession().setAttribute("loginVO", resultVO);
			
			return "redirect:/wssms/main.do";

		} else {
			
			rttr.addFlashAttribute("resultMsg", "일치하는 회원정보가 없습니다.");
			
			return "redirect:/wssms/LoginUsr.do";
			
		}
		
	}
	
	
	/**
	 * 로그아웃한다.
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/wssms/actionLogout.do")
	public String actionLogout(HttpServletRequest request, ModelMap model) throws Exception {

		request.getSession().setAttribute("loginVO", null);
		
		//return "redirect:/egovDevIndex.jsp";
		return "redirect:/wssms/main.do";
	}
	
	
	@RequestMapping(value = "/member/login.do")
	public String get_mem_login(HttpServletRequest request, ModelMap model) throws Exception {
		
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (isAuthenticated) {
			return "redirect:/member/mypage.do";
		}
		
		String resultMsg = "";
		String go_url = "";
		Map<String, ?> redirectMap = RequestContextUtils.getInputFlashMap(request);
		if(redirectMap != null) {
			resultMsg = (String)redirectMap.get("resultMsg");
			go_url = (String)redirectMap.get("go_url");
		}
		
		model.addAttribute("resultMsg", resultMsg);
		model.addAttribute("go_url", go_url);
		
		return "egovframework/gntbsc/member/login";
	}
	
	//로그인 처리
	@RequestMapping(value = "/member/actionLogin.do")
	public String go_actionLogin(@RequestParam Map<String, Object> commandMap, HttpServletRequest request, ModelMap model, RedirectAttributes rttr) throws Exception {

		// 접속IP
		String userIp = EgovClntInfo.getClntIP(request);
		//System.out.println("접속아이피:" + userIp);
		String us_id = (String) commandMap.get("m_id");
		String us_pw = (String) commandMap.get("m_pw");
		String go_url = EgovStringUtil.clearXSS(request.getParameter("go_url"),"");
		
		us_id = EgovStringUtil.clearXSS(us_id,"");
		us_pw = EgovStringUtil.clearXSS(us_pw,"");
		String enpassword = EgovFileScrty.encryptPassword(us_pw, us_id);
		
		LoginVO loginVO = new LoginVO();
		loginVO.setUs_id(us_id);
		loginVO.setUs_pw(enpassword);
		
		LoginVO resultVO = loginService.actionLogin(loginVO);
		//System.out.println("로그인디비1");

		if (resultVO != null && resultVO.getUs_id() != null && !resultVO.getUs_id().equals("")) {

			//System.out.println("로그인디비2");
			loginVO.setIdx(resultVO.getIdx());
			
			LOGGER.debug("User Id : {}", resultVO.getUs_id());
			
			//System.out.println("로그인디비3");
			request.getSession().setAttribute("loginVO", resultVO);
			
			if(go_url.equals("rental")) {
				return "redirect:/sub04/rental.do";
			} else if(go_url.equals("memtow")) {
				return "redirect:/sub04/sub01_03.do";
			} else if(go_url.equals("job")) {
				return "redirect:/sub04/job.do";
			} else {
				return "redirect:/main/main.do";
			}

		} else {
			
			rttr.addFlashAttribute("resultMsg", "일치하는 회원정보가 없습니다.");
			
			return "redirect:/member/login.do";
			
		}
		
	}
	
	@RequestMapping(value = "/member/logout.do")
	public String member_logout(HttpServletRequest request, ModelMap model) throws Exception {

		request.getSession().setAttribute("loginVO", null);
		
		//return "redirect:/egovDevIndex.jsp";
		return "redirect:/main/main.do";
	}
	
	
	//아이디 비번 찾기
	@RequestMapping(value = "/member/search.do")
	public String get_search(HttpServletRequest request, ModelMap model) throws Exception {

		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (isAuthenticated) {
			return "redirect:/member/mypage.do";
		}
		
		return "egovframework/gntbsc/member/search";
	}
	
}
