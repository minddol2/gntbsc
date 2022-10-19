package egovframework.goncs.memto;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.poi.ss.usermodel.DateUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.utl.sim.service.EgovClntInfo;
import egovframework.goncs.RoomRent.service.RoomRentVO;
import egovframework.goncs.member.service.LoginVO;
import egovframework.goncs.member.service.MemlogService;
import egovframework.goncs.member.service.MemlogVO;
import egovframework.goncs.memto.service.MemtoService;
import egovframework.goncs.memto.service.MemtoVO;
import egovframework.goncs.memto.service.MentoComentService;
import egovframework.goncs.memto.service.MentoComentVO;
import egovframework.goncs.sub04.SmsSend24;

@Controller
public class MentoComentController {
	
	/** MentoComentService */
	@Resource(name = "mentoComentService")
	private MentoComentService mentoComentService;
	
	/** MemtoService */
	@Resource(name = "memtoService")
	private MemtoService memtoService;
	
	/** MemlogService */
	@Resource(name = "memlogService")
	private MemlogService memlogService;

	/** log */
	private static final Logger LOGGER = LoggerFactory.getLogger(MentoComentController.class);
	
	//댓글 저장
	@RequestMapping(value = "/mtcmt/comt4_UpdtAjax.do")
	public ModelAndView save_mentocomment(HttpServletRequest request) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			modelAndView.addObject("comment", "N");
			
		} else {
			
			LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
			
			String counsel_idx = EgovStringUtil.clearXSS(request.getParameter("counsel_idx"),"");
			String content1 = EgovStringUtil.clearXSS(request.getParameter("content1"),"");
			
			String userIp = EgovClntInfo.getClntIP(request);
			
			MentoComentVO mcvo = new MentoComentVO();
			mcvo.setCounsel_idx(counsel_idx);
			mcvo.setW_id(user.getUs_id());
			mcvo.setW_name(user.getUs_name());
			mcvo.setCom_ip(userIp);
			mcvo.setContent1(content1);
			
			mentoComentService.insertMentoComent_info(mcvo);
			
			if(user.getUs_gbn().equals("3")) {
				//멘토 자동종료 시작
				memtoService.changeMemto_coment(Integer.parseInt(counsel_idx));
				
				MemtoVO memto_result = new MemtoVO();
				memto_result = memtoService.selectMemto(Integer.parseInt(counsel_idx));
				String us_mobile = memto_result.getUs_mobile().replace("-", "");
				
				SmsSend24.AuthSms();
				
				SmsSend24.Cafe24SmsSend(us_mobile, "멘토님이 상담글에 답변을 등록했습니다. 홈페이지를 확인해 주세요. -경남관광기업지원센터");
			}
			
			if(user.getUs_level() == 1) {
				
				MemtoVO memto_result = new MemtoVO();
				memto_result = memtoService.selectMemto(Integer.parseInt(counsel_idx));
				String us_mobile = memto_result.getUs_mobile().replace("-", "");
				
				SmsSend24.AuthSms();
				SmsSend24.Cafe24SmsSend(us_mobile, "관리자님이 상담글에 댓글을 등록했습니다. 홈페이지를 확인해 주세요. -경남관광기업지원센터");
			}
			
			//
			MentoComentVO cmt_row = new MentoComentVO();
			cmt_row = mentoComentService.selectMentoComent2(counsel_idx);
			
			String comment = "N";
			
			if(cmt_row != null) {
				String rdate = cmt_row.getReg_date().substring(0, 10);
				String edate = EgovDateUtil.addYearMonthDay(rdate, 0, 0, 2);
				
				java.text.SimpleDateFormat formatter2 = new java.text.SimpleDateFormat ("yyyyMMdd", java.util.Locale.KOREA);				
				String ndate = formatter2.format(new java.util.Date());
				
				comment = "";
				comment = comment + "<div class=\"board_comment\" id=\"comment_"+cmt_row.getIdx()+"\">";
				comment = comment + "<div class=\"comment_top\">";
				comment = comment + "<p class=\"tit\">"+cmt_row.getW_name()+" <span>작성일 : "+cmt_row.getReg_date()+"</span></p>";
				comment = comment + "<ul>";
				if(EgovDateUtil.getDaysDiff(ndate,edate) <= 2) {
					comment = comment + "<li><a href=\"javascript:modify_comment('"+cmt_row.getIdx()+"')#\" class=\"btn_edit\" >수정</a></li>";
					comment = comment + "&nbsp;<li><a href=\"javascript:delete_comment('"+cmt_row.getIdx()+"')\" >삭제</a></li>";
				}
				comment = comment + "</ul>";
				comment = comment + "</div>";
				comment = comment + "<div class=\"comment_box\">";
				comment = comment + "<p>"+cmt_row.getContent1()+"</p>";
				comment = comment + "</div>";
				comment = comment + "</div>";
				
				comment = comment + "<div class=\"board_comment\" id=\"ecomment_form_"+cmt_row.getIdx()+"\" style=\"display:none;\">";
				comment = comment + "<div class=\"comment_box\">";
				comment = comment + "<textarea name=\"econtent1\" id=\"econtent1_"+cmt_row.getIdx()+"'/>\" class=\"textarea\" wrap=\"hard\">"+cmt_row.getContent1()+"</textarea>";
				comment = comment + "<button type=\"button\" onclick=\"comment_eproc('"+cmt_row.getIdx()+"');\" >저장</button>";
				comment = comment + "</div>";
				comment = comment + "</div>";
			}
			
			modelAndView.addObject("comment", comment);
			
			//사용자 로그 저장
	        //String userIp = EgovClntInfo.getClntIP(request);
			MemlogVO memlogvo = new MemlogVO();
			memlogvo.setGubunx("기업상담 댓글 작성");
			memlogvo.setSubject("작업자:"+user.getUs_name() + " ID: " + user.getUs_id());
			memlogvo.setM_id(user.getUs_id());
			memlogvo.setCom_ip(userIp);
			memlogService.insertMemlog(memlogvo);
	        /////로그 저장 완료
		}
		
		return modelAndView;
	}
	
	//댓글 삭제
	@RequestMapping(value = "/mtcmt/comt4_DelAjax.do")
	public ModelAndView delete_mentocomment(HttpServletRequest request) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			modelAndView.addObject("result", "N");
			
		} else {
			
			LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
			
			String userIp = EgovClntInfo.getClntIP(request);
			
			String idx = EgovStringUtil.clearXSS(request.getParameter("idx"),"");
			
			MentoComentVO cmt_row = new MentoComentVO();
			cmt_row = mentoComentService.selectMentoComent(Integer.parseInt(idx));
			
			mentoComentService.deleteMentoComent(Integer.parseInt(idx));
			
			if(cmt_row.getUs_gbn().equals("3")) {
				//멘토 자동종료 시작
				memtoService.changeMemto_coment2(Integer.parseInt(cmt_row.getCounsel_idx()));
			}
			
			modelAndView.addObject("result", idx);
			
			//사용자 로그 저장
	        //String userIp = EgovClntInfo.getClntIP(request);
			MemlogVO memlogvo = new MemlogVO();
			memlogvo.setGubunx("기업상담 댓글 삭제");
			memlogvo.setSubject("작업자:"+user.getUs_name() + " ID: " + user.getUs_id() + " 내용:" + idx);
			memlogvo.setM_id(user.getUs_id());
			memlogvo.setCom_ip(userIp);
			memlogService.insertMemlog(memlogvo);
	        /////로그 저장 완료
			
		}
		return modelAndView;
	}
	
	//댓글 수정
	@RequestMapping(value = "/mtcmt/comt4_eUpdtAjax.do")
	public ModelAndView modify_mentocomment(HttpServletRequest request) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			modelAndView.addObject("comment", "N");
			
		} else {
			
			LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
			
			String counsel_idx = EgovStringUtil.clearXSS(request.getParameter("counsel_idx"),"");
			String idx = EgovStringUtil.clearXSS(request.getParameter("idx"),"");
			String content1 = EgovStringUtil.clearXSS(request.getParameter("content1"),"");
			
			String userIp = EgovClntInfo.getClntIP(request);
			
			MentoComentVO mcvo = new MentoComentVO();
			mcvo.setIdx(Integer.parseInt(idx));
			mcvo.setCom_ip(userIp);
			mcvo.setContent1(content1);
			
			mentoComentService.updateMentoComent_info(mcvo);
			
			if(user.getUs_gbn().equals("3")) {
				//멘토 자동종료 시작
				memtoService.changeMemto_coment(Integer.parseInt(counsel_idx));
			}
			
			//
			MentoComentVO cmt_row = new MentoComentVO();
			cmt_row = mentoComentService.selectMentoComent(Integer.parseInt(idx));
			
			String comment = "N";
			String ecoment = "";
			
			if(cmt_row != null) {
				String rdate = cmt_row.getReg_date().substring(0, 10);
				String edate = EgovDateUtil.addYearMonthDay(rdate, 0, 0, 2);
				
				java.text.SimpleDateFormat formatter2 = new java.text.SimpleDateFormat ("yyyyMMdd", java.util.Locale.KOREA);				
				String ndate = formatter2.format(new java.util.Date());
				
				comment = "";
				comment = comment + "<div class=\"comment_top\">";
				comment = comment + "<p class=\"tit\">"+cmt_row.getW_name()+" <span>작성일 : "+cmt_row.getReg_date()+"</span></p>";
				comment = comment + "<ul>";
				if(EgovDateUtil.getDaysDiff(ndate,edate) <= 2) {
					comment = comment + "<li><a href=\"javascript:modify_comment('"+cmt_row.getIdx()+"')#\" class=\"btn_edit\" >수정</a></li>";
					comment = comment + "&nbsp;<li><a href=\"javascript:delete_comment('"+cmt_row.getIdx()+"')\" >삭제</a></li>";
				}
				comment = comment + "</ul>";
				comment = comment + "</div>";
				comment = comment + "<div class=\"comment_box\">";
				comment = comment + "<p>"+cmt_row.getContent1()+"</p>";
				comment = comment + "</div>";
				
				ecoment = ecoment + "<div class=\"comment_box\">";
				ecoment = ecoment + "<textarea name=\"econtent1\" id=\"econtent1_"+cmt_row.getIdx()+"'/>\" class=\"textarea\" wrap=\"hard\">"+cmt_row.getContent1()+"</textarea>";
				ecoment = ecoment + "<button type=\"button\" onclick=\"comment_eproc('"+cmt_row.getIdx()+"');\" >저장</button>";
				ecoment = ecoment + "</div>";
			}
			modelAndView.addObject("comment", comment);
			modelAndView.addObject("ecoment", ecoment);
			
			//사용자 로그 저장
	        //String userIp = EgovClntInfo.getClntIP(request);
			MemlogVO memlogvo = new MemlogVO();
			memlogvo.setGubunx("기업상담 댓글 수정");
			memlogvo.setSubject("작업자:"+user.getUs_name() + " ID: " + user.getUs_id() + " 내용:" + idx);
			memlogvo.setM_id(user.getUs_id());
			memlogvo.setCom_ip(userIp);
			memlogService.insertMemlog(memlogvo);
	        /////로그 저장 완료
		}
		
		return modelAndView;
	}
	
}
