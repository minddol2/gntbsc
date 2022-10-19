package egovframework.goncs.memto.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.goncs.memto.service.MentoComentVO;

@Repository("mentoComentDAO")
public class MentoComentDAO extends EgovComAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<MentoComentVO> selectMentoComentList(String counsel_idx) throws Exception {
        return (List<MentoComentVO>) list("mentoComentDAO.selectMentoComentList", counsel_idx);
    }
	
	public int selectMentoComentListCnt(String counsel_idx) throws Exception{
        return (Integer) select("mentoComentDAO.selectMentoComentListCnt", counsel_idx);
    }
	
	//조회
	public MentoComentVO selectMentoComent(int idx){
        return (MentoComentVO) select("mentoComentDAO.selectMentoComent", idx);
    }
	
	public MentoComentVO selectMentoComent2(String counsel_idx){
        return (MentoComentVO) select("mentoComentDAO.selectMentoComent2", counsel_idx);
    }
		
	//추가
	public void insertMentoComent_info(MentoComentVO vo) throws Exception {
		insert("mentoComentDAO.insertMentoComent_info", vo);
	}
		
	//수정
	public void updateMentoComent_info(MentoComentVO vo) throws Exception {
		update("mentoComentDAO.updateMentoComent_info", vo);
	}
	
	//삭제
	public void deleteMentoComent(int idx) throws Exception {
		delete("mentoComentDAO.deleteMentoComent", idx);
	}
	
}
