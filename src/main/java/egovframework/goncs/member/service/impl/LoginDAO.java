package egovframework.goncs.member.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.goncs.member.service.LoginVO;

@Repository("loginDAO")
public class LoginDAO extends EgovComAbstractDAO {

	/**
	 * 일반 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    public LoginVO actionLogin(LoginVO vo) throws Exception {
    	
    	return (LoginVO)select("loginDAO.actionLogin", vo);
    }
    
}
