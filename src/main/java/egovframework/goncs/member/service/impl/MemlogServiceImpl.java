package egovframework.goncs.member.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.goncs.member.service.MemlogService;
import egovframework.goncs.member.service.MemlogVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("memlogService")
public class MemlogServiceImpl extends EgovAbstractServiceImpl implements MemlogService {

	@Resource(name = "memlogDAO")
    private MemlogDAO memlogDAO;
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.member.service.impl.MemlogService#selectMemlogList(egovframework.goncs.member.service.MemlogVO)
	 */
	@Override
	public List<MemlogVO> selectMemlogList(MemlogVO vo) throws Exception {
    	return memlogDAO.selectMemlogList(vo);
    }
    
    /* (non-Javadoc)
	 * @see egovframework.goncs.member.service.impl.MemlogService#selectMemlogListCnt(egovframework.goncs.member.service.MemlogVO)
	 */
	@Override
	public int selectMemlogListCnt(MemlogVO vo) throws Exception {
		return memlogDAO.selectMemlogListCnt(vo);
	}
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.member.service.impl.MemlogService#insertMemlog(egovframework.goncs.member.service.MemlogVO)
	 */
	@Override
	public void insertMemlog(MemlogVO vo) throws Exception {
		memlogDAO.insertMemlog(vo);
	}
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.member.service.impl.MemlogService#deleteMemlog(int)
	 */
	@Override
	public void deleteMemlog(int idx) throws Exception {
		memlogDAO.deleteMemlog(idx);
	}
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.member.service.impl.MemlogService#selectMemlogListXls(egovframework.goncs.member.service.MemlogVO)
	 */
	@Override
	public List<MemlogVO> selectMemlogListXls(MemlogVO vo) throws Exception {
    	return memlogDAO.selectMemlogListXls(vo);
    }
	
}
