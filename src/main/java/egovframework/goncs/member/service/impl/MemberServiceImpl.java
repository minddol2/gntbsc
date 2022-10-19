package egovframework.goncs.member.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.utl.fcc.service.EgovNumberUtil;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.goncs.member.service.MemberService;
import egovframework.goncs.member.service.MemberVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("memberService")
public class MemberServiceImpl extends EgovAbstractServiceImpl implements MemberService {

	@Resource(name = "memberDAO")
    private MemberDAO memberDAO;
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.member.service.impl.MemberService#selectMemberList(egovframework.goncs.member.service.MemberVO)
	 */
	@Override
	public List<MemberVO> selectMemberList(MemberVO vo) throws Exception {
    	return memberDAO.selectMemberList(vo);
    }
	
	@Override
	public List<MemberVO> selectMemberListm(MemberVO vo) throws Exception {
    	return memberDAO.selectMemberListm(vo);
    }
	
	@Override
	public List<MemberVO> selectMemberListm2(MemberVO vo) throws Exception {
    	return memberDAO.selectMemberListm2(vo);
    }
    
    /* (non-Javadoc)
	 * @see egovframework.goncs.member.service.impl.MemberService#selectMemberListCnt(egovframework.goncs.member.service.MemberVO)
	 */
	@Override
	public int selectMemberListCnt(MemberVO vo) throws Exception {
		return memberDAO.selectMemberListCnt(vo);
	}
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.member.service.impl.MemberService#selectMember(int)
	 */
	@Override
    public MemberVO selectMember(int idx) throws Exception {
    	return memberDAO.selectMember(idx);
    }
	
	@Override
    public MemberVO selectMember1(String us_id) throws Exception {
    	return memberDAO.selectMember1(us_id);
    }
	
	@Override
    public MemberVO selectMember_mento(String us_id) throws Exception {
    	return memberDAO.selectMember_mento(us_id);
    }
	
	@Override
    public MemberVO selectMember_mentos(int idx) throws Exception {
    	return memberDAO.selectMember_mentos(idx);
    }
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.member.service.impl.MemberService#insertMember(egovframework.goncs.member.service.MemberVO)
	 */
	public void insertMember(MemberVO vo) throws Exception {
		memberDAO.insertMember(vo);
	}
	
	public void insertMember2(MemberVO vo) throws Exception {
		memberDAO.insertMember2(vo);
	}
	
	public void insertMember3(MemberVO vo) throws Exception {
		memberDAO.insertMember3(vo);
	}
	
	public void updateMember_mento(int idx) throws Exception {
		memberDAO.updateMember_mento(idx);
	}
	
	public void updateMember_mento1(int idx) throws Exception {
		memberDAO.updateMember_mento1(idx);
	}
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.member.service.impl.MemberService#updateMember(egovframework.goncs.member.service.MemberVO)
	 */
	public void updateMember(MemberVO vo) throws Exception {
		memberDAO.updateMember(vo);
	}
	
	public void updateMember2(MemberVO vo) throws Exception {
		memberDAO.updateMember2(vo);
	}
	
	public void updateMember3(MemberVO vo) throws Exception {
		memberDAO.updateMember3(vo);
	}
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.member.service.impl.MemberService#deleteMember(int)
	 */
	@Override
	public void deleteMember(String us_id) throws Exception {
		memberDAO.deleteMember(us_id);
	}
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.member.service.impl.MemberService#selectMemberListXls(egovframework.goncs.member.service.MemberVO)
	 */
	@Override
	public List<MemberVO> selectMemberListXls(MemberVO vo) throws Exception {
    	return memberDAO.selectMemberListXls(vo);
    }
	
	@Override
	public List<MemberVO> selectMemberListXlsm(MemberVO vo) throws Exception {
    	return memberDAO.selectMemberListXlsm(vo);
    }
	
	@Override
	public MemberVO searchId(MemberVO vo) throws Exception {
		return memberDAO.searchId(vo);
    }
	
	@Override
	public MemberVO searchPassword(MemberVO vo) throws Exception {
		return memberDAO.searchPassword(vo);
    }
	
	public void updatePassword(MemberVO vo) throws Exception {
		memberDAO.updatePassword(vo);
	}
	
	@Override
	public List<MemberVO> selectMemberList_Mento(MemberVO vo) throws Exception {
    	return memberDAO.selectMemberList_Mento(vo);
    }
	
}
