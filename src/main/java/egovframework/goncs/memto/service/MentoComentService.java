package egovframework.goncs.memto.service;

import java.util.List;

import egovframework.goncs.memto.service.MentoComentVO;

public interface MentoComentService {

	public List<MentoComentVO> selectMentoComentList(String counsel_idx) throws Exception;

	public int selectMentoComentListCnt(String counsel_idx) throws Exception;

	public MentoComentVO selectMentoComent(int idx) throws Exception;
	
	public MentoComentVO selectMentoComent2(String counsel_idx) throws Exception;

	public void insertMentoComent_info(MentoComentVO vo) throws Exception;

	public void updateMentoComent_info(MentoComentVO vo) throws Exception;

	public void deleteMentoComent(int idx) throws Exception;

}