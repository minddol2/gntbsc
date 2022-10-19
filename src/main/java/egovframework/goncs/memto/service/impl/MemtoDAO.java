package egovframework.goncs.memto.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.goncs.memto.service.MemtoVO;

@Repository("memtoDAO")
public class MemtoDAO extends EgovComAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<MemtoVO> selectMemtoList(MemtoVO vo) throws Exception {
        return (List<MemtoVO>) list("memtoDAO.selectMemtoList", vo);
    }
	
	@SuppressWarnings("unchecked")
	public List<MemtoVO> selectMemtoXls(MemtoVO vo) throws Exception {
        return (List<MemtoVO>) list("memtoDAO.selectMemtoXls", vo);
    }
	
	public int selectMemtoListCnt(MemtoVO vo) throws Exception{
        return (Integer) select("memtoDAO.selectMemtoListCnt", vo);
    }
	
	//조회
	public MemtoVO selectMemto(int idx){
        return (MemtoVO) select("memtoDAO.selectMemto", idx);
    }
	
	//추가
	public void insertMemto_info(MemtoVO vo) throws Exception {
		insert("memtoDAO.insertMemto_info", vo);
	}
	
	//수정
	public void updateMemto_info(MemtoVO vo) throws Exception {
		update("memtoDAO.updateMemto_info", vo);
	}
	
	public void updateMemto_gbn(MemtoVO vo) throws Exception {
		update("memtoDAO.updateMemto_gbn", vo);
	}
	
	//상태변경
	public void changeMemto_info(MemtoVO vo) throws Exception {
		update("memtoDAO.changeMemto_info", vo);
	}
	
	public void changeMemto_hit(int idx) throws Exception {
		update("memtoDAO.changeMemto_hit", idx);
	}
	
	public void changeMemto_coment(int idx) throws Exception {
		update("memtoDAO.changeMemto_coment", idx);
	}
	
	public void changeMemto_coment2(int idx) throws Exception {
		update("memtoDAO.changeMemto_coment2", idx);
	}
	
	public void changeMemto_point(MemtoVO vo) throws Exception {
		update("memtoDAO.changeMemto_point", vo);
	}
		
	//삭제
	public void deleteMemto(int idx) throws Exception {
		delete("memtoDAO.deleteMemto", idx);
	}
	
	//24시간 자동 완료 처리
	public void changeMemto_info24() throws Exception {
		update("memtoDAO.changeMemto_info24");
	}
	
	//설문 조사 안된 완료처리 자동 문자 발송
	@SuppressWarnings("unchecked")
	public List<MemtoVO> selectMemtoList4() throws Exception {
        return (List<MemtoVO>) list("memtoDAO.selectMemtoList4");
    }
	
	public void changeMemto_info24sms(int idx) throws Exception {
		update("memtoDAO.changeMemto_info24sms", idx);
	}
	
}
