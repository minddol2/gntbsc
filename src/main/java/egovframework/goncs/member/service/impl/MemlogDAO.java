package egovframework.goncs.member.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.goncs.member.service.MemlogVO;

@Repository("memlogDAO")
public class MemlogDAO extends EgovComAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<MemlogVO> selectMemlogList(MemlogVO vo) throws Exception {
        return (List<MemlogVO>) list("memlogDAO.selectMemlogList", vo);
    }
	
	/** 건수 */
	public int selectMemlogListCnt(MemlogVO vo) throws Exception{
        return (Integer) select("memlogDAO.selectMemlogListCnt", vo);
    }
	
	/** 추가 **/
	public void insertMemlog(MemlogVO vo) throws Exception {
		insert("memlogDAO.insertMemlog", vo);
	}
	
	/** 삭제 **/
	public void deleteMemlog(int idx) throws Exception {
		delete("memlogDAO.deleteMemlog", idx);
	}
	
	@SuppressWarnings("unchecked")
	public List<MemlogVO> selectMemlogListXls(MemlogVO vo) throws Exception {
        return (List<MemlogVO>) list("memlogDAO.selectMemlogListXls", vo);
    }
}
