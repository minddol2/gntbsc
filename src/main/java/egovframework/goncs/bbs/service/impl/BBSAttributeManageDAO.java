package egovframework.goncs.bbs.service.impl;

import java.util.List;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.goncs.bbs.service.BoardMaster;
import egovframework.goncs.bbs.service.BoardMasterVO;

import org.springframework.stereotype.Repository;

/**
 * 게시판 속성정보 관리를 위한 데이터 접근 클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------      --------    ---------------------------
 *   2009.3.12  이삼섭          최초 생성
 *
 * </pre>
 */
@Repository("BBSAttributeManageDAO")
public class BBSAttributeManageDAO extends EgovComAbstractDAO {

    /**
     * 게시판 속성정보 한 건을 상세조회 한다.
     * 
     * @param BoardMasterVO
     */
    public BoardMasterVO selectBBSMasterInf(BoardMaster vo) throws Exception {
    	return (BoardMasterVO)select("BBSAttributeManageDAO.selectBBSMasterInf", vo);
    }

    /**
     * 템플릿의 유효여부를 점검한다.
     * 
     * @param BoardMasterVO
     */
    public boolean validateTemplate(BoardMasterVO vo) throws Exception {
    	return true;
    }

	
}
