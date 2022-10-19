package egovframework.goncs.member.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.goncs.member.service.MemberVO;

@Repository("memberDAO")
public class MemberDAO extends EgovComAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<MemberVO> selectMemberList(MemberVO vo) throws Exception {
        return (List<MemberVO>) list("memberDAO.selectMemberList", vo);
    }
	
	@SuppressWarnings("unchecked")
	public List<MemberVO> selectMemberListm(MemberVO vo) throws Exception {
        return (List<MemberVO>) list("memberDAO.selectMemberListm", vo);
    }
	
	@SuppressWarnings("unchecked")
	public List<MemberVO> selectMemberListm2(MemberVO vo) throws Exception {
        return (List<MemberVO>) list("memberDAO.selectMemberListm2", vo);
    }
	
	/** 건수 */
	public int selectMemberListCnt(MemberVO vo) throws Exception{
        return (Integer) select("memberDAO.selectMemberListCnt", vo);
    }
	
	public MemberVO selectMember(int idx){
        return (MemberVO) select("memberDAO.selectMember", idx);
    }
	
	public MemberVO selectMember1(String us_id){
        return (MemberVO) select("memberDAO.selectMember1", us_id);
    }
	
	public MemberVO selectMember_mento(String us_id){
        return (MemberVO) select("memberDAO.selectMember_mento", us_id);
    }
	
	public MemberVO selectMember_mentos(int idx){
        return (MemberVO) select("memberDAO.selectMember_mentos", idx);
    }
	
	/** 추가 **/
	public void insertMember(MemberVO vo) throws Exception {
		insert("memberDAO.insertMember", vo);
	}
	
	public void insertMember2(MemberVO vo) throws Exception {
		insert("memberDAO.insertMember2", vo);
	}
	
	public void insertMember3(MemberVO vo) throws Exception {
		insert("memberDAO.insertMember3", vo);
	}
	
	/** 사용자 수정 **/
	public void updateMember(MemberVO vo) throws Exception {
		update("memberDAO.updateMember", vo);
	}
	
	public void updateMember2(MemberVO vo) throws Exception {
		update("memberDAO.updateMember2", vo);
	}
	
	public void updateMember3(MemberVO vo) throws Exception {
		update("memberDAO.updateMember3", vo);
	}
	
	public void updateMember_mento(int idx) throws Exception {
		update("memberDAO.updateMember_mento", idx);
	}
	
	public void updateMember_mento1(int idx) throws Exception {
		update("memberDAO.updateMember_mento1", idx);
	}
	
	public void deleteMember(String us_id) throws Exception {
		delete("memberDAO.deleteMember", us_id);
	}
	
	@SuppressWarnings("unchecked")
	public List<MemberVO> selectMemberListXls(MemberVO vo) throws Exception {
        return (List<MemberVO>) list("memberDAO.selectMemberListXls", vo);
    }
	
	@SuppressWarnings("unchecked")
	public List<MemberVO> selectMemberListXlsm(MemberVO vo) throws Exception {
        return (List<MemberVO>) list("memberDAO.selectMemberListXlsm", vo);
    }
	
	public MemberVO searchId(MemberVO vo) throws Exception {
    	return (MemberVO)select("memberDAO.searchId", vo);
    }
	
	public MemberVO searchPassword(MemberVO vo) throws Exception {
    	return (MemberVO)select("memberDAO.searchPassword", vo);
    }
	
	public void updatePassword(MemberVO vo) throws Exception {
    	update("memberDAO.updatePassword", vo);
    }
	
	@SuppressWarnings("unchecked")
	public List<MemberVO> selectMemberList_Mento(MemberVO vo) throws Exception {
        return (List<MemberVO>) list("memberDAO.selectMemberList_Mento", vo);
    }
}
