package egovframework.goncs.counts.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.goncs.counts.service.CountsService;
import egovframework.goncs.counts.service.CountsVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("countsService")
public class CountsServiceImpl extends EgovAbstractServiceImpl implements CountsService {

	@Resource(name = "countsDAO")
    private CountsDAO countsDAO;
	
	@Override
	public List<CountsVO> selectCountsList(CountsVO vo) throws Exception {
    	return countsDAO.selectCountsList(vo);
    }
	
	@Override
	public int selectCountsListCnt(CountsVO vo) throws Exception {
		
		return countsDAO.selectCountsListCnt(vo);
	}
	
	@Override
	public int selectCountsListPage(CountsVO vo) throws Exception {
		
		return countsDAO.selectCountsListPage(vo);
	}
	
	@Override
	public List<CountsVO> selectCountsListXls(CountsVO vo) throws Exception {
    	return countsDAO.selectCountsListXls(vo);
    }
	
	@Override
	public List<CountsVO> selectCountsList2(CountsVO vo) throws Exception {
    	return countsDAO.selectCountsList2(vo);
    }
    
	@Override
	public int selectCountsListCnt2(CountsVO vo) throws Exception {
		
		return countsDAO.selectCountsListCnt2(vo);
	}
	

	/** 추가 **/
	public void insertCounts(CountsVO vo) throws Exception {
		countsDAO.insertCounts(vo);
	}
	
	/** 요일별 **/
	@Override
	public List<CountsVO> selectCountsList3(CountsVO vo) throws Exception {
    	return countsDAO.selectCountsList3(vo);
    }
	
	@Override
	public int selectCountsListCnt3(CountsVO vo) throws Exception {
		
		return countsDAO.selectCountsListCnt3(vo);
	}
	
	/** 시간별 **/
	@Override
	public List<CountsVO> selectCountsList4(CountsVO vo) throws Exception {
    	return countsDAO.selectCountsList4(vo);
    }
	
	/** IP별 **/
	@Override
	public List<CountsVO> selectCountsList5(CountsVO vo) throws Exception {
    	return countsDAO.selectCountsList5(vo);
    }
	
	@Override
	public int selectCountsListPage5(CountsVO vo) throws Exception {
		
		return countsDAO.selectCountsListPage5(vo);
	}
	
	@Override
	public List<CountsVO> selectCountsListXls5(CountsVO vo) throws Exception {
    	return countsDAO.selectCountsListXls5(vo);
    }
	
	
}
