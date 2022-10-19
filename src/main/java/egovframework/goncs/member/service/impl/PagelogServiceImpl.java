package egovframework.goncs.member.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.goncs.member.service.PageLogVO;
import egovframework.goncs.member.service.PagelogService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("pagelogService")
public class PagelogServiceImpl extends EgovAbstractServiceImpl implements PagelogService {

	@Resource(name = "pagelogDAO")
    private PagelogDAO pagelogDAO;
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.member.service.impl.PagelogService#selectPagelogList(egovframework.goncs.member.service.PageLogVO)
	 */
	@Override
	public List<PageLogVO> selectPagelogList(PageLogVO vo) throws Exception {
    	return pagelogDAO.selectPagelogList(vo);
    }
    
    /* (non-Javadoc)
	 * @see egovframework.goncs.member.service.impl.PagelogService#selectPagelogListCnt(egovframework.goncs.member.service.PageLogVO)
	 */
	@Override
	public int selectPagelogListCnt(PageLogVO vo) throws Exception {
		return pagelogDAO.selectPagelogListCnt(vo);
	}
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.member.service.impl.PagelogService#insertPagelog(egovframework.goncs.member.service.PageLogVO)
	 */
	@Override
	public void insertPagelog(PageLogVO vo) throws Exception {
		pagelogDAO.insertPagelog(vo);
	}
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.member.service.impl.PagelogService#deletePagelog(int)
	 */
	@Override
	public void deletePagelog(int idx) throws Exception {
		pagelogDAO.deletePagelog(idx);
	}
	
	@Override
	public List<PageLogVO> selectPagelogListXls(PageLogVO vo) throws Exception {
    	return pagelogDAO.selectPagelogListXls(vo);
    }
	
	
}
