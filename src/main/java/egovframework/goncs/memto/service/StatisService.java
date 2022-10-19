package egovframework.goncs.memto.service;

import java.util.List;

import egovframework.goncs.memto.service.StatisVO;

public interface StatisService {

	public StatisVO selectStatis1(StatisVO vo) throws Exception;

	public List<StatisVO> selectStatis2List(StatisVO vo) throws Exception;

}