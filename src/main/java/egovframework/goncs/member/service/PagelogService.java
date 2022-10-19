package egovframework.goncs.member.service;

import java.util.List;

import egovframework.goncs.member.service.PageLogVO;

public interface PagelogService {

	public List<PageLogVO> selectPagelogList(PageLogVO vo) throws Exception;

	/** 건수 */
	public int selectPagelogListCnt(PageLogVO vo) throws Exception;

	/** 추가 **/
	public void insertPagelog(PageLogVO vo) throws Exception;

	/** 삭제 **/
	public void deletePagelog(int idx) throws Exception;

	public List<PageLogVO> selectPagelogListXls(PageLogVO vo) throws Exception;

}