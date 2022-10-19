package egovframework.goncs.memto.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.goncs.memto.service.MtSurveyVO;

@Repository("mtSurveyDAO")
public class MtSurveyDAO extends EgovComAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<MtSurveyVO> selectMtSurveyList(String counsel_idx) throws Exception {
        return (List<MtSurveyVO>) list("mtSurveyDAO.selectMtSurveyList", counsel_idx);
    }
	
	public int selectMtSurveyListCnt(String counsel_idx) throws Exception{
        return (Integer) select("mtSurveyDAO.selectMtSurveyListCnt", counsel_idx);
    }
	
	//조회
	public MtSurveyVO selectMtSurvey(int idx){
        return (MtSurveyVO) select("mtSurveyDAO.selectMtSurvey", idx);
    }
	
	public MtSurveyVO selectMtSurvey2(String counsel_idx){
        return (MtSurveyVO) select("mtSurveyDAO.selectMtSurvey2", counsel_idx);
    }
		
	//추가
	public void insertMtSurvey_info(MtSurveyVO vo) throws Exception {
		insert("mtSurveyDAO.insertMtSurvey_info", vo);
	}
		
	//삭제
	public void deleteMtSurvey(int idx) throws Exception {
		delete("mtSurveyDAO.deleteMtSurvey", idx);
	}	
}
