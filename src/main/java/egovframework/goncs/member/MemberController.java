package egovframework.goncs.member;

import java.net.URLDecoder;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;

import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.annotation.Resource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.MailException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.fcc.service.EgovNumberUtil;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.utl.sim.service.EgovClntInfo;
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.goncs.RoomRent.service.RoomRentService;
import egovframework.goncs.RoomRent.service.RoomRentVO;
import egovframework.goncs.member.service.LoginVO;
import egovframework.goncs.member.service.McodeService;
import egovframework.goncs.member.service.McodeVO;
import egovframework.goncs.member.service.MemberService;
import egovframework.goncs.member.service.MemberVO;
import egovframework.goncs.member.service.MemlogService;
import egovframework.goncs.member.service.MemlogVO;
import egovframework.goncs.member.service.PagelogService;
import egovframework.goncs.memto.service.MemtoService;
import egovframework.goncs.memto.service.MemtoVO;
import egovframework.goncs.memto.service.MentoComentService;
import egovframework.goncs.memto.service.MentoComentVO;
import egovframework.goncs.memto.service.MtSurveyService;
import egovframework.goncs.memto.service.MtSurveyVO;
import egovframework.goncs.sub04.service.JcounselService;
import egovframework.goncs.sub04.service.JcounselVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class MemberController {
	
	/** MemberService */
	@Resource(name = "memberService")
	private MemberService memberService;
	
	@Resource(name = "egovFileIdGnrService")
	private EgovIdGnrService idgenService;
	
	/** PagelogService */
	@Resource(name = "pagelogService")
	private PagelogService pagelogService;
	
	/** MemlogService */
	@Resource(name = "memlogService")
	private MemlogService memlogService;
	
	@Resource(name = "roomRentService")
    private RoomRentService roomRentService;
	
	/** McodeService */
	@Resource(name = "mcodeService")
	private McodeService mcodeService;
	
	/** MemtoService */
	@Resource(name = "memtoService")
	private MemtoService memtoService;
	
	/** MentoComentService */
	@Resource(name = "mentoComentService")
	private MentoComentService mentoComentService;
	
	/** MtSurveyService */
	@Resource(name = "mtSurveyService")
	private MtSurveyService mtSurveyService;
	
	/** JcounselService */
	@Resource(name = "jcounselService")
	private JcounselService jcounselService;
	
	@Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
	
	
	/** log */
	private static final Logger LOGGER = LoggerFactory.getLogger(MemberController.class);
	
	public static void SendMail(String tomail, String toMsg)throws MailException {
	
		 SimpleEmail email = new SimpleEmail();
		  // setHostName에 실제 메일서버정보
	 
		  email.setCharset("utf-8"); // 한글 인코딩  
	 
		  email.setHostName("mail.cmaru.com"); //SMTP서버 설정
		  email.setAuthentication("gntbsc@cmaru.com", "gntbsc2020!*");
		  try {
			email.addTo(tomail, tomail); // 수신자 추가
		} catch (EmailException e) {
			e.printStackTrace();
		}
		  try {
			email.setFrom("tsc2020@gnto.or.kr", "경남관광기업지원센터"); // 보내는 사람
		} catch (EmailException e) {
			e.printStackTrace();
		}
		  email.setSubject("[경남관광기업지원센터] 임시 비밀번호를 발송했습니다."); // 메일 제목
		  email.setContent(toMsg, "text/plain; charset=utf-8");
		  try {
			email.send();
		} catch (EmailException e) {
			e.printStackTrace();
		}
		  
	} 
	
	public static void SendMail2(String tomail, String toMsg)throws MailException {
		
		class MyAuthentication extends Authenticator {
		    PasswordAuthentication pa;
		    public MyAuthentication(){
		        pa = new PasswordAuthentication("gntbsc@gyeongnam.tourbiz.or.kr", "gntbsc2020!*");  //ex) ID:cafe24@cafe24.com PASSWD:1234
		    }

		    public PasswordAuthentication getPasswordAuthentication() {
		        return pa;
		    }
		}


		String subject = "[경남관광기업지원센터] 임시 비밀번호를 발송했습니다.";                        //subject
		String msgText = toMsg;       //message
		String host = "gyeongnam.tourbiz.or.kr";              //smtp mail server      
		String from = "tsc2020@gnto.or.kr";                  //sender email address
		String to = tomail;                        //receiver email address

		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth",true);
		props.put("mail.smtp.port", 587);

		Authenticator auth = new MyAuthentication();
		Session sess = Session.getInstance(props, auth);

		try {
		        Message msg = new MimeMessage(sess);
		        msg.setFrom(new InternetAddress(from));
		        InternetAddress[] address = {new InternetAddress(to)};
		        msg.setRecipients(Message.RecipientType.TO, address);
		        msg.setSubject(subject);
		        msg.setSentDate(new Date());
		        msg.setText(msgText);

		        Transport.send(msg);
		        System.out.println("^_^");
		        
		} catch (MessagingException mex) {
			
				System.out.println(mex.getMessage()+"<br>");
				System.out.println("-_-;;");
		}
		  
	} 
	
	//회원가입
	@RequestMapping("/member/join.do")
	public String get_member_join(HttpServletRequest request, Model model, Locale locale) throws Exception {

		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
		
		//로그인 되어 있는 경우 메인으로
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (isAuthenticated) {
			return "redirect:/member/mypage.do";
		}		
		
		String userAgent = request.getHeader("user-agent");
		System.out.println(userAgent);
		
		String moible_mode = "false";
		String appbrowser = "N";
		if(userAgent.indexOf("Mobi") > -1) {
			moible_mode = "true";
			if( ( userAgent.indexOf("Mac OS") > 0 && userAgent.indexOf("Safari") <= 0 ) 
					 || ( ( userAgent.indexOf("Android") > 0 && userAgent.indexOf("wv)") > 0 ) ) ) {
				appbrowser = "Y";
			} else {
				appbrowser = "N";
			}
		} else {
			moible_mode = "false";
		}

		model.addAttribute("appbrowser", appbrowser);
		model.addAttribute("moible_mode", moible_mode);

		return "egovframework/gntbsc/member/join_select";
	}
	
	//약관동의
	@RequestMapping("/member/join_agree.do")
	public String get_member_join_agree(HttpServletRequest request, Model model, Locale locale) throws Exception {

		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
		
		//로그인 되어 있는 경우 메인으로
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (isAuthenticated) {
			return "redirect:/member/mypage.do";
		}		
		
		String mem_gbn = EgovStringUtil.clearXSS(request.getParameter("mem_gbn"),"");
		
		String userAgent = request.getHeader("user-agent");
		System.out.println(userAgent);
		
		String moible_mode = "false";
		String appbrowser = "N";
		if(userAgent.indexOf("Mobi") > -1) {
			moible_mode = "true";
			if( ( userAgent.indexOf("Mac OS") > 0 && userAgent.indexOf("Safari") <= 0 ) 
					 || ( ( userAgent.indexOf("Android") > 0 && userAgent.indexOf("wv)") > 0 ) ) ) {
				appbrowser = "Y";
			} else {
				appbrowser = "N";
			}
		} else {
			moible_mode = "false";
		}

		model.addAttribute("appbrowser", appbrowser);
		model.addAttribute("moible_mode", moible_mode);
		model.addAttribute("mem_gbn", mem_gbn);

		return "egovframework/gntbsc/member/join_agree";
	}
	
	//회원 가입 정보 폼 
	@RequestMapping("/member/joinFrm.do")
	public String get_join_wForm(HttpServletRequest request, Model model, Locale locale, RedirectAttributes rttr) throws Exception {

		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
		
		String us_id = "";
		String us_name = "";
		String us_phone = "";
		String us_email = "";
		
		Map<String, ?> redirectMap = RequestContextUtils.getInputFlashMap(request);
		if(redirectMap != null) {
			us_id    = (String)redirectMap.get("us_id");
			us_name  = (String)redirectMap.get("us_name");
			us_phone = (String)redirectMap.get("us_phone");
			us_email = (String)redirectMap.get("us_email");
		}
		
		String mem_gbn = EgovStringUtil.clearXSS(request.getParameter("mem_gbn"),"");
		model.addAttribute("us_gbn", mem_gbn);

		if(mem_gbn.equals("1")) {
			return "egovframework/gntbsc/member/join_form";
		} else if(mem_gbn.equals("2")) {
			return "egovframework/gntbsc/member/join_business_form";
		} else {
			return "egovframework/gntbsc/member/join_mentor_form";
		}
	}	
	
	//회원가입 저장
	@RequestMapping("/member/MemAddAction.do")
	public String save_member_add(@ModelAttribute("MemberVO") MemberVO memvo, HttpServletRequest request, Locale locale, RedirectAttributes rttr) throws Exception {

		String isLocal = "false";
		String requestUrl = new String(request.getRequestURL());
		if (requestUrl.contains("localhost") || requestUrl.contains("127.0.0.1") || requestUrl.contains("1.214.41.148")) {
			isLocal = "true";
		}
		
		memvo.setUs_id(EgovStringUtil.clearXSS(memvo.getUs_id(),""));
		memvo.setUs_name(EgovStringUtil.clearXSS(memvo.getUs_name(),""));
		
		String us_pw = EgovStringUtil.clearXSS(memvo.getUs_pw(),"");
		String enpassword = EgovFileScrty.encryptPassword(us_pw, memvo.getUs_id());
		
		memvo.setUs_pw(enpassword);
		memvo.setUs_phone(EgovStringUtil.clearXSS(memvo.getUs_phone().replaceAll("-", ""),""));
		memvo.setUs_email(EgovStringUtil.clearXSS(memvo.getUs_email(),""));
		memvo.setUs_level(3);
		
		if( (memvo.getUs_smschk() == null) || (memvo.getUs_smschk().equals("")) ) {
			memvo.setUs_smschk("N");
		}
		if( (memvo.getUs_email() == null) || (memvo.getUs_email().equals("")) ) {
			memvo.setUs_email("N");
		}
		if( (memvo.getUs_workchk() == null) || (memvo.getUs_workchk().equals("")) ) {
			memvo.setUs_workchk("N");
		}
		
		rttr.addFlashAttribute("us_id", memvo.getUs_id());
		rttr.addFlashAttribute("us_name", memvo.getUs_name());
		rttr.addFlashAttribute("us_phone", memvo.getUs_phone());
		rttr.addFlashAttribute("us_email", memvo.getUs_email());
		
		//입력 항목 체크
		if(memvo.getUs_id() == null || memvo.getUs_id().equals("")) {
			rttr.addFlashAttribute("resultMsg", "입력하신 ID가 없습니다.다시 가입해 주십시오.");
			return "redirect:/member/joinFrm.do";
		}
		if(memvo.getUs_name() == null || memvo.getUs_name().equals("")) {
			rttr.addFlashAttribute("resultMsg", "입력하신 이름이 없습니다.다시 가입해 주십시오.");
			return "redirect:/member/joinFrm.do";
		}
		
		//중복된 아이디인지 체크
		MemberVO mvo = new MemberVO();
		mvo = memberService.selectMember1(memvo.getUs_id());
		//아이디 중복인 경우 처리
		if(mvo != null) {
			rttr.addFlashAttribute("resultMsg", "이미 가입된 아이디 입니다.");
			return "redirect:/mem/join.do";
		}
		
		//memvo.setUs_position("");
		memvo.setUs_regip(EgovClntInfo.getClntIP(request));
		if(memvo.getUs_gbn().equals("1")) {
			memberService.insertMember(memvo);
		} else if(memvo.getUs_gbn().equals("2")) {
			memberService.insertMember2(memvo);
		} else {
			memberService.insertMember3(memvo);
		}

		//System.out.println("결과 페이지 이동");
		return "redirect:/member/joinResult.do";
	}
	
	//회원 가입 정보 폼 
	@RequestMapping("/member/joinResult.do")
	public String get_join_wResult(HttpServletRequest request, Model model, Locale locale, RedirectAttributes rttr) throws Exception {

		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);

		return "egovframework/gntbsc/member/join_result";
	}
		
	//회원 마이페이지
	@RequestMapping("/member/mypage.do")
	public String get_wmypage(HttpServletRequest request, Model model, Locale locale, RedirectAttributes rttr) throws Exception {

		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
		
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			rttr.addFlashAttribute("resultMsg", "로그인 후 이용이 가능합니다.");		
			return "redirect:/member/login.do";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		int m_level = user.getUs_level();
		model.addAttribute("user", user);
		
		RoomRentVO rrvo = new RoomRentVO();
		rrvo.setUs_id(user.getUs_id());
		List<RoomRentVO> rent_list = roomRentService.selectRoomRentList(rrvo);
		
		model.addAttribute("rent_list", rent_list);

		return "egovframework/gntbsc/member/mypage";
	}	
	
	//일자리 상담신청
	@RequestMapping("/member/myjob.do")
	public String get_wmyjob(HttpServletRequest request, Model model, Locale locale, RedirectAttributes rttr) throws Exception {

		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
		
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			rttr.addFlashAttribute("resultMsg", "로그인 후 이용이 가능합니다.");		
			return "redirect:/member/login.do";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		int m_level = user.getUs_level();
		model.addAttribute("user", user);
		
		JcounselVO jcvo = new JcounselVO();
		jcvo.setUs_id(user.getUs_id());
		List<JcounselVO> job_list = jcounselService.selectJcounselList(jcvo);
		
		model.addAttribute("job_list", job_list);

		return "egovframework/gntbsc/member/jobcounsel";
	}	
	
	//일자리 상담 취소
	@RequestMapping(value = "/member/refuse_myjob.do")
	public ModelAndView refuse_myjob(HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			modelAndView.addObject("result", "N");
			
		} else {
			
			LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
			
			String idx = EgovStringUtil.clearXSS(request.getParameter("idx"),"");
			
			String userIp = EgovClntInfo.getClntIP(request);
			
			JcounselVO jcvo = new JcounselVO();
			jcvo.setIdx(Integer.parseInt(idx));
			jcvo.setStatus("3");
			jcvo.setSys_id(userIp);
			jcvo.setSys_id(user.getUs_id());
			jcvo.setRefuse_txt("신청자 취소");
			jcounselService.changeJcounsel_info(jcvo);
			
			modelAndView.addObject("result", "Y");
			
			//사용자 로그 저장
	        //String userIp = EgovClntInfo.getClntIP(request);
			MemlogVO memlogvo = new MemlogVO();
			memlogvo.setGubunx("일자리 상담신청 취소 처리");
			memlogvo.setSubject("작업자:"+user.getUs_name() + " ID: " + user.getUs_id());
			memlogvo.setM_id(user.getUs_id());
			memlogvo.setCom_ip(userIp);
			memlogService.insertMemlog(memlogvo);
	        /////로그 저장 완료
		}
		
		return modelAndView;
	}
	
	//기업상담신청
	@RequestMapping("/member/mentor_list.do")
	public String get_wmymemto_list(@ModelAttribute("searchVO") MemtoVO searchVO, HttpServletRequest request, Model model, Locale locale, RedirectAttributes rttr) throws Exception {

		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
		
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			rttr.addFlashAttribute("resultMsg", "로그인 후 이용이 가능합니다.");		
			return "redirect:/member/login.do";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		int m_level = user.getUs_level();
		model.addAttribute("user", user);
		
		searchVO.setMemto(user.getUs_id());
		searchVO.setPageUnit(propertyService.getInt("pageUnit"));
		searchVO.setPageSize(propertyService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
    	paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
    	paginationInfo.setRecordCountPerPage(20);
    	paginationInfo.setPageSize(searchVO.getPageSize());

    	searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
    	searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
    	searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
    	LOGGER.debug("recordCountPerPage : " + paginationInfo.getRecordCountPerPage());
		
    	int totCnt = 0;
		List<MemtoVO> memto_list = memtoService.selectMemtoList(searchVO);
		totCnt = memtoService.selectMemtoListCnt(searchVO);
		
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("memto_list", memto_list);
		model.addAttribute("totCnt", totCnt);
		
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        MemberVO mvo = new MemberVO();
		mvo.setUs_id(user.getUs_id());
		mvo = memberService.selectMember_mento(user.getUs_id());
		model.addAttribute("mvo", mvo);
		

		return "egovframework/gntbsc/member/mentor_list";
	}
	
	//기업상담 상세보기
	@RequestMapping(value = "/member/mentor_view.do")
	public String get_wmymemto_view(@ModelAttribute("searchVO") MemtoVO searchVO, HttpServletRequest request, ModelMap model, Locale locale, RedirectAttributes rttr) throws Exception{
		
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			rttr.addFlashAttribute("resultMsg", "로그인 후 이용이 가능합니다.");		
			rttr.addFlashAttribute("go_url", "memtow");		
			return "redirect:/member/login.do";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		int m_level = user.getUs_level();
		model.addAttribute("user", user);
		
		if(user.getUs_gbn().equals("3")) {
			searchVO.setUs_id(user.getUs_id());
		} else {
			rttr.addFlashAttribute("resultMsg", "멘토회원만 접속이 가능합니다.");		
			return "redirect:/main/main.do";
		}
		
		int idx = searchVO.getIdx();
		MemtoVO memto_result = new MemtoVO();
		LOGGER.debug("idx : " + idx);
		
		memtoService.changeMemto_hit(idx);
		
		memto_result = memtoService.selectMemto(idx);
		
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("memto_result", memto_result);
		
		//댓글
		String counsel_idx = Integer.toString(idx);
		MentoComentVO mcvo = new MentoComentVO();
		mcvo.setCounsel_idx(counsel_idx);
		
		List<MentoComentVO> coment_list = mentoComentService.selectMentoComentList(counsel_idx);
		int cmtCnt = mentoComentService.selectMentoComentListCnt(counsel_idx);
		
		model.addAttribute("coment_list", coment_list);
		model.addAttribute("cmtCnt", cmtCnt);
		
		//리뷰
		MtSurveyVO msvo = new MtSurveyVO();
		msvo = mtSurveyService.selectMtSurvey2(counsel_idx);
		model.addAttribute("msvo", msvo);
				
		return "egovframework/gntbsc/member/mentor_view";
	}
	
	//회원정보 수정
	@RequestMapping("/member/edit.do")
	public String get_wedit(HttpServletRequest request, Model model, Locale locale, RedirectAttributes rttr) throws Exception {

		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
		
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			rttr.addFlashAttribute("resultMsg", "로그인 후 이용이 가능합니다.");		
			return "redirect:/member/login.do";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		int m_level = user.getUs_level();
		model.addAttribute("user", user);
		
		MemberVO memvo = new MemberVO();
		memvo = memberService.selectMember1(user.getUs_id());
		
		model.addAttribute("memvo", memvo);

		if(memvo.getUs_gbn().equals("1")) {
			return "egovframework/gntbsc/member/edit";
		} else if(memvo.getUs_gbn().equals("2")) {
			return "egovframework/gntbsc/member/edit2";
		} else {
			
			List<McodeVO> min_list1 = mcodeService.selectMcodeList(Integer.parseInt(memvo.getUs_major11()));
			
			List<McodeVO> min_list2 = mcodeService.selectMcodeList(Integer.parseInt(memvo.getUs_major21()));
			
			model.addAttribute("min_list1", min_list1);
			model.addAttribute("min_list2", min_list2);
			
			return "egovframework/gntbsc/member/edit3";
		}
	}	
	
	@RequestMapping(value = "/member/edit_Updt.do")
	public String save_wedit(@ModelAttribute("MemberVO") MemberVO memvo, HttpServletRequest request, Locale locale, RedirectAttributes rttr) throws Exception {
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			rttr.addFlashAttribute("resultMsg", "로그인 후 이용이 가능합니다.");		
			return "redirect:/member/login.do";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String us_id = user.getUs_id();
		
		memvo.setUs_id(us_id);
		memvo.setUs_id(EgovStringUtil.clearXSS(memvo.getUs_id(),""));
		memvo.setUs_name(EgovStringUtil.clearXSS(memvo.getUs_name(),""));
		
		if(!request.getParameter("us_pw").equals("")) {
			String us_pw = EgovStringUtil.clearXSS(memvo.getUs_pw(),"");
			String enpassword = EgovFileScrty.encryptPassword(us_pw, memvo.getUs_id());
		
			memvo.setUs_pw(enpassword);
		}
		memvo.setUs_phone(EgovStringUtil.clearXSS(memvo.getUs_phone().replaceAll("-", ""),""));
		memvo.setUs_email(EgovStringUtil.clearXSS(memvo.getUs_email(),""));
		memvo.setUs_level(3);
		
		if( (memvo.getUs_smschk() == null) || (memvo.getUs_smschk().equals("")) ) {
			memvo.setUs_smschk("N");
		}
		if( (memvo.getUs_email() == null) || (memvo.getUs_email().equals("")) ) {
			memvo.setUs_email("N");
		}
		if( (memvo.getUs_workchk() == null) || (memvo.getUs_workchk().equals("")) ) {
			memvo.setUs_workchk("N");
		}
		
		//입력 항목 체크
		if(memvo.getUs_id() == null || memvo.getUs_id().equals("")) {
			rttr.addFlashAttribute("resultMsg", "로그인 후 이용이 가능합니다.");		
			return "redirect:/member/login.do";
		}
		if(memvo.getUs_name() == null || memvo.getUs_name().equals("")) {
			rttr.addFlashAttribute("resultMsg", "이름을 확인해 주세요");
			return "redirect:/member/joinFrm.do";
		}
		
		//memvo.setUs_position("");
		memvo.setUs_modip(EgovClntInfo.getClntIP(request));
		
		if(memvo.getUs_gbn().equals("1")) {
			memberService.updateMember(memvo);
		} else if(memvo.getUs_gbn().equals("2")) {
			memberService.updateMember2(memvo);
		} else {
			memberService.updateMember3(memvo);
		}
		
		//사용자 로그 저장
        String userIp = EgovClntInfo.getClntIP(request);
		MemlogVO memlogvo = new MemlogVO();
		memlogvo.setGubunx("회원정보 수정");
		memlogvo.setSubject("작업자:"+user.getUs_name() + " ID: " + user.getUs_id());
		memlogvo.setM_id(user.getUs_id());
		memlogvo.setCom_ip(userIp);
		memlogService.insertMemlog(memlogvo);
        /////로그 저장 완료

		//System.out.println("결과 페이지 이동");
		rttr.addFlashAttribute("resultMsg", "회원정보가 정상 수정되었습니다.");
		return "redirect:/member/edit.do";
				
	}
	
	//회원탈퇴
	@RequestMapping("/member/out.do")
	public String get_wout(HttpServletRequest request, Model model, Locale locale, RedirectAttributes rttr) throws Exception {

		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
		
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			rttr.addFlashAttribute("resultMsg", "로그인 후 이용이 가능합니다.");		
			return "redirect:/member/login.do";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		int m_level = user.getUs_level();
		model.addAttribute("user", user);
		
		return "egovframework/gntbsc/member/out";
	}	
	
	//탈퇴처리
	@RequestMapping("/member/mem_Withdraw.do")
	public String withdrawMber(HttpServletRequest request, Locale locale, ModelMap model, RedirectAttributes rttr) throws Exception {
		
		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			rttr.addFlashAttribute("resultMsg", "로그인 후 이용이 가능합니다.");		
			return "redirect:/member/login.do";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String us_id = user.getUs_id();	
		
		memberService.deleteMember(us_id);
		
		request.getSession().setAttribute("loginVO", null);

		rttr.addFlashAttribute("resultMsg", "회원탈퇴가 정상 처리되었습니다. 감사합니다.");
		return "redirect:/main/main.do";
	}
	
	//아이디 중복 확인
	@RequestMapping(value = "/mem/checkIdDupAjax.do")
	public ModelAndView dbcheckIdDplct(@RequestParam("userId") String checkId) throws Exception {

		checkId = URLDecoder.decode(checkId,"utf-8");
		checkId = EgovStringUtil.clearXSS(checkId, "");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		

		if (checkId == null || checkId.equals("")) {
			
			modelAndView.addObject("resultMessage", "N");
			
		} else {
			MemberVO mvo = new MemberVO();
			mvo = memberService.selectMember1(checkId);
			
			if(mvo == null) {
				modelAndView.addObject("resultMessage", "Y");
			} else {
				modelAndView.addObject("resultMessage", "N");
			}
		}
		
		return modelAndView;
	}
	
	//아이디 찾기
	@RequestMapping(value = "/member/search_id.do")
	public ModelAndView get_search_id(HttpServletRequest request) throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		String name = EgovStringUtil.clearXSS(request.getParameter("name"),"");
		String email = EgovStringUtil.clearXSS(request.getParameter("email"),"");
		String phone = EgovStringUtil.clearXSS(request.getParameter("phone"),"");

		String resultMsg = "";
		Map<String, ?> redirectMap = RequestContextUtils.getInputFlashMap(request);
		if(redirectMap != null) {
			resultMsg = (String)redirectMap.get("resultMsg");
		}
		
		MemberVO memVO = new MemberVO();
		MemberVO mmvo  = new MemberVO();
		memVO.setUs_name(name);
		memVO.setUs_email(email);
		memVO.setUs_phone(phone.replaceAll("-", ""));
		mmvo = memberService.searchId(memVO);
		
		if( (mmvo != null) && (!mmvo.getUs_id().equals("")) ) {
			resultMsg = mmvo.getUs_id();
			
			System.out.println("resultMsg : " + mmvo.getUs_id());
			
		} else {
			resultMsg = "N";
			
			System.out.println("resultMsg : N");
		}
		
		
		modelAndView.addObject("resultMsg", resultMsg);
		
		return modelAndView;
	}
	
	//비말번호 찾기
	@RequestMapping(value = "/member/search_idpw.do")
	public ModelAndView get_search_idpw(HttpServletRequest request) throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		String name = EgovStringUtil.clearXSS(request.getParameter("name"),"");
		String email = EgovStringUtil.clearXSS(request.getParameter("email"),"");
		String m_id = EgovStringUtil.clearXSS(request.getParameter("m_id"),"");

		String resultMsg = "";
		Map<String, ?> redirectMap = RequestContextUtils.getInputFlashMap(request);
		if(redirectMap != null) {
			resultMsg = (String)redirectMap.get("resultMsg");
		}
		
		MemberVO memVO = new MemberVO();
		MemberVO mmvo  = new MemberVO();
		memVO.setUs_name(name);
		memVO.setUs_email(email);
		memVO.setUs_id(m_id);
		mmvo = memberService.searchPassword(memVO);
		
		if(mmvo != null) {
			
			String NEWPASSWORD = "";
			
			for (int i = 0; i <6; i++) {
				NEWPASSWORD += EgovNumberUtil.getRandomNum(0,9);
			}
			System.out.println("임시비번 발행할 아이디 : " + m_id);
			System.out.println("생성한 임시 비밀번호 : " + NEWPASSWORD);
			
			String enpassword = EgovFileScrty.encryptPassword(NEWPASSWORD, m_id);
			
			memVO.setUs_newpw(enpassword);
			
			memberService.updatePassword(memVO);
			
			//메일 발송
			if(mmvo.getUs_mailchk().equals("Y")) {
			    
				SendMail( email, "고객님의 임시 비밀번호는 " + NEWPASSWORD + " 입니다.");
			}
			System.out.println("resultMsg : " + mmvo.getUs_id());
			
			resultMsg = "Y";
		} else {
			resultMsg = "N";

			System.out.println("resultMsg : N");
		}
		
		modelAndView.addObject("resultMsg", resultMsg);
		
		return modelAndView;
	}
	
	//멘토 전문분야 정리
	@RequestMapping(value = "/member/selectMajorCodeAjax.do")
	public ModelAndView select_MajorCodeAjax(@RequestParam("maxcod") int maxcod) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		List<McodeVO> min_lists = mcodeService.selectMcodeList(maxcod);
		
		String optionlist = "<option value='0'>소분류선택</option>";
		
		Iterator<McodeVO> iter = min_lists.iterator();
		while (iter.hasNext()) {
			McodeVO vo = (McodeVO)iter.next();
			
			String code 	= vo.getCode();
			String cd_name 	= vo.getCd_name();
					
			optionlist = optionlist + "<option value='"+code+"'>"+cd_name+"</option>";
		}
		
		modelAndView.addObject("optionlist", optionlist);
			
		return modelAndView;
	}
	
	//멘토 리스트
	@RequestMapping(value = "/member/selectMemtoCodeAjax.do")
	public ModelAndView select_MemtoCodeAjax(@RequestParam("us_major11") String us_major11, @RequestParam("us_major12") String us_major12) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		MemberVO mvo = new MemberVO();
		mvo.setUs_major11(us_major11);
		mvo.setUs_major12(us_major12);
		mvo.setUs_gbn("3");
		mvo.setUs_mentoyn("Y");
		List<MemberVO> memto_lists = memberService.selectMemberListXls(mvo);
		
		String optionlist = "<option value='0'>희망멘토없음</option>";
		
		Iterator<MemberVO> iter = memto_lists.iterator();
		while (iter.hasNext()) {
			MemberVO vo = (MemberVO)iter.next();
			
			String us_id 	= vo.getUs_id();
			String us_name 	= vo.getUs_name();
					
			optionlist = optionlist + "<option value='"+us_id+"'>"+us_name+"</option>";
		}
		
		modelAndView.addObject("optionlist", optionlist);
			
		return modelAndView;
	}
	
	//멘토 찾기
	@RequestMapping(value = "/member/selectsMentoAjax.do")
	public ModelAndView select_sMentoAjax(@RequestParam("major1") String major1, @RequestParam("major2") String major2, @RequestParam("search_type") String search_type, @RequestParam("search_text") String search_text) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		System.out.println("멘토 단계1");
		
		MemberVO mvo = new MemberVO();
		mvo.setUs_major11(major1);
		mvo.setUs_major12(major2);
		mvo.setUs_gbn("3");
		mvo.setSearchCnd(Integer.parseInt(search_type));
		mvo.setSearchWrd(search_text);
		List<MemberVO> memto_lists = memberService.selectMemberListm2(mvo);
		System.out.println("멘토 단계2");
		
		String optionlist = "";
		
		int i=0;
		Iterator<MemberVO> iter = memto_lists.iterator();
		while (iter.hasNext()) {
			MemberVO vo = (MemberVO)iter.next();
			i++;
			optionlist = optionlist + "<tr><td><input type=\"radio\" id=\"menidx_"+i+"\" name=\"menidx\" value=\""+vo.getUs_id()+"|"+vo.getUs_name()+"|"+vo.getUs_phone()+"\" ></td><td>"+i+"</td><td onclick=\"select_mento()\">";
			optionlist = optionlist + vo.getUs_id()+"</td><td onclick=\"select_mento()\">"+vo.getUs_name()+"</td><td>"+vo.getUs_major11_nm();
			if(!vo.getUs_major21().equals("")) {
				optionlist = optionlist + "," + vo.getUs_major21_nm();
			}
			optionlist = optionlist + "</td><td>"+vo.getUs_major12_nm();
			if(vo.getUs_major12_nm().equals("기타")) {
				optionlist = optionlist + "[" + vo.getUs_major1_etc()+"]";
			}
			if(!vo.getUs_major22().equals("")) {
				optionlist = optionlist + "," + vo.getUs_major22_nm();
			}
			if(vo.getUs_major22_nm().equals("기타")) {
				optionlist = optionlist + "[" + vo.getUs_major2_etc()+"]";
			}
			optionlist = optionlist + "</td><td>"+vo.getCam_cnt()+"</td><td>"+vo.getPap_cnt()+"</td><td>"+vo.getMento_cnt();
			float av_point = Math.round(vo.getAvg_point() * 100) / 100;
			optionlist = optionlist + "</td><td>"+av_point+"</td></tr>";
		}
		
		modelAndView.addObject("optionlist", optionlist);
			
		return modelAndView;
	}

}
