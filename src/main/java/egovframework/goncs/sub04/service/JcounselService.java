package egovframework.goncs.sub04.service;

import java.util.List;

import egovframework.goncs.sub04.service.JcounselVO;

public interface JcounselService {

	public List<JcounselVO> selectJcounselList(JcounselVO vo) throws Exception;

	public List<JcounselVO> selectJcounselListw(JcounselVO vo) throws Exception;

	public int selectJcounselListCnt(JcounselVO vo) throws Exception;

	public void insertJcounsel_info(JcounselVO vo) throws Exception;

	public void updateJcounsel_info(JcounselVO vo) throws Exception;

	public void changeJcounsel_info(JcounselVO vo) throws Exception;

	public JcounselVO selectJcounsel(JcounselVO vo) throws Exception;

	public JcounselVO selectJcounsel2(JcounselVO vo) throws Exception;

	public JcounselVO selectJcounsel3(int idx) throws Exception;

	public void deleteJcounsel(int idx) throws Exception;
	
	public List<JcounselVO> selectJcounselXls(JcounselVO vo) throws Exception;

}