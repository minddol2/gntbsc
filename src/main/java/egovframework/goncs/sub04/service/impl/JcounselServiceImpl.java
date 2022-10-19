package egovframework.goncs.sub04.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.goncs.sub04.service.JcounselService;
import egovframework.goncs.sub04.service.JcounselVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("jcounselService")
public class JcounselServiceImpl extends EgovAbstractServiceImpl implements JcounselService {

	@Resource(name = "jcounselDAO")
    private JcounselDAO jcounselDAO;
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.sub04.service.impl.JcounselService#selectJcounselList(egovframework.goncs.sub04.service.JcounselVO)
	 */
	@Override
	public List<JcounselVO> selectJcounselList(JcounselVO vo) throws Exception {
        return jcounselDAO.selectJcounselList(vo);
    }
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.sub04.service.impl.JcounselService#selectJcounselListw(egovframework.goncs.sub04.service.JcounselVO)
	 */
	@Override
	public List<JcounselVO> selectJcounselListw(JcounselVO vo) throws Exception {
        return jcounselDAO.selectJcounselListw(vo);
    }
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.sub04.service.impl.JcounselService#selectJcounselListCnt(egovframework.goncs.sub04.service.JcounselVO)
	 */
	@Override
	public int selectJcounselListCnt(JcounselVO vo) throws Exception {
		return jcounselDAO.selectJcounselListCnt(vo);
	}
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.sub04.service.impl.JcounselService#insertJcounsel_info(egovframework.goncs.sub04.service.JcounselVO)
	 */
	@Override
	public void insertJcounsel_info(JcounselVO vo) throws Exception {
		jcounselDAO.insertJcounsel_info(vo);
	}
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.sub04.service.impl.JcounselService#updateJcounsel_info(egovframework.goncs.sub04.service.JcounselVO)
	 */
	@Override
	public void updateJcounsel_info(JcounselVO vo) throws Exception {
		jcounselDAO.updateJcounsel_info(vo);
	}
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.sub04.service.impl.JcounselService#changeJcounsel_info(egovframework.goncs.sub04.service.JcounselVO)
	 */
	@Override
	public void changeJcounsel_info(JcounselVO vo) throws Exception {
		jcounselDAO.changeJcounsel_info(vo);
	}
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.sub04.service.impl.JcounselService#selectJcounsel(egovframework.goncs.sub04.service.JcounselVO)
	 */
	@Override
	public JcounselVO selectJcounsel(JcounselVO vo) throws Exception {
        return jcounselDAO.selectJcounsel(vo);
    }
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.sub04.service.impl.JcounselService#selectJcounsel2(egovframework.goncs.sub04.service.JcounselVO)
	 */
	@Override
	public JcounselVO selectJcounsel2(JcounselVO vo) throws Exception {
        return jcounselDAO.selectJcounsel2(vo);
    }
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.sub04.service.impl.JcounselService#selectJcounsel3(int)
	 */
	@Override
	public JcounselVO selectJcounsel3(int idx) throws Exception {
        return jcounselDAO.selectJcounsel3(idx);
    }
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.sub04.service.impl.JcounselService#deleteJcounsel(int)
	 */
	@Override
	public void deleteJcounsel(int idx) throws Exception {
		jcounselDAO.deleteJcounsel(idx);
	}
	
	@Override
	public List<JcounselVO> selectJcounselXls(JcounselVO vo) throws Exception {
        return jcounselDAO.selectJcounselXls(vo);
    }
}
