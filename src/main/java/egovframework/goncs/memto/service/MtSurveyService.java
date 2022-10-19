package egovframework.goncs.memto.service;

import java.util.List;

import egovframework.goncs.memto.service.MtSurveyVO;

public interface MtSurveyService {

	public List<MtSurveyVO> selectMtSurveyList(String counsel_idx) throws Exception;

	public int selectMtSurveyListCnt(String counsel_idx) throws Exception;

	public MtSurveyVO selectMtSurvey(int idx) throws Exception;

	public MtSurveyVO selectMtSurvey2(String counsel_idx) throws Exception;

	public void insertMtSurvey_info(MtSurveyVO vo) throws Exception;

	public void deleteMtSurvey(int idx) throws Exception;

}