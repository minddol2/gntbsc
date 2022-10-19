package egovframework.goncs.sub04.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.goncs.sub04.service.JcounselVO;

@Repository("jcounselDAO")
public class JcounselDAO extends EgovComAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<JcounselVO> selectJcounselList(JcounselVO vo) throws Exception {
        return (List<JcounselVO>) list("jcounselDAO.selectJcounselList", vo);
    }
	
	@SuppressWarnings("unchecked")
	public List<JcounselVO> selectJcounselListw(JcounselVO vo) throws Exception {
        return (List<JcounselVO>) list("jcounselDAO.selectJcounselListw", vo);
    }
	
	public int selectJcounselListCnt(JcounselVO vo) throws Exception{
        return (Integer) select("jcounselDAO.selectJcounselListCnt", vo);
    }
	
	//설정 추가
	public void insertJcounsel_info(JcounselVO vo) throws Exception {
		insert("jcounselDAO.insertJcounsel_info", vo);
	}
	
	//설정 수정
	public void updateJcounsel_info(JcounselVO vo) throws Exception {
		update("jcounselDAO.updateJcounsel_info", vo);
	}	
	
	//상태변경
	public void changeJcounsel_info(JcounselVO vo) throws Exception {
		update("jcounselDAO.changeJcounsel_info", vo);
	}	
	
	public JcounselVO selectJcounsel(JcounselVO vo){
        return (JcounselVO) select("jcounselDAO.selectJcounsel", vo);
    }
	
	public JcounselVO selectJcounsel2(JcounselVO vo){
        return (JcounselVO) select("jcounselDAO.selectJcounsel2", vo);
    }
	
	public JcounselVO selectJcounsel3(int idx){
        return (JcounselVO) select("jcounselDAO.selectJcounsel3", idx);
    }
	
	public void deleteJcounsel(int idx) throws Exception {
		delete("jcounselDAO.deleteJcounsel", idx);
	}
	
	@SuppressWarnings("unchecked")
	public List<JcounselVO> selectJcounselXls(JcounselVO vo) throws Exception {
        return (List<JcounselVO>) list("jcounselDAO.selectJcounselXls", vo);
    }
}
