package egovframework.goncs.counts.service;

import java.util.List;

import egovframework.goncs.counts.service.CountsVO;

public interface CountsService {

	/** 일자별 **/
	public List<CountsVO> selectCountsList(CountsVO vo) throws Exception;
	public int selectCountsListCnt(CountsVO vo) throws Exception;
	public int selectCountsListPage(CountsVO vo) throws Exception;
	public List<CountsVO> selectCountsListXls(CountsVO vo) throws Exception;

	/** 월별 **/
	public List<CountsVO> selectCountsList2(CountsVO vo) throws Exception;
	public int selectCountsListCnt2(CountsVO vo) throws Exception;

	/** 추가 **/
	public void insertCounts(CountsVO vo) throws Exception;


	/** 요일별 **/
	public List<CountsVO> selectCountsList3(CountsVO vo) throws Exception;
	public int selectCountsListCnt3(CountsVO vo) throws Exception;
	
	/** 시간별 **/
	public List<CountsVO> selectCountsList4(CountsVO vo) throws Exception;
	
	/** IP별 **/
	public List<CountsVO> selectCountsList5(CountsVO vo) throws Exception;
	public int selectCountsListPage5(CountsVO vo) throws Exception;
	public List<CountsVO> selectCountsListXls5(CountsVO vo) throws Exception;
	
}