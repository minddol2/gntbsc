package egovframework.goncs.member.service;

import java.util.List;

import egovframework.goncs.member.service.McodeVO;

public interface McodeService {

	public List<McodeVO> selectMcodeList(int maxcod) throws Exception;

}