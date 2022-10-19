package egovframework.goncs.sub04;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.utl.sim.service.EgovClntInfo;
import egovframework.goncs.RoomRent.service.RoomRentService;
import egovframework.goncs.RoomRent.service.RoomRentVO;
import egovframework.goncs.RoomRent.service.RoomSetService;
import egovframework.goncs.RoomRent.service.RoomSetVO;
import egovframework.goncs.member.service.LoginVO;
import egovframework.goncs.member.service.MemberService;
import egovframework.goncs.member.service.MemberVO;
import egovframework.goncs.member.service.MemlogService;
import egovframework.goncs.member.service.MemlogVO;
import egovframework.goncs.member.service.PageLogVO;
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
public class Sub04Controller {
	
	@Resource(name = "roomSetService")
    private RoomSetService roomSetService;
	
	@Resource(name = "roomRentService")
    private RoomRentService roomRentService;
	
	/** MemberService */
	@Resource(name = "memberService")
	private MemberService memberService;
	
	/** PagelogService */
	@Resource(name = "pagelogService")
	private PagelogService pagelogService;
	
	/** MemlogService */
	@Resource(name = "memlogService")
	private MemlogService memlogService;
	
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
	
	@Resource(name = "egovFileIdGnrService")
	private EgovIdGnrService idgenService;
	
	@Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(Sub04Controller.class);
	
	public String getDateString(Calendar day) {
		String str = "" + day.get(Calendar.YEAR); // 년;

		int thisMonth = day.get(Calendar.MONTH) + 1; // 월 ( 0 ~ 11 )= 0;

		if ( thisMonth < 10 ) {
			str += "0";
		}

		str += "" + thisMonth ;

		int thisDate = day.get(Calendar.DATE) ; // 월 ( 0 ~ 11 )= 0;

		if ( thisDate < 10 ) {
			str += "0";
		}

		str += "" + thisDate ;

		return str;
	}
	
	public int getMonthNum(int month){
		return month + 1 ;
	}
	
	@RequestMapping(value = "/sub04/sub01_01.do")
	public String get_sub04_page_01(ModelMap model, Locale locale) throws Exception{

		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
				
		return "egovframework/gntbsc/sub04/sub01_01";
	}
	
	//멘토단
	@RequestMapping(value = "/sub04/sub01_02.do")
	public String get_sub04_page_01_02(@ModelAttribute("searchVO") MemberVO searchVO, HttpServletRequest request, ModelMap model, Locale locale) throws Exception{

		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
		
    	searchVO.setUs_gbn("3");
    	searchVO.setUs_mentoyn("Y");

    	List<MemberVO> mem_list = memberService.selectMemberList_Mento(searchVO);
    	int totcnt = memberService.selectMemberListCnt(searchVO);
		
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("mem_list", mem_list);
		model.addAttribute("totCnt", totcnt);
		
		return "egovframework/gntbsc/sub04/sub01_02";
	}
	
	@RequestMapping(value = "/sub04/sub01_03.do")
	public String get_sub04_page_01_03(@ModelAttribute("searchVO") MemtoVO searchVO, HttpServletRequest request, ModelMap model, Locale locale, RedirectAttributes rttr) throws Exception{
		
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		model.addAttribute("user", user);
		
		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
		
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
				
		return "egovframework/gntbsc/sub04/sub01_03";
	}
	
	//상담신청
	@RequestMapping(value = "/sub04/sub01_03_write.do")
	public String write_sub04_page_01_03(HttpServletRequest request, ModelMap model, Locale locale, RedirectAttributes rttr) throws Exception{

		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
		
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			rttr.addFlashAttribute("resultMsg", "기업/예비창업자로 가입 후 글 작성이 가능합니다.");		
			rttr.addFlashAttribute("go_url", "memtow");		
			return "redirect:/member/login.do";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		int m_level = user.getUs_level();
		model.addAttribute("user", user);
		
		if(!user.getUs_gbn().equals("2")) {
			rttr.addFlashAttribute("resultMsg", "기업/예비창업자로 가입 후 글 작성이 가능합니다.");		
			return "redirect:/main/main.do";
		}
		
		String resultMsg = "";
		Map<String, ?> redirectMap = RequestContextUtils.getInputFlashMap(request);
		if(redirectMap != null) {
			resultMsg = (String)redirectMap.get("resultMsg");
		}
		
		model.addAttribute("resultMsg", resultMsg);
		
		MemberVO mem_result = new MemberVO();
		mem_result = memberService.selectMember(user.getIdx());
		model.addAttribute("mem_result", mem_result);
		
		MemberVO mvo = new MemberVO();
		mvo.setUs_gbn("3");
		mvo.setUs_mentoyn("Y");
		List<MemberVO> mem_list1 = memberService.selectMemberListXls(mvo);
		model.addAttribute("mem_list1", mem_list1);
		
		//사용자 로그 저장
        String userIp = EgovClntInfo.getClntIP(request);
        PageLogVO pagelogvo = new PageLogVO();
        pagelogvo.setPage_name("기업상담신청");
        pagelogvo.setM_id(user.getUs_id());
        pagelogvo.setCom_ip(userIp);
        pagelogService.insertPagelog(pagelogvo);
        /////로그 저장 완료
				
		return "egovframework/gntbsc/sub04/sub01_03_write";
	}
	
	//상담신청 저장
	@RequestMapping(value = "/sub04/sub01_03_Updt.do")
	public String save_sub04_page_01_03(MultipartHttpServletRequest request, ModelMap model, RedirectAttributes rttr) throws Exception{
		
		// 1. Spring Security 사용자권한 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			rttr.addFlashAttribute("resultMsg", "기업/예비창업자로 가입 후 글 작성이 가능합니다.");		
			rttr.addFlashAttribute("go_url", "memtow");		
			return "redirect:/member/login.do";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		int m_level = user.getUs_level();
		model.addAttribute("user", user);
		
		if(!user.getUs_gbn().equals("2")) {
			rttr.addFlashAttribute("resultMsg", "기업/예비창업자로 가입 후 글 작성이 가능합니다.");		
			return "redirect:/main/main.do";
		}
		
		// 접속IP
		String userIp = EgovClntInfo.getClntIP(request);
		LOGGER.debug("userIp : " + userIp);
		System.out.println("단계1");
		
		MemtoVO mvo = new MemtoVO();
		
		mvo.setUs_id(user.getUs_id());
		mvo.setUs_company(EgovStringUtil.clearXSS(request.getParameter("us_company"),""));
		mvo.setUs_position(EgovStringUtil.clearXSS(request.getParameter("us_position"),""));
		mvo.setUs_makeyear(EgovStringUtil.clearXSS(request.getParameter("us_makeyear"),""));
		mvo.setUs_uptaex(EgovStringUtil.clearXSS(request.getParameter("us_uptaex"),""));
		mvo.setUs_major11(EgovStringUtil.clearXSS(request.getParameter("us_major11"),""));
		mvo.setUs_major12(EgovStringUtil.clearXSS(request.getParameter("us_major12"),""));
		mvo.setUs_major1_etc(EgovStringUtil.clearXSS(request.getParameter("us_major1_etc"),""));
		mvo.setHope_memto(EgovStringUtil.clearXSS(request.getParameter("hope_memto"),""));
		mvo.setMemto_gbn(request.getParameter("memto_gbn"));
		
		if(mvo.getMemto_gbn().equals("2")) {
			mvo.setRoom_gbn(request.getParameter("room_gbn"));
			mvo.setRoom_date(EgovStringUtil.clearXSS(request.getParameter("room_date"),""));
			mvo.setRoom_time1(EgovStringUtil.clearXSS(request.getParameter("room_time1"),""));
			mvo.setRoom_time2(EgovStringUtil.clearXSS(request.getParameter("room_time2"),""));
		} else if(mvo.getMemto_gbn().equals("3")) {
				mvo.setRoom_gbn(request.getParameter("room_gbn"));
				mvo.setRoom_date(EgovStringUtil.clearXSS(request.getParameter("room_date"),""));
				mvo.setRoom_time1(EgovStringUtil.clearXSS(request.getParameter("room_time1"),""));
				mvo.setRoom_time2(EgovStringUtil.clearXSS(request.getParameter("room_time2"),""));
		} else {
			mvo.setRoom_gbn("N");
			mvo.setRoom_date("");
			mvo.setRoom_time1("");
			mvo.setRoom_time2("");
		}
		
		String att_cntx = EgovStringUtil.clearXSS(request.getParameter("att_cnt"),"");
		mvo.setAtt_cnt(Integer.parseInt(att_cntx));
		
		mvo.setTitle(EgovStringUtil.clearXSS(request.getParameter("title"),""));
		mvo.setContentx(EgovStringUtil.clearXSS(request.getParameter("contentx"),"br,img,span,p,font,strong,table,td,tr,th,tbody,b,ul,li,ol,u,div,v:stroke,v:f,v:shapetype,iframe,style, span style,font color,h5,label,h2,!--,colgroup,col,a,input,h3, h4, hr,center"));
		
		String link1 = EgovStringUtil.clearXSS(request.getParameter("link1"),"");
		if(link1.indexOf("http") <= -1) {
			link1 = "http://" + link1;
		}
		mvo.setLink1(link1);
		String link2 = EgovStringUtil.clearXSS(request.getParameter("link2"),"");
		if(link2.indexOf("http") <= -1) {
			link2 = "http://" + link2;
		}
		mvo.setLink2(link2);
		String link3 = EgovStringUtil.clearXSS(request.getParameter("link3"),"");
		if(link3.indexOf("http") <= -1) {
			link3 = "http://" + link3;
		}
		mvo.setLink3(link3);
		mvo.setStatus("1");
		mvo.setCom_ip(userIp);
		
		System.out.println("단계2");
		if( (request == null) || (request.getParameter("us_company").equals("")) || (request.getParameter("title").equals("")) ) { 
			rttr.addFlashAttribute("resultMsg", "입력항목을 확인하세요");
			return "redirect:/sub04/sub01_03_write.do";
		}
		
		System.out.println("단계3");
		//첨부파일 업로드
		boolean isLocal = false;
		String requestUrl = new String(request.getRequestURL());
		//System.out.println(requestUrl);		
		if (requestUrl.contains("localhost") || requestUrl.contains("127.0.0.1")) {
			isLocal = true;
		}
		String fullFileName1 = "";
		String fileExt1   = "";
		String fullFileName2 = "";
		String fileExt2   = "";
		String fullFileName3 = "";
		String fileExt3   = "";
		String filePath = EgovProperties.getProperty("Globals.fileStorePath");
		
		if (isLocal) {
			filePath = "F:/workspace/gntbsc/src/main/webapp/egovframework/upload";
		}	
		System.out.println("단계4");
		//첨부1
		MultipartFile file1 = request.getFile( "userfile1" );
		if(file1.isEmpty() == false) {
			String orgFileNm1 = file1.getOriginalFilename();
			fileExt1   = orgFileNm1.substring(orgFileNm1.lastIndexOf('.')+1).toLowerCase();
			if (fileExt1.equals("gif")||fileExt1.equals("jpeg")||fileExt1.equals("jpg")||fileExt1.equals("png")||fileExt1.equals("bmp")||fileExt1.equals("hwp")||fileExt1.equals("xls")||fileExt1.equals("xlsx")||fileExt1.equals("pdf")||fileExt1.equals("doc")||fileExt1.equals("docx")||fileExt1.equals("txt")||fileExt1.equals("mp4")||fileExt1.equals("zip")||fileExt1.equals("rar")||fileExt1.equals("gz")||fileExt1.equals("tar")) {
				String file_id = idgenService.getNextStringId();
				fullFileName1 = file_id + "." + fileExt1;
				try {
					file1.transferTo(new File(filePath + File.separator + fullFileName1));
					mvo.setUserfile1(fullFileName1);
				}
				catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				rttr.addFlashAttribute("resultMsg", orgFileNm1 + "업로드가 불가능한 확장자입니다.");	
			}
			
		}
		//첨부2
		MultipartFile file2 = request.getFile( "userfile2" );
		if(file2.isEmpty() == false) {
			String orgFileNm2 = file2.getOriginalFilename();
			fileExt2   = orgFileNm2.substring(orgFileNm2.lastIndexOf('.')+1).toLowerCase();
			if (fileExt2.equals("gif")||fileExt2.equals("jpeg")||fileExt2.equals("jpg")||fileExt2.equals("png")||fileExt2.equals("bmp")||fileExt2.equals("hwp")||fileExt2.equals("xls")||fileExt2.equals("xlsx")||fileExt2.equals("pdf")||fileExt2.equals("doc")||fileExt2.equals("docx")||fileExt2.equals("txt")||fileExt2.equals("mp4")||fileExt2.equals("zip")||fileExt2.equals("rar")||fileExt2.equals("gz")||fileExt2.equals("tar")) {
				String file_id = idgenService.getNextStringId();
				fullFileName2 = file_id + "." + fileExt2;
				try {
					file2.transferTo(new File(filePath + File.separator + fullFileName2));
					mvo.setUserfile2(fullFileName2);
				}
				catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				rttr.addFlashAttribute("resultMsg", orgFileNm2 + "업로드가 불가능한 확장자입니다.");	
			}
			
		}	
		//첨부3
		MultipartFile file3 = request.getFile( "userfile3" );
		if(file3.isEmpty() == false) {
			String orgFileNm3 = file3.getOriginalFilename();
			fileExt3   = orgFileNm3.substring(orgFileNm3.lastIndexOf('.')+1).toLowerCase();
			if (fileExt3.equals("gif")||fileExt3.equals("jpeg")||fileExt3.equals("jpg")||fileExt3.equals("png")||fileExt3.equals("bmp")||fileExt3.equals("hwp")||fileExt3.equals("xls")||fileExt3.equals("xlsx")||fileExt3.equals("pdf")||fileExt3.equals("doc")||fileExt3.equals("docx")||fileExt3.equals("txt")||fileExt3.equals("mp4")||fileExt3.equals("zip")||fileExt3.equals("rar")||fileExt3.equals("gz")||fileExt3.equals("tar")) {
				String file_id = idgenService.getNextStringId();
				fullFileName3 = file_id + "." + fileExt3;
				try {
					file3.transferTo(new File(filePath + File.separator + fullFileName3));
					mvo.setUserfile3(fullFileName3);
				}
				catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				rttr.addFlashAttribute("resultMsg", orgFileNm3 + "업로드가 불가능한 확장자입니다.");	
			}
			
		}	
						
		memtoService.insertMemto_info(mvo);
		
		//사용자 로그 저장
        //String userIp = EgovClntInfo.getClntIP(request);
		MemlogVO memlogvo = new MemlogVO();
		memlogvo.setGubunx("기업 상담 신청");
		memlogvo.setSubject("작업자:"+user.getUs_name() + " ID: " + mvo.getUs_id() + " 회사: " + mvo.getUs_company() + " 제목:" + mvo.getTitle());
		memlogvo.setM_id(user.getUs_id());
		memlogvo.setCom_ip(userIp);
		memlogService.insertMemlog(memlogvo);
        /////로그 저장 완료
		
		rttr.addFlashAttribute("resultMsg", "정상 저장되었습니다");
		return "redirect:/sub04/sub01_03.do";
	}
	
	@RequestMapping(value = "/sub04/sub01_03_view.do")
	public String get_sub04_page_01_03_view(@ModelAttribute("searchVO") MemtoVO searchVO, HttpServletRequest request, ModelMap model, Locale locale, RedirectAttributes rttr) throws Exception{
		
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			rttr.addFlashAttribute("resultMsg", "로그인 후 본인이 작성한 글만 확인 가능합니다.");		
			rttr.addFlashAttribute("go_url", "memtow");		
			return "redirect:/member/login.do";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		int m_level = user.getUs_level();
		model.addAttribute("user", user);
		
		if(user.getUs_gbn().equals("2")) {
			searchVO.setUs_id(user.getUs_id());
		} else if((user.getUs_level() <= 2)) {
			//
		} else {
			rttr.addFlashAttribute("resultMsg", "로그인 후 본인이 작성한 글만 확인 가능합니다.");		
			return "redirect:/main/main.do";
		}
		
		int idx = searchVO.getIdx();
		MemtoVO memto_result = new MemtoVO();
		LOGGER.debug("idx : " + idx);
		
		memtoService.changeMemto_hit(idx);
		
		memto_result = memtoService.selectMemto(idx);
		
		//본인글인지 확인
		if((user.getUs_level() > 2)) {
			if(!memto_result.getUs_id().equals(user.getUs_id())) {
				rttr.addFlashAttribute("resultMsg", "로그인 후 본인이 작성한 글만 확인 가능합니다.");	
				return "redirect:/sub04/sub01_03.do";
			}
		}
		
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
				
		return "egovframework/gntbsc/sub04/sub01_03_view";
	}
	
	@RequestMapping(value = "/sub04/sub02_01.do")
	public String get_sub04_page_02(ModelMap model, Locale locale) throws Exception{

		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
				
		return "egovframework/gntbsc/sub04/sub02_01";
	}
	
	@RequestMapping(value = "/sub04/sub03_01.do")
	public String get_sub04_page_03(ModelMap model, Locale locale) throws Exception{

		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
				
		return "egovframework/gntbsc/sub04/sub03_01";
	}
	
	@RequestMapping(value = "/sub04/rental.do")
	public String get_sub04_rental(ModelMap model, Locale locale, RedirectAttributes rttr) throws Exception{

		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			rttr.addFlashAttribute("resultMsg", "로그인 후 이용이 가능합니다.");		
			rttr.addFlashAttribute("go_url", "rental");		
			return "redirect:/member/login.do";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		int m_level = user.getUs_level();
		model.addAttribute("user", user);
		
		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
		
		SimpleDateFormat formatter11 = new SimpleDateFormat("yyyyMM");
		String yearxmonx = formatter11.format(new java.util.Date());
		
		Calendar day = Calendar.getInstance();
		
		int year = Integer.parseInt(yearxmonx.substring(0,4));
		int month = Integer.parseInt(yearxmonx.substring(4,6));

		day.set(year, month, 0);
		
		// 변수 선언및 오늘 날자 
		int thisYear = day.get(Calendar.YEAR); // 년;
		int thisMonth = day.get(Calendar.MONTH)+1; // 월 ( 0 ~ 11 );
		int thisDate = day.get(Calendar.DATE); // 일
		String today = getDateString(day);
		
		
		model.addAttribute("thisYear", Integer.toString(thisYear));
		model.addAttribute("thisMonth", Integer.toString(thisMonth));
		model.addAttribute("thisdayx", Integer.toString(thisMonth));
		model.addAttribute("today", today);
				
		return "egovframework/gntbsc/sub04/rental";
	}
	
	@RequestMapping(value = "/sub04/sub03_02.do")
	public String get_sub04_page_032(ModelMap model, Locale locale) throws Exception{

		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
				
		return "egovframework/gntbsc/sub04/sub03_02";
	}
	
	@RequestMapping(value = "/sub04/sub03_03.do")
	public String get_sub04_page_033(ModelMap model, Locale locale) throws Exception{

		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
				
		return "egovframework/gntbsc/sub04/sub03_03";
	}
	
	@RequestMapping(value = "/sub04/job.do")
	public String get_sub04_page_job(ModelMap model, Locale locale, RedirectAttributes rttr) throws Exception{

		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			rttr.addFlashAttribute("resultMsg", "로그인 후 이용이 가능합니다.");		
			rttr.addFlashAttribute("go_url", "job");		
			return "redirect:/member/login.do";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		int m_level = user.getUs_level();
		model.addAttribute("user", user);
		
		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
		
		SimpleDateFormat formatter11 = new SimpleDateFormat("yyyyMM");
		String yearxmonx = formatter11.format(new java.util.Date());
		
		Calendar day = Calendar.getInstance();
		
		int year = Integer.parseInt(yearxmonx.substring(0,4));
		int month = Integer.parseInt(yearxmonx.substring(4,6));

		day.set(year, month, 0);
		
		// 변수 선언및 오늘 날자 
		int thisYear = day.get(Calendar.YEAR); // 년;
		int thisMonth = day.get(Calendar.MONTH)+1; // 월 ( 0 ~ 11 );
		int thisDate = day.get(Calendar.DATE); // 일
		String today = getDateString(day);
		
		
		model.addAttribute("thisYear", Integer.toString(thisYear));
		model.addAttribute("thisMonth", Integer.toString(thisMonth));
		model.addAttribute("thisdayx", Integer.toString(thisMonth));
		model.addAttribute("today", today);
				
		return "egovframework/gntbsc/sub04/job";
	}
	
	//일자리 상담 신청 저장
	@RequestMapping(value = "/sub04/job_Updt.do")
	public String save_sub04_page_job(MultipartHttpServletRequest request, ModelMap model, RedirectAttributes rttr) throws Exception{
		// 1. Spring Security 사용자권한 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			rttr.addFlashAttribute("resultMsg", "로그인 후 이용이 가능합니다.");		
			rttr.addFlashAttribute("go_url", "job");		
			return "redirect:/member/login.do";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		int m_level = user.getUs_level();
		model.addAttribute("user", user);
		
		String userIp = EgovClntInfo.getClntIP(request);
		LOGGER.debug("userIp : " + userIp);
		
		JcounselVO jcvo = new JcounselVO();
		
		jcvo.setCounsel_gbn(EgovStringUtil.clearXSS(request.getParameter("counsel_gbn"),""));
		jcvo.setDatexx(EgovStringUtil.clearXSS(request.getParameter("datexx"),""));
		jcvo.setTimexx(EgovStringUtil.clearXSS(request.getParameter("timexx"),""));
		jcvo.setUs_id(user.getUs_id());
		jcvo.setName(EgovStringUtil.clearXSS(request.getParameter("name"),""));
		jcvo.setMobile(EgovStringUtil.clearXSS(request.getParameter("mobile"),""));
		jcvo.setContent1(EgovStringUtil.clearXSS(request.getParameter("content1"),""));
		jcvo.setStatus("1");
		jcvo.setCom_ip(userIp);
		jcvo.setRefuse_txt("");
		jcvo.setSys_id("");
		
		if( (request == null) || (request.getParameter("datexx").equals("")) || (request.getParameter("mobile").equals("")) ) { 
			rttr.addFlashAttribute("resultMsg", "입력항목을 확인하세요");
			return "redirect:/sub04/job.do";
		}
		
		//첨부파일 업로드
		boolean isLocal = false;
		String requestUrl = new String(request.getRequestURL());
		//System.out.println(requestUrl);		
		if (requestUrl.contains("localhost") || requestUrl.contains("127.0.0.1")) {
			isLocal = true;
		}
		String fullFileName1 = "";
		String fileExt1   = "";
		String fullFileName2 = "";
		String fileExt2   = "";
		String fullFileName3 = "";
		String fileExt3   = "";
		String filePath = EgovProperties.getProperty("Globals.fileStorePath");
		
		if (isLocal) {
			filePath = "F:/workspace/gntbsc/src/main/webapp/egovframework/upload";
		}	
		System.out.println("단계4");
		//첨부1
		MultipartFile file1 = request.getFile( "userfile1" );
		if(file1.isEmpty() == false) {
			String orgFileNm1 = file1.getOriginalFilename();
			fileExt1   = orgFileNm1.substring(orgFileNm1.lastIndexOf('.')+1).toLowerCase();
			if (fileExt1.equals("gif")||fileExt1.equals("jpeg")||fileExt1.equals("jpg")||fileExt1.equals("png")||fileExt1.equals("bmp")||fileExt1.equals("hwp")||fileExt1.equals("xls")||fileExt1.equals("xlsx")||fileExt1.equals("pdf")||fileExt1.equals("doc")||fileExt1.equals("docx")||fileExt1.equals("txt")||fileExt1.equals("mp4")||fileExt1.equals("zip")||fileExt1.equals("rar")||fileExt1.equals("gz")||fileExt1.equals("tar")) {
				String file_id = idgenService.getNextStringId();
				fullFileName1 = file_id + "." + fileExt1;
				try {
					file1.transferTo(new File(filePath + File.separator + fullFileName1));
					jcvo.setUserfile1(fullFileName1);
				}
				catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				rttr.addFlashAttribute("resultMsg", orgFileNm1 + "업로드가 불가능한 확장자입니다.");	
			}
			
		}
		//첨부2
		MultipartFile file2 = request.getFile( "userfile2" );
		if(file2.isEmpty() == false) {
			String orgFileNm2 = file2.getOriginalFilename();
			fileExt2   = orgFileNm2.substring(orgFileNm2.lastIndexOf('.')+1).toLowerCase();
			if (fileExt2.equals("gif")||fileExt2.equals("jpeg")||fileExt2.equals("jpg")||fileExt2.equals("png")||fileExt2.equals("bmp")||fileExt2.equals("hwp")||fileExt2.equals("xls")||fileExt2.equals("xlsx")||fileExt2.equals("pdf")||fileExt2.equals("doc")||fileExt2.equals("docx")||fileExt2.equals("txt")||fileExt2.equals("mp4")||fileExt2.equals("zip")||fileExt2.equals("rar")||fileExt2.equals("gz")||fileExt2.equals("tar")) {
				String file_id = idgenService.getNextStringId();
				fullFileName2 = file_id + "." + fileExt2;
				try {
					file2.transferTo(new File(filePath + File.separator + fullFileName2));
					jcvo.setUserfile2(fullFileName2);
				}
				catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				rttr.addFlashAttribute("resultMsg", orgFileNm2 + "업로드가 불가능한 확장자입니다.");	
			}
			
		}	
		//첨부3
		MultipartFile file3 = request.getFile( "userfile3" );
		if(file3.isEmpty() == false) {
			String orgFileNm3 = file3.getOriginalFilename();
			fileExt3   = orgFileNm3.substring(orgFileNm3.lastIndexOf('.')+1).toLowerCase();
			if (fileExt3.equals("gif")||fileExt3.equals("jpeg")||fileExt3.equals("jpg")||fileExt3.equals("png")||fileExt3.equals("bmp")||fileExt3.equals("hwp")||fileExt3.equals("xls")||fileExt3.equals("xlsx")||fileExt3.equals("pdf")||fileExt3.equals("doc")||fileExt3.equals("docx")||fileExt3.equals("txt")||fileExt3.equals("mp4")||fileExt3.equals("zip")||fileExt3.equals("rar")||fileExt3.equals("gz")||fileExt3.equals("tar")) {
				String file_id = idgenService.getNextStringId();
				fullFileName3 = file_id + "." + fileExt3;
				try {
					file3.transferTo(new File(filePath + File.separator + fullFileName3));
					jcvo.setUserfile3(fullFileName3);
				}
				catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				rttr.addFlashAttribute("resultMsg", orgFileNm3 + "업로드가 불가능한 확장자입니다.");	
			}
			
		}
		
		jcounselService.insertJcounsel_info(jcvo);
		
		//사용자 로그 저장
        //String userIp = EgovClntInfo.getClntIP(request);
		MemlogVO memlogvo = new MemlogVO();
		memlogvo.setGubunx("일자리 지원 상담 신청");
		memlogvo.setSubject("작업자:"+user.getUs_name() + " ID: " + jcvo.getUs_id() + " 신청일: " + jcvo.getDatexx());
		memlogvo.setM_id(user.getUs_id());
		memlogvo.setCom_ip(userIp);
		memlogService.insertMemlog(memlogvo);
        /////로그 저장 완료
		
		rttr.addFlashAttribute("resultMsg", "정상 저장되었습니다");
		return "redirect:/member/myjob.do";
		
	}
	
	
	//전월 구하기
	@RequestMapping(value = "/rent/get_last_mon.do")
	public ModelAndView get_LastMon(@RequestParam("i_year") String i_year, @RequestParam("i_mon") String i_mon) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		i_year = URLDecoder.decode(i_year,"utf-8");
		i_mon = URLDecoder.decode(i_mon,"utf-8");
		
		int year = Integer.parseInt(i_year);
		int month = Integer.parseInt(i_mon);
		  
		Calendar cal = Calendar.getInstance();
		
		cal.set(year, month-1, 0);
		
		DecimalFormat df = new DecimalFormat("00");
		String beforeYear  = Integer.toString(cal.get(Calendar.YEAR));
		String beforeMonth = df.format(cal.get(Calendar.MONTH)+1);
		
		modelAndView.addObject("yearx", beforeYear);
		modelAndView.addObject("monx", beforeMonth);
		
		return modelAndView;
	}
	
	//다음달 구하기
	@RequestMapping(value = "/rent/get_next_mon.do")
	public ModelAndView get_NextMon(@RequestParam("i_year") String i_year, @RequestParam("i_mon") String i_mon) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		i_year = URLDecoder.decode(i_year,"utf-8");
		i_mon = URLDecoder.decode(i_mon,"utf-8");
		
		int year = Integer.parseInt(i_year);
		int month = Integer.parseInt(i_mon);
		  
		Calendar cal = Calendar.getInstance();
		
		cal.set(year, month+1, 0);
		
		DecimalFormat df = new DecimalFormat("00");
		String beforeYear  = Integer.toString(cal.get(Calendar.YEAR));
		String beforeMonth = df.format(cal.get(Calendar.MONTH)+1);
		
		modelAndView.addObject("yearx", beforeYear);
		modelAndView.addObject("monx", beforeMonth);
		
		return modelAndView;
	}
	
	//날짜 뿌리기
	@RequestMapping(value = "/rent/get_calendar.do")
	public ModelAndView get_Calendarx(@RequestParam("yearx") String yearx, @RequestParam("monx") String monx) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		String[] weekDayx = { "일", "월", "화", "수", "목", "금", "토", "토" };
		
		Calendar day = Calendar.getInstance();
		
		yearx = URLDecoder.decode(yearx,"utf-8");
		monx = URLDecoder.decode(monx,"utf-8");
		String today = getDateString(day);
		
		java.text.SimpleDateFormat formatter5 = new java.text.SimpleDateFormat ("yyyyMMdd", java.util.Locale.KOREA);
		java.text.SimpleDateFormat formatter2 = new java.text.SimpleDateFormat ("dd", java.util.Locale.KOREA);
		
		int nowYear = Integer.parseInt(yearx);
		int nowMonth = Integer.parseInt(monx);
		int nowDate = Integer.parseInt(formatter2.format(new java.util.Date()));
		int todays = Integer.parseInt(formatter5.format(new java.util.Date()));		
		int todays30 = Integer.parseInt(EgovDateUtil.addYearMonthDay(Integer.toString(todays),0,1,0));
	  
		day.set(nowYear, nowMonth-1, nowDate);
		
		int thisYear = day.get(Calendar.YEAR); // 년;
		int thisMonth = day.get(Calendar.MONTH); // 월 ( 0 ~ 11 );
		int thisDate = day.get(Calendar.DATE); // 일
		int thisDay = day.get(Calendar.DAY_OF_WEEK); // 요일 ( 일요일 : 1 ~ 토요일 : 7 )

		// 오늘 날자 기억해 두기
		today = getDateString(day);
		
		DecimalFormat df = new DecimalFormat("00");
		Calendar calendar = Calendar.getInstance(); 
		String yearq = Integer.toString(calendar.get(Calendar.YEAR)); //년도를 구한다
		String monthq = df.format(calendar.get(Calendar.MONTH)+1); //달을 구한다
		String dayq = df.format(calendar.get(Calendar.DATE)); //날짜를 구한다
		String ondate = yearq + "-" + monthq + "-" + dayq;

		// 이달의 마지막 날자 구하기 ( 아래 for 문에서 이용
		int lastDate = day.getActualMaximum(Calendar.DATE);
		
		int calmonth = getMonthNum(thisMonth);
		String st_calmonth="";
		if(calmonth<10){
			st_calmonth="0"+calmonth;
		}else{
			st_calmonth=Integer.toString(calmonth);
		}
		
		String select_monx = "";
		
		for ( int i = 1 ; i <= lastDate ; i ++ ) {
			// 날자 변경
			day.set( Calendar.DATE, i ) ; 

			// 날자 다시 셋팅
			thisDate = day.get(Calendar.DATE); // 일
		  
			String st_caldate="";
			if(thisDate<10){
				st_caldate="0"+thisDate;
			}else{
				st_caldate=Integer.toString(thisDate);
			}

			String link_page=thisYear+st_calmonth+st_caldate;
			int s_date=Integer.parseInt(link_page);
			String s_date1=thisYear+"-"+st_calmonth+"-"+st_caldate;

		    thisDay = day.get(Calendar.DAY_OF_WEEK);  // 요일 ( 일요일 : 1 ~ 토요일 : 7 )
		    
		    if ( thisDate == 1 ) {
				select_monx = "<tr>  ";
				for ( int j = 1 ; j < thisDay ; j ++ ) {
					select_monx = select_monx + "<td></td>  ";
				}
			}
		    
		    if(thisDay==1){
		    	select_monx = select_monx + "<td class=\"calDay cDay0\"> ";
		    } else if(thisDay==7){
		    	select_monx = select_monx + "<td class=\"calDay cDay6\"> ";
		    } else {
		    	select_monx = select_monx + "<td class=\"calDay cDay2\"> ";
		    }
		    
		    String beforeend = "";
		    
		    if(s_date < todays) {
		    	beforeend = "end";
		    } else if(s_date > todays30) {
		    	beforeend = "end";
		    } else {
		    	beforeend = " ";
		    }

		    if(link_page.equals(today)) {
		    	if(beforeend.equals(" ")) {
		    		select_monx = select_monx + "<a href=\"#"+thisDate+"\" id=\"iday_"+thisDate+"\" onclick=\"select_rent_day('"+s_date1+"');\" class=\"today "+beforeend+"\"> ";
		    	} else {
		    		select_monx = select_monx + "<a href=\"#"+thisDate+"\" id=\"iday_"+thisDate+"\" class=\"today "+beforeend+"\"> ";
		    	}
				select_monx = select_monx + "<span class=\"num\">"+thisDate+"</span> ";
				select_monx = select_monx + "</a> ";
				select_monx = select_monx + "</td> ";
			} else {
				if(beforeend.equals(" ")) {
					select_monx = select_monx + "<a href=\"#"+thisDate+"\" id=\"iday_"+thisDate+"\" onclick=\"select_rent_day('"+s_date1+"');\" class=\""+beforeend+"\"> ";
				} else {
					select_monx = select_monx + "<a href=\"#"+thisDate+"\" id=\"iday_"+thisDate+"\" class=\""+beforeend+"\"> ";
				}
				select_monx = select_monx + "<span class=\"num\">"+thisDate+"</span> ";
				select_monx = select_monx + "</a> ";
				select_monx = select_monx + "</td> ";
			}
				
		    if ( thisDate == lastDate ) {
				for ( int j = 0 ; j < 7 - thisDay ; j ++ ) {
					select_monx = select_monx + "<td></td> ";
				}
			// 토요일인 경우에
			} else if ( thisDay == 7 ) {
				select_monx = select_monx + "</tr> <tr> ";
			}
		    
		    
		    ////
		}
		
		System.out.println("달력 : " + select_monx);
		
		modelAndView.addObject("select_monx", select_monx);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/rent/select_rentday.do")
	public ModelAndView get_RentDayx(@RequestParam("datexx") String datexx) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		datexx = URLDecoder.decode(datexx,"utf-8");
		
		String select_timeon = "N";
		
		RoomSetVO rsvo = new RoomSetVO();
		RoomSetVO rsrvo = new RoomSetVO();
		rsvo.setDatexx(datexx);
		rsvo.setRent_yn("Y");
		rsrvo = roomSetService.selectRoomSet_info2(rsvo);
		if(rsrvo != null) {
			select_timeon = "Y";
		} else {
			select_timeon = "N";
		}
		
		modelAndView.addObject("select_timeon", select_timeon);
		
		return modelAndView;
	}
	
	//대여가능한 방 체크
	@RequestMapping(value = "/rent/select_rentroom.do")
	public ModelAndView get_RentTimex(@RequestParam("datexx") String datexx, @RequestParam("timexx") String timexx) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		datexx = URLDecoder.decode(datexx,"utf-8");
		timexx = URLDecoder.decode(timexx,"utf-8");
		
		String room_list = "";
		
		RoomSetVO rsvo = new RoomSetVO();
		RoomSetVO rsrvo = new RoomSetVO();
		rsvo.setDatexx(datexx);
		rsvo.setRent_yn("Y");
		
		String[] timess = timexx.split(",");

		RoomRentVO rrvo = new RoomRentVO();
		RoomRentVO rr_rlt = new RoomRentVO();
		rrvo.setDatexx(datexx);
		
		rrvo.setSdate("5");
		
		int ex_i = 0;
		//s1
		rsvo.setRoom_id("s1");
		rsrvo = roomSetService.selectRoomSet_info2(rsvo);
		if(rsrvo != null) {
			rrvo.setRoom_id1("s1");
			
			for(int j=0; j < timess.length; j++) {
				rrvo.setTimexx(timess[j]);
				rr_rlt = roomRentService.selectRoomRent2(rrvo);
				if(rr_rlt == null) {
					ex_i++;
				}
			}
		}
		if(ex_i == timess.length) {
			if(room_list.equals("")) {
				room_list = "s1";
			} else {
				room_list = room_list + "|s1";
			}
		}
		
		//s2
		ex_i = 0;
		rsvo.setRoom_id("s2");
		rsrvo = roomSetService.selectRoomSet_info2(rsvo);
		if(rsrvo != null) {
			rrvo.setRoom_id1("s2");
			
			for(int j=0; j < timess.length; j++) {
				rrvo.setTimexx(timess[j]);
				rr_rlt = roomRentService.selectRoomRent2(rrvo);
				if(rr_rlt == null) {
					ex_i++;
				}
			}
		}
		if(ex_i == timess.length) {
			if(room_list.equals("")) {
				room_list = "s2";
			} else {
				room_list = room_list + "|s2";
			}
		}
		
		//s3
		ex_i = 0;
		rsvo.setRoom_id("s3");
		rsrvo = roomSetService.selectRoomSet_info2(rsvo);
		if(rsrvo != null) {
			rrvo.setRoom_id1("s3");
			
			for(int j=0; j < timess.length; j++) {
				rrvo.setTimexx(timess[j]);
				rr_rlt = roomRentService.selectRoomRent2(rrvo);
				if(rr_rlt == null) {
					ex_i++;
				}
			}
		}
		if(ex_i == timess.length) {
			if(room_list.equals("")) {
				room_list = "s3";
			} else {
				room_list = room_list + "|s3";
			}
		}
		
		//s4
		ex_i = 0;
		rsvo.setRoom_id("s4");
		rsrvo = roomSetService.selectRoomSet_info2(rsvo);
		if(rsrvo != null) {
			rrvo.setRoom_id1("s4");
			
			for(int j=0; j < timess.length; j++) {
				rrvo.setTimexx(timess[j]);
				rr_rlt = roomRentService.selectRoomRent2(rrvo);
				if(rr_rlt == null) {
					ex_i++;
				}
			}
		}
		if(ex_i == timess.length) {
			if(room_list.equals("")) {
				room_list = "s4";
			} else {
				room_list = room_list + "|s4";
			}
		}
		
		//s5
		ex_i = 0;
		rsvo.setRoom_id("s5");
		rsrvo = roomSetService.selectRoomSet_info2(rsvo);
		if(rsrvo != null) {
			rrvo.setRoom_id1("s5");
			
			for(int j=0; j < timess.length; j++) {
				rrvo.setTimexx(timess[j]);
				rr_rlt = roomRentService.selectRoomRent2(rrvo);
				if(rr_rlt == null) {
					ex_i++;
				}
			}
		}
		if(ex_i == timess.length) {
			if(room_list.equals("")) {
				room_list = "s5";
			} else {
				room_list = room_list + "|s5";
			}
		}
		
		//s6
		ex_i = 0;
		rsvo.setRoom_id("s6");
		rsrvo = roomSetService.selectRoomSet_info2(rsvo);
		if(rsrvo != null) {
			rrvo.setRoom_id1("s6");
			
			for(int j=0; j < timess.length; j++) {
				rrvo.setTimexx(timess[j]);
				rr_rlt = roomRentService.selectRoomRent2(rrvo);
				if(rr_rlt == null) {
					ex_i++;
				}
			}
		}
		if(ex_i == timess.length) {
			if(room_list.equals("")) {
				room_list = "s6";
			} else {
				room_list = room_list + "|s6";
			}
		}
		
		//s7
		ex_i = 0;
		rsvo.setRoom_id("s7");
		rsrvo = roomSetService.selectRoomSet_info2(rsvo);
		if(rsrvo != null) {
			rrvo.setRoom_id1("s7");
			
			for(int j=0; j < timess.length; j++) {
				rrvo.setTimexx(timess[j]);
				rr_rlt = roomRentService.selectRoomRent2(rrvo);
				if(rr_rlt == null) {
					ex_i++;
				}
			}
		}
		if(ex_i == timess.length) {
			if(room_list.equals("")) {
				room_list = "s7";
			} else {
				room_list = room_list + "|s7";
			}
		}
		
		System.out.println("Room_id : " + room_list);
		
		modelAndView.addObject("room_list", room_list);
		
		return modelAndView;
		
	}
	
	//대여신청 저장 처리
	@RequestMapping(value = "/rent/save_rent.do")
	public ModelAndView save_RentTime(HttpServletRequest request) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			modelAndView.addObject("result", "N");
			
		} else {
			
			LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
			
			String datexx = EgovStringUtil.clearXSS(request.getParameter("datexx"),"");
			String timexx = EgovStringUtil.clearXSS(request.getParameter("timexx"),"");
			String room_id1 = EgovStringUtil.clearXSS(request.getParameter("room_id1"),"");
			String room_id2 = EgovStringUtil.clearXSS(request.getParameter("room_id2"),"");
			String room_id3 = EgovStringUtil.clearXSS(request.getParameter("room_id3"),"");
			String name = EgovStringUtil.clearXSS(request.getParameter("name"),"");
			String mobile = EgovStringUtil.clearXSS(request.getParameter("mobile"),"");
			String company = EgovStringUtil.clearXSS(request.getParameter("company"),"");
			String people_cnt = EgovStringUtil.clearXSS(request.getParameter("people_cnt"),"");
			String content1 = EgovStringUtil.clearXSS(request.getParameter("content1"),"");
			String content2 = EgovStringUtil.clearXSS(request.getParameter("content2"),"");
			String etc = EgovStringUtil.clearXSS(request.getParameter("etc"),"");
			
			String userIp = EgovClntInfo.getClntIP(request);
			
			RoomRentVO rrvo = new RoomRentVO();
			rrvo.setDatexx(datexx);
			rrvo.setTimexx(timexx);
			rrvo.setRoom_id1(room_id1);
			rrvo.setRoom_id2(room_id2);
			rrvo.setRoom_id3(room_id3);
			rrvo.setUs_id(user.getUs_id());
			rrvo.setName(name);
			rrvo.setMobile(mobile);
			rrvo.setCompany(company);
			rrvo.setPeople_cnt(Integer.parseInt(people_cnt));
			rrvo.setContent1(content1);
			rrvo.setContent2(content2);
			rrvo.setEtc(etc);
			rrvo.setStatus("1");
			rrvo.setSys_id(userIp);
			roomRentService.insertRoomRent_info(rrvo);
			
			SmsSend24.AuthSms();
			
			SmsSend24.Cafe24SmsSend(mobile, "대관신청이 정상 접수되었습니다. -경남관광기업지원센터");
			
			modelAndView.addObject("result", "Y");
			
			//사용자 로그 저장
	        //String userIp = EgovClntInfo.getClntIP(request);
			MemlogVO memlogvo = new MemlogVO();
			memlogvo.setGubunx("사용자 대관 신청 저장 처리");
			memlogvo.setSubject("작업자:"+user.getUs_name() + " ID: " + user.getUs_id());
			memlogvo.setM_id(user.getUs_id());
			memlogvo.setCom_ip(userIp);
			memlogService.insertMemlog(memlogvo);
	        /////로그 저장 완료
		}
		
		return modelAndView;
		
	}
	
	//대관신청 수정 저장
	@RequestMapping(value = "/rent/save_rent_up.do")
	public ModelAndView save_RentTime_up(HttpServletRequest request) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			modelAndView.addObject("result", "N");
			
		} else {
			
			LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
			
			String idx = EgovStringUtil.clearXSS(request.getParameter("idx"),"");
			String datexx = EgovStringUtil.clearXSS(request.getParameter("datexx"),"");
			String timexx = EgovStringUtil.clearXSS(request.getParameter("timexx"),"");
			String room_id1 = EgovStringUtil.clearXSS(request.getParameter("room_id1"),"");
			String room_id2 = EgovStringUtil.clearXSS(request.getParameter("room_id2"),"");
			String room_id3 = EgovStringUtil.clearXSS(request.getParameter("room_id3"),"");
			String name = EgovStringUtil.clearXSS(request.getParameter("name"),"");
			String mobile = EgovStringUtil.clearXSS(request.getParameter("mobile"),"");
			String company = EgovStringUtil.clearXSS(request.getParameter("company"),"");
			String people_cnt = EgovStringUtil.clearXSS(request.getParameter("people_cnt"),"");
			String content1 = EgovStringUtil.clearXSS(request.getParameter("content1"),"");
			String content2 = EgovStringUtil.clearXSS(request.getParameter("content2"),"");
			String etc = EgovStringUtil.clearXSS(request.getParameter("etc"),"");
			String status = EgovStringUtil.clearXSS(request.getParameter("status"),"");
			
			String userIp = EgovClntInfo.getClntIP(request);
			
			RoomRentVO rrvo = new RoomRentVO();
			rrvo.setIdx(Integer.parseInt(idx));
			rrvo.setDatexx(datexx);
			rrvo.setTimexx(timexx);
			rrvo.setRoom_id1(room_id1);
			rrvo.setRoom_id2(room_id2);
			rrvo.setRoom_id3(room_id3);
			rrvo.setName(name);
			rrvo.setMobile(mobile);
			rrvo.setCompany(company);
			rrvo.setPeople_cnt(Integer.parseInt(people_cnt));
			rrvo.setContent1(content1);
			rrvo.setContent2(content2);
			rrvo.setEtc(etc);
			rrvo.setStatus(status);
			rrvo.setSys_id(userIp);
			
			if(idx.equals("0")) {
				rrvo.setUs_id(user.getUs_id());
				
				roomRentService.insertRoomRent_info(rrvo);
			} else {
				if(status.equals("2")) {
					SmsSend24.AuthSms();
				
					SmsSend24.Cafe24SmsSend(mobile, datexx + "일 대관신청이 승인되었습니다. -경남관광기업지원센터");
				} else if(status.equals("3")) {
					SmsSend24.AuthSms();
				
					SmsSend24.Cafe24SmsSend(mobile, datexx + "일 대관신청이 반려되었습니다. -경남관광기업지원센터");
					
					rrvo.setRefuse_txt("내부사정으로 대관이 취소되었습니다.");
				}
				
				roomRentService.updateRoomRent_info(rrvo);
			}
			
			
			modelAndView.addObject("result", "Y");
			
			//사용자 로그 저장
	        //String userIp = EgovClntInfo.getClntIP(request);
			MemlogVO memlogvo = new MemlogVO();
			memlogvo.setGubunx("관리자 대관 신청/수정 저장 처리");
			memlogvo.setSubject("작업자:"+user.getUs_name() + " ID: " + user.getUs_id());
			memlogvo.setM_id(user.getUs_id());
			memlogvo.setCom_ip(userIp);
			memlogService.insertMemlog(memlogvo);
	        /////로그 저장 완료
		}
		
		return modelAndView;
		
	}
	
	//사용자 대관 취소
	@RequestMapping(value = "/rent/refuse_myrent.do")
	public ModelAndView refuse_myrent(HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			modelAndView.addObject("result", "N");
			
		} else {
			
			LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
			
			String idx = EgovStringUtil.clearXSS(request.getParameter("idx"),"");
			
			String userIp = EgovClntInfo.getClntIP(request);
			
			RoomRentVO rrvo = new RoomRentVO();
			rrvo.setIdx(Integer.parseInt(idx));
			rrvo.setStatus("3");
			rrvo.setSys_id(userIp);
			rrvo.setSys_id(user.getUs_id());
			rrvo.setRefuse_txt("신청자 취소");
			roomRentService.changeRoomRent_info(rrvo);
			
			modelAndView.addObject("result", "Y");
			
			//사용자 로그 저장
	        //String userIp = EgovClntInfo.getClntIP(request);
			MemlogVO memlogvo = new MemlogVO();
			memlogvo.setGubunx("사용자 대관 취소 처리");
			memlogvo.setSubject("작업자:"+user.getUs_name() + " ID: " + user.getUs_id());
			memlogvo.setM_id(user.getUs_id());
			memlogvo.setCom_ip(userIp);
			memlogService.insertMemlog(memlogvo);
	        /////로그 저장 완료
		}
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/download/downloadFile.do")
	public void downloadFile(@RequestParam(value = "requestedFile") String requestedFile, @RequestParam(value = "dFileName") String dFileName, HttpServletRequest request, HttpServletResponse response) throws Exception {
 
		boolean isLocal = false;
		String requestUrl = new String(request.getRequestURL());
		if (requestUrl.contains("localhost") || requestUrl.contains("127.0.0.1")) {
			isLocal = true;
		}
		
		String userAgent = request.getHeader("user-agent");
		boolean ie = (userAgent.indexOf("MSIE") > -1) || (userAgent.indexOf("Trident") > -1);
		
		requestedFile = EgovStringUtil.replace(requestedFile, "..", "");
		requestedFile = EgovStringUtil.replace(requestedFile, "/", "");
		
		String uploadPath = EgovProperties.getProperty("Globals.fileStorePath");
		if (isLocal) {
			uploadPath = "F:/workspace/gntbsc/src/main/webapp/egovframework/upload/";
		}
		
		File uFile = new File(uploadPath, requestedFile);
		int fSize = (int) uFile.length();
		
		dFileName = URLDecoder.decode(dFileName, "UTF-8" );
		System.out.println("dFileName : " + dFileName);
		String dnfilenm = "";
		if (ie) {
			dnfilenm = URLEncoder.encode(dFileName, "UTF-8").replaceAll("\\+", "%20");
		} else {
			dnfilenm = new String(dFileName.getBytes("UTF-8"), "ISO-8859-1");
		}
		System.out.println("dnfilenm : " + dnfilenm);
 
		if (fSize > 0) {
 
			BufferedInputStream in = new BufferedInputStream(
					new FileInputStream(uFile));
			// String mimetype = servletContext.getMimeType(requestedFile);
			String mimetype = "text/html";
 
			response.setBufferSize(fSize);
			response.setContentType(mimetype);
			response.setHeader("Content-Disposition", "attachment; filename=\""
					+ dnfilenm + "\"");
			response.setContentLength(fSize);
 
			FileCopyUtils.copy(in, response.getOutputStream());
			in.close();
			response.getOutputStream().flush();
			response.getOutputStream().close();
			
		} else {
			
			//setContentType을 프로젝트 환경에 맞추어 변경
			response.setContentType("application/x-msdownload");
			PrintWriter printwriter = response.getWriter();
			printwriter.println("<html>");
			printwriter.println("<br><br><br><h2>Could not get file name:<br>"
					+ dnfilenm + "</h2>");
			printwriter
					.println("<br><br><br><center><h3><a href='javascript: history.go(-1)'>Back</a></h3></center>");
			printwriter.println("<br><br><br>&copy; webAccess");
			printwriter.println("</html>");
			printwriter.flush();
			printwriter.close();
			
		}
	}
	
	//사용자 상담완료 처리
	@RequestMapping(value = "/memto/mento_status4Ajax.do")
	public ModelAndView mento_status4Ajax(HttpServletRequest request) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			modelAndView.addObject("result", "N");
			
		} else {
			
			LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
			
			String idx = EgovStringUtil.clearXSS(request.getParameter("idx"),"");
			
			String userIp = EgovClntInfo.getClntIP(request);
			
			MemtoVO mvo = new MemtoVO();
			mvo.setIdx(Integer.parseInt(idx));
			mvo.setStatus("4");
			mvo.setCom_ip(userIp);
			
			memtoService.changeMemto_info(mvo);
			
			modelAndView.addObject("result", "Y");
			
			//사용자 로그 저장
	        //String userIp = EgovClntInfo.getClntIP(request);
			MemlogVO memlogvo = new MemlogVO();
			memlogvo.setGubunx("사용자 상담 완료 처리");
			memlogvo.setSubject("작업자:"+user.getUs_name() + " ID: " + user.getUs_id());
			memlogvo.setM_id(user.getUs_id());
			memlogvo.setCom_ip(userIp);
			memlogService.insertMemlog(memlogvo);
	        /////로그 저장 완료
		}
		
		return modelAndView;
	}
	
	//설문조사 저장
	@RequestMapping(value = "/memto/mento_surveyUpAjax.do")
	public ModelAndView mento_surveyUpAjax(HttpServletRequest request) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			modelAndView.addObject("result", "N");
			
		} else {
			
			LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
			
			String counsel_idx = EgovStringUtil.clearXSS(request.getParameter("counsel_idx"),"");
			String ans_1 = EgovStringUtil.clearXSS(request.getParameter("ans_1"),"");
			String ans_2 = EgovStringUtil.clearXSS(request.getParameter("ans_2"),"");
			String ans_3 = EgovStringUtil.clearXSS(request.getParameter("ans_3"),"");
			String ans_4 = EgovStringUtil.clearXSS(request.getParameter("ans_4"),"");
			String ans_5 = EgovStringUtil.clearXSS(request.getParameter("ans_5"),"");
			String ans_6 = EgovStringUtil.clearXSS(request.getParameter("ans_6"),"");
			String ans_7 = EgovStringUtil.clearXSS(request.getParameter("ans_7"),"");
			
			String userIp = EgovClntInfo.getClntIP(request);
			
			int hpoint = Integer.parseInt(ans_1) + Integer.parseInt(ans_2) + Integer.parseInt(ans_3) + Integer.parseInt(ans_4);
			int hpoint2 = Integer.parseInt(ans_5) + Integer.parseInt(ans_6);
			float apoint = (float)(hpoint * 5) / 20;
			float apoint2 = (float)(hpoint2 * 5) / 10;
			
			MtSurveyVO msvo = new MtSurveyVO();
			msvo.setCounsel_idx(counsel_idx);
			msvo.setW_id(user.getUs_id());
			msvo.setW_name(user.getUs_name());
			msvo.setAns_1(ans_1);
			msvo.setAns_2(ans_2);
			msvo.setAns_3(ans_3);
			msvo.setAns_4(ans_4);
			msvo.setAns_5(ans_5);
			msvo.setAns_6(ans_6);
			msvo.setAns_7(ans_7);
			msvo.setHpoint(hpoint);
			msvo.setApoint(apoint);
			msvo.setHpoint2(hpoint2);
			msvo.setApoint2(apoint2);
			msvo.setCom_ip(userIp);
			mtSurveyService.insertMtSurvey_info(msvo);
			
			MemtoVO mvo = new MemtoVO();
			mvo.setIdx(Integer.parseInt(counsel_idx));
			mvo.setStatus("5");
			mvo.setPoint(apoint);
			mvo.setPoint2(apoint2);
			memtoService.changeMemto_point(mvo);
			
			modelAndView.addObject("result", "Y");
			
			//사용자 로그 저장
	        //String userIp = EgovClntInfo.getClntIP(request);
			MemlogVO memlogvo = new MemlogVO();
			memlogvo.setGubunx("기업상담 처리완료 상태로 변경");
			memlogvo.setSubject("작업자:"+user.getUs_name() + " ID: " + user.getUs_id());
			memlogvo.setM_id(user.getUs_id());
			memlogvo.setCom_ip(userIp);
			memlogService.insertMemlog(memlogvo);
	        /////로그 저장 완료
		}
		
		return modelAndView;
	}
	
}
