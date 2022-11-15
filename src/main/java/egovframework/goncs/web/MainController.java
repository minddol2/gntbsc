package egovframework.goncs.web;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.utl.sim.service.EgovClntInfo;
import egovframework.goncs.bbs.service.BBSAttributeManageService;
import egovframework.goncs.bbs.service.BBSManageService;
import egovframework.goncs.bbs.service.BoardMasterVO;
import egovframework.goncs.bbs.service.BoardVO;
import egovframework.goncs.counts.service.CountsService;
import egovframework.goncs.counts.service.CountsVO;
import egovframework.goncs.member.service.LoginVO;
import egovframework.goncs.member.service.MemberVO;
import egovframework.goncs.memto.service.MemtoService;
import egovframework.goncs.memto.service.MemtoVO;
import egovframework.goncs.sub04.SmsSend24;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class MainController {

    @Resource(name = "BBSManageService")
    private BBSManageService bbsMngService;

    @Resource(name = "BBSAttributeManageService")
    private BBSAttributeManageService bbsAttrbService;

    @Resource(name = "countsService")
    private CountsService countsService;

    /**
     * MemtoService
     */
    @Resource(name = "memtoService")
    private MemtoService memtoService;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

    @Resource(name = "egovMessageSource")
    EgovMessageSource egovMessageSource;

    private ApplicationContext applicationContext;

    private static final Logger LOGGER = LoggerFactory.getLogger(MainController.class);

    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;

        LOGGER.info("MainController setApplicationContext method has called!");
    }

    //@RequestMapping("/main/main.do")
    @RequestMapping(value = {"/main/main.do", "/main/main_test.do"})
    public String get_main(HttpServletRequest request, ModelMap model) throws Exception {

        BoardVO boardVO = new BoardVO();
        boardVO.setBbsId("BBSMSTR_000000000301");
        Map<String, Object> map = bbsMngService.selectBoard_Notice(boardVO);
        model.addAttribute("noticeList", map.get("resultList"));

        Map<String, Object> map2 = bbsMngService.selectBoard_Notice2(boardVO);
        model.addAttribute("noticeList2", map2.get("resultList"));

        BoardVO boardVO2 = new BoardVO();
        boardVO2.setBbsId("BBSMSTR_000000000302");
        Map<String, Object> map3 = bbsMngService.selectBoard_Notice(boardVO2);
        model.addAttribute("dataList", map3.get("resultList"));

        BoardVO boardVO4 = new BoardVO();
        boardVO4.setBbsId("BBSMSTR_000000000302");
        Map<String, Object> map4 = bbsMngService.selectBoard_Notice2(boardVO4);
        model.addAttribute("dataList2", map4.get("resultList"));

        BoardVO boardVO5 = new BoardVO();
        boardVO5.setBbsId("BBSMSTR_000000000308");
        Map<String, Object> map5 = bbsMngService.selectBoard_Popup(boardVO5);
        model.addAttribute("popzoneList", map5.get("resultList"));

        BoardVO boardVO6 = new BoardVO();
        boardVO6.setBbsId("BBSMSTR_000000000306");
        Map<String, Object> map6 = bbsMngService.selectBoard_Popup(boardVO6);
        model.addAttribute("poplist", map6.get("resultList"));

        BoardVO boardVO9 = new BoardVO();
        boardVO9.setBbsId("BBSMSTR_000000000309");
        Map<String, Object> map9 = bbsMngService.selectBoard_Comp(boardVO9);
        model.addAttribute("complist", map9.get("resultList"));

        BoardVO boardVO92 = new BoardVO();
        boardVO92.setBbsId("BBSMSTR_000000000309");
        Map<String, Object> map92 = bbsMngService.selectBoard_Comp2(boardVO92);
        model.addAttribute("complist2", map92.get("resultList"));

        String userAgent = request.getHeader("user-agent");
        System.out.println(userAgent);
        String moible_mode = "false";
        String appbrowser = "N";
        if (userAgent.indexOf("Mobi") > -1) {
            moible_mode = "true";
            if ((userAgent.indexOf("Mac OS") > 0 && userAgent.indexOf("Safari") <= 0)
                    || ((userAgent.indexOf("Android") > 0 && userAgent.indexOf("wv)") > 0))) {
                appbrowser = "Y";
            } else {
                appbrowser = "N";
            }
        } else {
            moible_mode = "false";
        }
        model.addAttribute("appbrowser", appbrowser);
        model.addAttribute("moible_mode", moible_mode);

        //접속 카운트
        String[] weekDayx = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "토요일"};
        String ct_ip = EgovClntInfo.getClntIP(request);
        HttpSession session = request.getSession();
        String userIp = (String) session.getAttribute("userIp");
        System.out.println("ct_ip : " + ct_ip);
        System.out.println("userIp : " + userIp);
        if (userIp == null || !userIp.equals(ct_ip)) {
            session.setAttribute("userIp", ct_ip);
            Calendar mon = Calendar.getInstance();
            java.text.SimpleDateFormat formatter1 = new java.text.SimpleDateFormat("yyyy", java.util.Locale.KOREA);
            String ct_year = formatter1.format(new java.util.Date());
            java.text.SimpleDateFormat formatter2 = new java.text.SimpleDateFormat("yyyy-MM", java.util.Locale.KOREA);
            String ct_datex = formatter2.format(new java.util.Date());
            java.text.SimpleDateFormat formatter3 = new java.text.SimpleDateFormat("yyyy-MM-dd", java.util.Locale.KOREA);
            String ct_datexx = formatter3.format(new java.util.Date());
            System.out.println("단계1");
            //요일
            int iDayOfWeek = mon.get(Calendar.DAY_OF_WEEK);
            System.out.println("iDayOfWeek : " + iDayOfWeek);
            String ct_youle = weekDayx[iDayOfWeek];
            java.text.SimpleDateFormat formatter4 = new java.text.SimpleDateFormat("HH:mm", java.util.Locale.KOREA);
            String ct_timex = formatter4.format(new java.util.Date());
            String ct_location = "";
            String ct_page = request.getRequestURI().toString();
            String ct_pc = "PC";

            CountsVO cvo = new CountsVO();
            cvo.setCt_year(ct_year);
            cvo.setCt_datex(ct_datex);
            cvo.setCt_datexx(ct_datexx);
            cvo.setCt_youle(ct_youle);
            cvo.setCt_timex(ct_timex);
            cvo.setCt_ip(ct_ip);
            cvo.setCt_location(ct_location);
            cvo.setCt_pc(ct_pc);
            cvo.setCt_page(ct_page);
            countsService.insertCounts(cvo);

        }
        System.out.println("단계22");
        //접속 카운트

        //마지막 댓글 24시간 후 자동 완료 처리
        memtoService.changeMemto_info24();

        System.out.println("자동 완료처리");

        //완료처리 3일 이내에 설문 작성이 안된 글에 문자 발송
        List<MemtoVO> mt_list = memtoService.selectMemtoList4();

        for (MemtoVO mt_vo : mt_list) {

            if (mt_vo.getStr_date() != null && !mt_vo.getStr_date().equals("") && !mt_vo.getUs_mobile().equals("")) {

                int idx = mt_vo.getIdx();
                String mobile = mt_vo.getUs_mobile();
                SmsSend24.AuthSms();

                SmsSend24.Cafe24SmsSend(mobile, "상담이 완료되었습니다. 홈페이지에서 설문조사를 작성해 주세요. -경남관광기업지원센터");

                System.out.println(mobile + "문자 발송 완료");

                memtoService.changeMemto_info24sms(idx);
            }
        }
        System.out.println("문자 발송 완료");


        String resultMsg = "";
        Map<String, ?> redirectMap = RequestContextUtils.getInputFlashMap(request);
        if (redirectMap != null) {
            resultMsg = (String) redirectMap.get("resultMsg");
        }

        model.addAttribute("resultMsg", resultMsg);

        //return "egovframework/gntbsc/main/main";
        String requestUrl = (String) request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);
        String returnUrl = "";
        System.out.println("url test start");
        System.out.println(requestUrl);
        System.out.println("url test end");
        if(requestUrl.equals("/main/main.do")){
            returnUrl = "egovframework/gntbsc/main/main";
        }else if(requestUrl.equals("/main/main_test.do")){
            returnUrl = "egovframework/gntbsc/main/main_test";
        }else{
            returnUrl = "egovframework/gntbsc/main/main";
        }

        return returnUrl;
    }


}
