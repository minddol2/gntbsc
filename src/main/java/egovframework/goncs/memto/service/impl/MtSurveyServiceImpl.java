package egovframework.goncs.memto.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.goncs.memto.service.MtSurveyService;
import egovframework.goncs.memto.service.MtSurveyVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("mtSurveyService")
public class MtSurveyServiceImpl extends EgovAbstractServiceImpl implements MtSurveyService {

	@Resource(name = "mtSurveyDAO")
    private MtSurveyDAO mtSurveyDAO;
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.memto.service.impl.MtSurveyService#selectMtSurveyList(java.lang.String)
	 */
	@Override
	public List<MtSurveyVO> selectMtSurveyList(String counsel_idx) throws Exception {
        return mtSurveyDAO.selectMtSurveyList(counsel_idx);
    }
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.memto.service.impl.MtSurveyService#selectMtSurveyListCnt(java.lang.String)
	 */
	@Override
	public int selectMtSurveyListCnt(String counsel_idx) throws Exception {
		return mtSurveyDAO.selectMtSurveyListCnt(counsel_idx);
	}
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.memto.service.impl.MtSurveyService#selectMtSurvey(int)
	 */
	@Override
	public MtSurveyVO selectMtSurvey(int idx) throws Exception {
        return mtSurveyDAO.selectMtSurvey(idx);
    }
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.memto.service.impl.MtSurveyService#selectMtSurvey2(java.lang.String)
	 */
	@Override
	public MtSurveyVO selectMtSurvey2(String counsel_idx) throws Exception {
        return mtSurveyDAO.selectMtSurvey2(counsel_idx);
    }
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.memto.service.impl.MtSurveyService#insertMtSurvey_info(egovframework.goncs.memto.service.MtSurveyVO)
	 */
	@Override
	public void insertMtSurvey_info(MtSurveyVO vo) throws Exception {
		mtSurveyDAO.insertMtSurvey_info(vo);
	}
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.memto.service.impl.MtSurveyService#deleteMtSurvey(int)
	 */
	@Override
	public void deleteMtSurvey(int idx) throws Exception {
		mtSurveyDAO.deleteMtSurvey(idx);
	}
}
