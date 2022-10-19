package egovframework.goncs.member.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.goncs.member.service.PageLogVO;

@Repository("pagelogDAO")
public class PagelogDAO extends EgovComAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<PageLogVO> selectPagelogList(PageLogVO vo) throws Exception {
        return (List<PageLogVO>) list("pagelogDAO.selectPagelogList", vo);
    }
	
	/** 건수 */
	public int selectPagelogListCnt(PageLogVO vo) throws Exception{
        return (Integer) select("pagelogDAO.selectPagelogListCnt", vo);
    }
	
	/** 추가 **/
	public void insertPagelog(PageLogVO vo) throws Exception {
		insert("pagelogDAO.insertPagelog", vo);
	}
	
	/** 삭제 **/
	public void deletePagelog(int idx) throws Exception {
		delete("pagelogDAO.deletePagelog", idx);
	}
	
	@SuppressWarnings("unchecked")
	public List<PageLogVO> selectPagelogListXls(PageLogVO vo) throws Exception {
        return (List<PageLogVO>) list("pagelogDAO.selectPagelogListXls", vo);
    }
}
