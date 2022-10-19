package egovframework.goncs.member.service;

import java.util.List;

import egovframework.goncs.member.service.MemlogVO;

public interface MemlogService {

	public List<MemlogVO> selectMemlogList(MemlogVO vo) throws Exception;

	/** 건수 */
	public int selectMemlogListCnt(MemlogVO vo) throws Exception;

	/** 추가 **/
	public void insertMemlog(MemlogVO vo) throws Exception;

	/** 삭제 **/
	public void deleteMemlog(int idx) throws Exception;

	public List<MemlogVO> selectMemlogListXls(MemlogVO vo) throws Exception;

}