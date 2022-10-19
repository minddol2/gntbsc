package egovframework.goncs.member.service;

import egovframework.goncs.member.service.LoginVO;

public interface LoginService {

	/**
	 * 일반 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
	public LoginVO actionLogin(LoginVO vo) throws Exception;
	
}