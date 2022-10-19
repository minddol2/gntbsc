package egovframework.goncs.memto.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.goncs.memto.service.StatisService;
import egovframework.goncs.memto.service.StatisVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("statisService")
public class StatisServiceImpl extends EgovAbstractServiceImpl implements StatisService {

	@Resource(name = "statisDAO")
    private StatisDAO statisDAO;
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.memto.service.impl.StatisService#selectStatis1(egovframework.goncs.memto.service.StatisVO)
	 */
	@Override
	public StatisVO selectStatis1(StatisVO vo) throws Exception {
        return statisDAO.selectStatis1(vo);
    }
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.memto.service.impl.StatisService#selectStatis2List(egovframework.goncs.memto.service.StatisVO)
	 */
	@Override
	public List<StatisVO> selectStatis2List(StatisVO vo) throws Exception {
        return statisDAO.selectStatis2List(vo);
    }
	
	
}
