package egovframework.goncs.wssms;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
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
import egovframework.goncs.member.service.LoginVO;
import egovframework.goncs.member.service.McodeService;
import egovframework.goncs.member.service.McodeVO;
import egovframework.goncs.member.service.MemberService;
import egovframework.goncs.member.service.MemberVO;
import egovframework.goncs.member.service.MemlogService;
import egovframework.goncs.member.service.MemlogVO;
import egovframework.goncs.member.service.PageLogVO;
import egovframework.goncs.member.service.PagelogService;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class Sb01Controller {

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
	
	/** McodeService */
	@Resource(name = "mcodeService")
	private McodeService mcodeService;
	
	@Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(Sb01Controller.class);
	
	public static final int BUFF_SIZE = 2048;
	
	public String cellValue(Cell cell) {
		 
        String value = null;
        if (cell == null) value = "";
        else {
            switch (cell.getCellType()) { //cell 타입에 따른 데이타 저장
            case Cell.CELL_TYPE_FORMULA:
                value = cell.getCellFormula();
                value = value.trim();
                break;
            case Cell.CELL_TYPE_NUMERIC:
                value = "" + String.format("%d", (int)(cell.getNumericCellValue()));
                value = value.trim();
                break;
            case Cell.CELL_TYPE_STRING:
                value = "" + cell.getStringCellValue();
                value = value.trim();
                break;
            case Cell.CELL_TYPE_BLANK:
                //value=""+cell.getBooleanCellValue();
                value = "";
                break;
            case Cell.CELL_TYPE_ERROR:
                value = "" + cell.getErrorCellValue();
                value = value.trim();
                break;
            default:
            }
        }
 
        return value.trim();
    }
	
	/* 사용자목록 화면 */
	@RequestMapping(value = "/sb01/sub01.do")
	public String get_sb01_sub01(@ModelAttribute("searchVO") MemberVO searchVO, HttpServletRequest request, ModelMap model, RedirectAttributes rttr) throws Exception{
		
		// 1. Spring Security 사용자권한 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			rttr.addFlashAttribute("resultMsg", "로그인 후 이용이 가능합니다.");		
			return "redirect:/wssms/LoginUsr.do";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		int us_level = user.getUs_level();
		model.addAttribute("user", user);
		int m_level = user.getUs_level();
		if(m_level > 2) {
			return "redirect:/wssms/LoginUsr.do";
		}
		
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
		List<MemberVO> mem_list = memberService.selectMemberList(searchVO);
		totCnt = memberService.selectMemberListCnt(searchVO);
		
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("mem_list", mem_list);
		model.addAttribute("totCnt", totCnt);
		
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
		//사용자 로그 저장
        String userIp = EgovClntInfo.getClntIP(request);
        PageLogVO pagelogvo = new PageLogVO();
        pagelogvo.setPage_name("사용자 목록");
        pagelogvo.setM_id(user.getUs_id());
        pagelogvo.setCom_ip(userIp);
        pagelogService.insertPagelog(pagelogvo);
        /////로그 저장 완료
		
		return "egovframework/gntbsc/wssms/sub01_01";
	}
	
	/* 사용자 등록 수정 화면 */
	@RequestMapping(value = "/sb01/sub01_write.do")
	public String write_Sb01_sub01(@ModelAttribute("searchVO") MemberVO searchVO, HttpServletRequest request, ModelMap model, RedirectAttributes rttr) throws Exception{
		
		// 1. Spring Security 사용자권한 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			rttr.addFlashAttribute("resultMsg", "로그인 후 이용이 가능합니다.");		
			return "redirect:/wssms/LoginUsr.do";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		int us_level = user.getUs_level();
		model.addAttribute("user", user);
		int m_level = user.getUs_level();
		if(m_level > 2) {
			return "redirect:/wssms/LoginUsr.do";
		}
		
		if(us_level > 2) {
			rttr.addFlashAttribute("resultMsg", "접근권한이 없습니다");		
			return "redirect:/wssms/main.do";
		}
		
		String resultMsg = "";
		Map<String, ?> redirectMap = RequestContextUtils.getInputFlashMap(request);
		if(redirectMap != null) {
			resultMsg = (String)redirectMap.get("resultMsg");
		}
		model.addAttribute("resultMsg", resultMsg);
		
		MemberVO mem_result = new MemberVO();
		mem_result = memberService.selectMember(searchVO.getIdx());
		model.addAttribute("mem_result", mem_result);
		
		model.addAttribute("searchVO", searchVO);
		
		//사용자 로그 저장
        String userIp = EgovClntInfo.getClntIP(request);
        PageLogVO pagelogvo = new PageLogVO();
        pagelogvo.setPage_name("사용자 등록/수정.");
        pagelogvo.setM_id(user.getUs_id());
        pagelogvo.setCom_ip(userIp);
        pagelogService.insertPagelog(pagelogvo);
        /////로그 저장 완료
		
        if(mem_result.getUs_gbn().equals("1")) {
        	return "egovframework/gntbsc/wssms/sub01_01_write";
        } else if(mem_result.getUs_gbn().equals("2")) {
        	return "egovframework/gntbsc/wssms/sub01_01_write2";
        } else {
        	
			List<McodeVO> min_list1 = mcodeService.selectMcodeList(Integer.parseInt(mem_result.getUs_major11()));
			
			List<McodeVO> min_list2 = mcodeService.selectMcodeList(Integer.parseInt(mem_result.getUs_major21()));
			
			model.addAttribute("min_list1", min_list1);
			model.addAttribute("min_list2", min_list2);
        	
        	return "egovframework/gntbsc/wssms/sub01_01_write3";
        }
	}
	
	/* 사용자 등록 수정 처리 */
	@RequestMapping(value = "/sb01/sub01_Updt.do")
	public String save_Sb01_sub01(@ModelAttribute("searchVO") MemberVO searchVO, HttpServletRequest request, ModelMap model, RedirectAttributes rttr) throws Exception{
		
		// 1. Spring Security 사용자권한 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			rttr.addFlashAttribute("resultMsg", "로그인 후 이용이 가능합니다.");		
			return "redirect:/wssms/LoginUsr.do";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		int m_level = user.getUs_level();
		model.addAttribute("user", user);
		if(m_level > 2) {
			return "redirect:/wssms/LoginUsr.do";
		}
		
		// 접속IP
		String userIp = EgovClntInfo.getClntIP(request);
		LOGGER.debug("userIp : " + userIp);
		
		searchVO.setUs_name(EgovStringUtil.clearXSS(searchVO.getUs_name(),""));
		searchVO.setUs_position(EgovStringUtil.clearXSS(searchVO.getUs_position(),""));
		
		if( (searchVO == null) || (searchVO.getUs_id().equals("")) || (searchVO.getUs_name().equals("")) ) { 
			
			rttr.addFlashAttribute("resultMsg", "아이디를 확인하세요");
			return "redirect:/sb01/sub01_write.do";
		}
		
		//이미 등록된 자료가 있는지 체크
		MemberVO mem_result = new MemberVO();
		mem_result = memberService.selectMember(searchVO.getIdx());
		
		if(!searchVO.getUs_pw().equals("")) {
			String enpassword = EgovFileScrty.encryptPassword(searchVO.getUs_pw(), searchVO.getUs_id());
			searchVO.setUs_pw(enpassword);
		}
		
		if( (searchVO.getUs_gbn().equals("3")) && (searchVO.getUs_major11().equals("")) ) {
			searchVO.setUs_major11("0");
		}
		if( (searchVO.getUs_gbn().equals("3")) && (searchVO.getUs_major21().equals("")) ) {
			searchVO.setUs_major21("0");
		}
		if( (searchVO.getUs_gbn().equals("3")) && (searchVO.getUs_major12().equals("")) ) {
			searchVO.setUs_major12("0");
		}
		if( (searchVO.getUs_gbn().equals("3")) && (searchVO.getUs_major22().equals("")) ) {
			searchVO.setUs_major22("0");
		}
		
		if(searchVO.getIdx() == 0) {
			if(mem_result != null) {
				rttr.addFlashAttribute("resultMsg", "이미 등록된 아이디입니다");
				return "redirect:/sb01/sub01_write.do";
			}
			searchVO.setUs_regip(userIp);
			
			if(searchVO.getUs_gbn().equals("1")) {
				memberService.insertMember(searchVO);
			} else if(searchVO.getUs_gbn().equals("2")) {
				memberService.insertMember2(searchVO);
			} else {
				memberService.insertMember3(searchVO);
			}
		} else {
			System.out.println("us_gbn : " + searchVO.getUs_gbn());
			searchVO.setUs_modip(userIp);
			if(searchVO.getUs_gbn().equals("1")) {
				memberService.updateMember(searchVO);
			} else if(searchVO.getUs_gbn().equals("2")) {
				memberService.updateMember2(searchVO);
			} else {				
				memberService.updateMember3(searchVO);
			}
		}
		
		//사용자 로그 저장
        //String userIp = EgovClntInfo.getClntIP(request);
		MemlogVO memlogvo = new MemlogVO();
		memlogvo.setGubunx("사용자 등록/수정 저장 처리");
		memlogvo.setSubject("작업자:"+user.getUs_name() + " ID: " + searchVO.getUs_id() + " 이름: " + searchVO.getUs_name() + " 권한:" + searchVO.getUs_level());
		memlogvo.setM_id(user.getUs_id());
		memlogvo.setCom_ip(userIp);
		memlogService.insertMemlog(memlogvo);
        /////로그 저장 완료
		
        rttr.addFlashAttribute("resultMsg", "정상 등록되었습니다");
		return "redirect:/sb01/sub01.do";
	}
	
	/* 사용자 선택 삭제처리 */
	@RequestMapping(value = "/sb01/sub01_sdele.do")
	public String dele_Sb01_sub01(@RequestParam("idx") String[] idxs, HttpServletRequest request, ModelMap model, RedirectAttributes rttr) throws Exception{
		
		// 1. Spring Security 사용자권한 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			rttr.addFlashAttribute("resultMsg", "로그인 후 이용이 가능합니다.");		
			return "redirect:/wssms/LoginUsr.do";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		int m_level = user.getUs_level();
		if(m_level > 2) {
			return "redirect:/wssms/LoginUsr.do";
		}
		
		MemberVO mem_result = new MemberVO();
		
		//참여자인지 체크
		int totCnt = 0;
		int memCnt = 0;
		String del_list = "";
		for(int j=0; j < idxs.length; j++) {
			int idx = Integer.parseInt(idxs[j]);
			int del_pass = 0;
			
			mem_result = memberService.selectMember(idx);

			//System.out.println("삭제할 자료 : " + bi_code);
			if(mem_result == null) {
				rttr.addFlashAttribute("resultMsg", "삭제할 자료가 없습니다");
				del_pass = 1;
			}
						
			//삭제
			if(del_pass == 0) {
				memberService.deleteMember(mem_result.getUs_id());
				
				del_list = del_list + ", " + idx;
			}

		}

        //System.out.println("단계8");
		//사용자 로그 저장
        String userIp = EgovClntInfo.getClntIP(request);
        MemlogVO memlogvo = new MemlogVO();
		memlogvo.setGubunx("사용자 선택삭제 처리");
		memlogvo.setSubject("작업자:"+user.getUs_name() + " 삭제내용:" + del_list);
		memlogvo.setM_id(user.getUs_id());
		memlogvo.setCom_ip(userIp);
		memlogService.insertMemlog(memlogvo);
        /////로그 저장 완료
	
        //System.out.println("단계9");
        return "redirect:/sb01/sub01.do";
	}
	
	//사용자 엑셀 다운로드
	@RequestMapping(value = "/sb01/sub01_excel.do")
	public void excel_sb01_sub0101(@ModelAttribute("searchVO") MemberVO searchVO, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
        List<MemberVO> men_list;
        men_list = memberService.selectMemberListXlsm(searchVO);
        int totCnt = memberService.selectMemberListCnt(searchVO);
		
		// 워크북 생성
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("사용자목록");
		Row row = null;
		Cell cell = null;
		int rowNo = 0;
		int row_count = 0;
	
		// 헤더 생성
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellValue("No");
		cell = row.createCell(1);
		cell.setCellValue("아이디");
		cell = row.createCell(2);
		cell.setCellValue("이름");
		cell = row.createCell(3);
		cell.setCellValue("구분");
		cell = row.createCell(4);
		cell.setCellValue("휴대전화");
		cell = row.createCell(5);
		cell.setCellValue("권한");
		cell = row.createCell(6);
		cell.setCellValue("직급");
		cell = row.createCell(7);
		cell.setCellValue("기업구분");
		cell = row.createCell(8);
		cell.setCellValue("등록일자");
		cell = row.createCell(9);
		cell.setCellValue("SMS수신");
		cell = row.createCell(10);
		cell.setCellValue("메일수신");
		cell = row.createCell(11);
		cell.setCellValue("일자리정보수신");

		// 데이터 부분 생성
		int idx = 0;
		for(MemberVO rq_vo : men_list) {
			row = sheet.createRow(rowNo++);
			
			cell = row.createCell(0);
			cell.setCellValue(totCnt);
			cell = row.createCell(1);
			cell.setCellValue(rq_vo.getUs_id());
			cell = row.createCell(2);
			cell.setCellValue(rq_vo.getUs_name());
			cell = row.createCell(3);
			if(rq_vo.getUs_gbn().equals("1")) {
				cell.setCellValue("개인회원");
			} else if(rq_vo.getUs_gbn().equals("3")) {
				cell.setCellValue("멘토회원");
			} else {
				cell.setCellValue("기업/예비창업자");
			}
			cell = row.createCell(4);
			cell.setCellValue(rq_vo.getUs_phone());
			cell = row.createCell(5);
			if(rq_vo.getUs_level() == 1) {
				cell.setCellValue("최고관리자");
			} else if(rq_vo.getUs_level() == 2) {
				cell.setCellValue("일반관리자");
			} else if(rq_vo.getUs_level() == 3) {
				cell.setCellValue("사용자");
			} else {
				cell.setCellValue("비회원");
			}
			cell = row.createCell(6);
			cell.setCellValue(rq_vo.getUs_position());
			cell = row.createCell(7);
			if(rq_vo.getUs_buss_gbn().equals("1")) {
				cell.setCellValue("도내기업");
			} else if(rq_vo.getUs_buss_gbn().equals("2")) {
				cell.setCellValue("예비창업자");
			} else {
				cell.setCellValue("입주기업");
			}
			cell = row.createCell(8);
			cell.setCellValue(rq_vo.getUs_regdate());
			cell = row.createCell(9);
			cell.setCellValue(rq_vo.getUs_smschk());
			cell = row.createCell(10);
			cell.setCellValue(rq_vo.getUs_mailchk());
			cell = row.createCell(11);
			cell.setCellValue(rq_vo.getUs_workchk());
			
			totCnt--;
		}
		
		// 엑셀 출력
		String xls_file_name = URLEncoder.encode("사용자리스트.xls","utf-8");
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment;filename="+xls_file_name);
				
		wb.write(response.getOutputStream());
				
	}
}
