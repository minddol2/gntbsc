package egovframework.goncs.counts.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.goncs.counts.service.CountsVO;

@Repository("countsDAO")
public class CountsDAO extends EgovComAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<CountsVO> selectCountsList(CountsVO vo) throws Exception {
        return (List<CountsVO>) list("countsDAO.selectCountsList", vo);
    }
	
	public int selectCountsListCnt(CountsVO vo) throws Exception{
        return (Integer) select("countsDAO.selectCountsListCnt", vo);
    }

	public int selectCountsListPage(CountsVO vo) throws Exception{
        return (Integer) select("countsDAO.selectCountsListPage", vo);
    }

	@SuppressWarnings("unchecked")
	public List<CountsVO> selectCountsListXls(CountsVO vo) throws Exception {
        return (List<CountsVO>) list("countsDAO.selectCountsListXls", vo);
    }
	
	@SuppressWarnings("unchecked")
	public List<CountsVO> selectCountsList2(CountsVO vo) throws Exception {
        return (List<CountsVO>) list("countsDAO.selectCountsList2", vo);
    }
	
	public int selectCountsListCnt2(CountsVO vo) throws Exception{
        return (Integer) select("countsDAO.selectCountsListCnt2", vo);
    }

	/** 추가 **/
	public void insertCounts(CountsVO vo) throws Exception {
		insert("countsDAO.insertCounts", vo);
	}
	
	/** 요일별 **/
	@SuppressWarnings("unchecked")
	public List<CountsVO> selectCountsList3(CountsVO vo) throws Exception {
        return (List<CountsVO>) list("countsDAO.selectCountsList3", vo);
    }
	
	public int selectCountsListCnt3(CountsVO vo) throws Exception{
        return (Integer) select("countsDAO.selectCountsListCnt3", vo);
    }

	/** 시간별 **/
	@SuppressWarnings("unchecked")
	public List<CountsVO> selectCountsList4(CountsVO vo) throws Exception {
        return (List<CountsVO>) list("countsDAO.selectCountsList4", vo);
    }
	
	/** 아이피별 **/
	@SuppressWarnings("unchecked")
	public List<CountsVO> selectCountsList5(CountsVO vo) throws Exception {
        return (List<CountsVO>) list("countsDAO.selectCountsList5", vo);
    }
	
	public int selectCountsListPage5(CountsVO vo) throws Exception{
        return (Integer) select("countsDAO.selectCountsListPage5", vo);
    }

	@SuppressWarnings("unchecked")
	public List<CountsVO> selectCountsListXls5(CountsVO vo) throws Exception {
        return (List<CountsVO>) list("countsDAO.selectCountsListXls5", vo);
    }
	
}
