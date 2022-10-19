package egovframework.goncs.memto.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.goncs.memto.service.MemtoService;
import egovframework.goncs.memto.service.MemtoVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("memtoService")
public class MemtoServiceImpl extends EgovAbstractServiceImpl implements MemtoService {

	@Resource(name = "memtoDAO")
    private MemtoDAO memtoDAO;
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.memto.service.impl.MemtoService#selectMemtoList(egovframework.goncs.memto.service.MemtoVO)
	 */
	@Override
	public List<MemtoVO> selectMemtoList(MemtoVO vo) throws Exception {
        return memtoDAO.selectMemtoList(vo);
    }
	
	@Override
	public List<MemtoVO> selectMemtoXls(MemtoVO vo) throws Exception {
        return memtoDAO.selectMemtoXls(vo);
    }
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.memto.service.impl.MemtoService#selectMemtoListCnt(egovframework.goncs.memto.service.MemtoVO)
	 */
	@Override
	public int selectMemtoListCnt(MemtoVO vo) throws Exception {
		return memtoDAO.selectMemtoListCnt(vo);
	}
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.memto.service.impl.MemtoService#selectMemto(egovframework.goncs.memto.service.MemtoVO)
	 */
	@Override
	public MemtoVO selectMemto(int idx) throws Exception {
        return memtoDAO.selectMemto(idx);
    }
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.memto.service.impl.MemtoService#insertMemto_info(egovframework.goncs.memto.service.MemtoVO)
	 */
	@Override
	public void insertMemto_info(MemtoVO vo) throws Exception {
		memtoDAO.insertMemto_info(vo);
	}
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.memto.service.impl.MemtoService#updateMemto_info(egovframework.goncs.memto.service.MemtoVO)
	 */
	@Override
	public void updateMemto_info(MemtoVO vo) throws Exception {
		memtoDAO.updateMemto_info(vo);
	}
	
	@Override
	public void updateMemto_gbn(MemtoVO vo) throws Exception {
		memtoDAO.updateMemto_gbn(vo);
	}
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.memto.service.impl.MemtoService#changeMemto_info(egovframework.goncs.memto.service.MemtoVO)
	 */
	@Override
	public void changeMemto_info(MemtoVO vo) throws Exception {
		memtoDAO.changeMemto_info(vo);
	}
	
	@Override
	public void changeMemto_hit(int idx) throws Exception {
		memtoDAO.changeMemto_hit(idx);
	}
	
	@Override
	public void changeMemto_coment(int idx) throws Exception {
		memtoDAO.changeMemto_coment(idx);
	}
	
	@Override
	public void changeMemto_coment2(int idx) throws Exception {
		memtoDAO.changeMemto_coment2(idx);
	}
	
	@Override
	public void changeMemto_point(MemtoVO vo) throws Exception {
		memtoDAO.changeMemto_point(vo);
	}
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.memto.service.impl.MemtoService#deleteMemto(int)
	 */
	@Override
	public void deleteMemto(int idx) throws Exception {
		memtoDAO.deleteMemto(idx);
	}
	
	@Override
	public void changeMemto_info24() throws Exception {
		memtoDAO.changeMemto_info24();
	}
	
	@Override
	public List<MemtoVO> selectMemtoList4() throws Exception {
        return memtoDAO.selectMemtoList4();
    }
	
	@Override
	public void changeMemto_info24sms(int idx) throws Exception {
		memtoDAO.changeMemto_info24sms(idx);
	}
	
}
