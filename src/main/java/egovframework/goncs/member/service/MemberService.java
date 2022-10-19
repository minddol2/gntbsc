package egovframework.goncs.member.service;

import java.util.List;

import egovframework.goncs.member.service.MemberVO;

public interface MemberService {

	public List<MemberVO> selectMemberList(MemberVO vo) throws Exception;
	
	public List<MemberVO> selectMemberListm(MemberVO vo) throws Exception;
	
	public List<MemberVO> selectMemberListm2(MemberVO vo) throws Exception;

	/** 사용자 건수 */
	public int selectMemberListCnt(MemberVO vo) throws Exception;

	public MemberVO selectMember(int idx) throws Exception;
	
	public MemberVO selectMember1(String us_id) throws Exception;
	
	public MemberVO selectMember_mento(String us_id) throws Exception;

	public MemberVO selectMember_mentos(int idx) throws Exception;

	/** 사용자 추가 **/
	public void insertMember(MemberVO vo) throws Exception;
	
	public void insertMember2(MemberVO vo) throws Exception;
	
	public void insertMember3(MemberVO vo) throws Exception;

	/** 사용자 수정 **/
	public void updateMember(MemberVO vo) throws Exception;
	
	public void updateMember2(MemberVO vo) throws Exception;
	
	public void updateMember3(MemberVO vo) throws Exception;

	public void updateMember_mento(int idx) throws Exception;
	
	public void updateMember_mento1(int idx) throws Exception;

	public void deleteMember(String us_id) throws Exception;

	public List<MemberVO> selectMemberListXls(MemberVO vo) throws Exception;
	
	public List<MemberVO> selectMemberListXlsm(MemberVO vo) throws Exception;
	
	public MemberVO searchId(MemberVO vo) throws Exception;
	
	public MemberVO searchPassword(MemberVO vo) throws Exception;
	
	public void updatePassword(MemberVO vo) throws Exception;
	
	public List<MemberVO> selectMemberList_Mento(MemberVO vo) throws Exception;

}