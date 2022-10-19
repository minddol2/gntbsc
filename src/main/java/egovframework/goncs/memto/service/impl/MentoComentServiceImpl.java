package egovframework.goncs.memto.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.goncs.memto.service.MentoComentService;
import egovframework.goncs.memto.service.MentoComentVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("mentoComentService")
public class MentoComentServiceImpl extends EgovAbstractServiceImpl implements MentoComentService {

	@Resource(name = "mentoComentDAO")
    private MentoComentDAO mentoComentDAO;
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.memto.service.impl.MentoComentService#selectMentoComentList(egovframework.goncs.memto.service.MentoComentVO)
	 */
	@Override
	public List<MentoComentVO> selectMentoComentList(String counsel_idx) throws Exception {
        return mentoComentDAO.selectMentoComentList(counsel_idx);
    }
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.memto.service.impl.MentoComentService#selectMentoComentListCnt(egovframework.goncs.memto.service.MentoComentVO)
	 */
	@Override
	public int selectMentoComentListCnt(String counsel_idx) throws Exception {
		return mentoComentDAO.selectMentoComentListCnt(counsel_idx);
	}
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.memto.service.impl.MentoComentService#selectMentoComent(int)
	 */
	@Override
	public MentoComentVO selectMentoComent(int idx) throws Exception {
        return mentoComentDAO.selectMentoComent(idx);
    }
	
	@Override
	public MentoComentVO selectMentoComent2(String counsel_idx) throws Exception {
        return mentoComentDAO.selectMentoComent2(counsel_idx);
    }
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.memto.service.impl.MentoComentService#insertMentoComent_info(egovframework.goncs.memto.service.MentoComentVO)
	 */
	@Override
	public void insertMentoComent_info(MentoComentVO vo) throws Exception {
		mentoComentDAO.insertMentoComent_info(vo);
	}
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.memto.service.impl.MentoComentService#updateMentoComent_info(egovframework.goncs.memto.service.MentoComentVO)
	 */
	@Override
	public void updateMentoComent_info(MentoComentVO vo) throws Exception {
		mentoComentDAO.updateMentoComent_info(vo);
	}
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.memto.service.impl.MentoComentService#deleteMentoComent(int)
	 */
	@Override
	public void deleteMentoComent(int idx) throws Exception {
		mentoComentDAO.deleteMentoComent(idx);
	}
	
}
