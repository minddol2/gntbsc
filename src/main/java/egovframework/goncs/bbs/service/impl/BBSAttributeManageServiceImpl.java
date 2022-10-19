package egovframework.goncs.bbs.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.EgovComponentChecker;
import egovframework.goncs.bbs.service.BoardMaster;
import egovframework.goncs.bbs.service.BoardMasterVO;
import egovframework.goncs.bbs.service.BoardUseInf;
import egovframework.goncs.bbs.service.BBSAttributeManageService;


import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

/**
 * 게시판 속성관리를 위한 서비스 구현 클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.3.24  이삼섭          최초 생성
 *   2009.06.26	한성곤		2단계 기능 추가 (댓글관리, 만족도조사)
 *   2011.09.15 서준식       댓글, 만족도 조사 적용 방법 변경
 * </pre>
 */
@Service("BBSAttributeManageService")
public class BBSAttributeManageServiceImpl extends EgovAbstractServiceImpl implements BBSAttributeManageService {

    @Resource(name = "BBSAttributeManageDAO")
    private BBSAttributeManageDAO attrbMngDAO;

    @Resource(name = "BBSUseInfoManageDAO")
    private BBSUseInfoManageDAO bbsUseDAO;

    //---------------------------------
    // 2009.06.26 : 2단계 기능 추가
    //---------------------------------
    @Resource(name = "BBSAddedOptionsDAO")
    private BBSAddedOptionsDAO addedOptionsDAO;
    ////-------------------------------
		
    /**
     * 게시판 속성정보 한 건을 상세조회한다.
     * 
     */
    public BoardMasterVO selectBBSMasterInf(BoardMaster searchVO) throws Exception {
	//---------------------------------
	// 2009.06.26 : 2단계 기능 추가
	//---------------------------------
	//return attrbMngDAO.selectBBSMasterInf(searchVO);

	BoardMasterVO result = attrbMngDAO.selectBBSMasterInf(searchVO);
	//System.out.println("battms2");

	//String flag = EgovProperties.getProperty("Globals.addedOptions");
	//if (flag != null && flag.trim().equalsIgnoreCase("true")) {
	if(EgovComponentChecker.hasComponent("BBSCommentService") || EgovComponentChecker.hasComponent("BBSSatisfactionService")){//2011.09.15
		//System.out.println("battms3");
	    BoardMasterVO options = addedOptionsDAO.selectAddedOptionsInf(searchVO);
	    //System.out.println("battms4");
	    
	    if (options != null) {
	    	if (options.getCommentAt().equals("Y")) {
	    		result.setOption("comment");
	    	}

	    	if (options.getStsfdgAt().equals("Y")) {
	    		result.setOption("stsfdg");
	    	}
	    } else {
	    	result.setOption("na");	// 미지정 상태로 수정 가능 (이미 지정된 경우는 수정 불가로 처리)
	    }
	}

	return result;
	////-------------------------------
	
    }


    /**
     * 템플릿의 유효여부를 점검한다.
     * 
     * @see egovframework.com.cop.bbs.brd.service.EgovBBSAttributeManageService#validateTemplate(egovframework.com.cop.bbs.brd.service.BoardMasterVO)
     */
    public void validateTemplate(BoardMasterVO searchVO) throws Exception {
    	egovLogger.debug("validateTemplate method ignored...");
    }

}
