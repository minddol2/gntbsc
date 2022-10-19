package egovframework.goncs.memto.service;

import java.util.List;

import egovframework.goncs.memto.service.MemtoVO;

public interface MemtoService {

	public List<MemtoVO> selectMemtoList(MemtoVO vo) throws Exception;
	
	public List<MemtoVO> selectMemtoXls(MemtoVO vo) throws Exception;

	public int selectMemtoListCnt(MemtoVO vo) throws Exception;

	public MemtoVO selectMemto(int idx) throws Exception;

	public void insertMemto_info(MemtoVO vo) throws Exception;

	public void updateMemto_info(MemtoVO vo) throws Exception;
	
	public void updateMemto_gbn(MemtoVO vo) throws Exception;

	public void changeMemto_info(MemtoVO vo) throws Exception;

	public void changeMemto_hit(int idx) throws Exception;
	
	public void changeMemto_coment(int idx) throws Exception;
	
	public void changeMemto_coment2(int idx) throws Exception;
	
	public void changeMemto_point(MemtoVO vo) throws Exception;

	public void deleteMemto(int idx) throws Exception;

	public void changeMemto_info24() throws Exception;
	
	public List<MemtoVO> selectMemtoList4() throws Exception;
	
	public void changeMemto_info24sms(int idx) throws Exception;
	
}