package egovframework.goncs.memto.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.goncs.memto.service.StatisVO;

@Repository("statisDAO")
public class StatisDAO extends EgovComAbstractDAO {

	public StatisVO selectStatis1(StatisVO vo){
        return (StatisVO) select("statisDAO.selectStatis1", vo);
    }
	
	@SuppressWarnings("unchecked")
	public List<StatisVO> selectStatis2List(StatisVO vo) throws Exception {
        return (List<StatisVO>) list("statisDAO.selectStatis2List", vo);
    }
	
}
