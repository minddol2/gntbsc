package egovframework.goncs.member.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.goncs.member.service.LoginService;
import egovframework.goncs.member.service.LoginVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("loginService")
public class LoginServiceImpl extends EgovAbstractServiceImpl implements LoginService {

	@Resource(name="loginDAO")
    private LoginDAO loginDAO;
	
	/**
	 * 일반 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    @Override
	public LoginVO actionLogin(LoginVO vo) throws Exception {

    	// 1. 아이디와 암호화된 비밀번호가 DB와 일치하는지 확인한다.
    	LoginVO loginVO = loginDAO.actionLogin(vo);
    	
    	// 2. 결과를 리턴한다.
    	if (loginVO != null && !loginVO.getUs_id().equals("") && !loginVO.getUs_name().equals("")) {
    		return loginVO;
    	} else {
    		loginVO = new LoginVO();
    	}

    	return loginVO;
    }
    
    
}
