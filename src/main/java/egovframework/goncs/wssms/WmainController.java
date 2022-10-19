package egovframework.goncs.wssms;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.goncs.member.service.LoginVO;

@Controller
public class WmainController {

	private static final Logger LOGGER = LoggerFactory.getLogger(WmainController.class);
	
	@RequestMapping("/wssms/main.do")
	public String get_main(HttpServletRequest request, ModelMap model, RedirectAttributes rttr) throws Exception {
		
		// 1. Spring Security 사용자권한 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "redirect:/wssms/LoginUsr.do";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		int m_level = user.getUs_level();
		if(m_level > 2) {
			return "redirect:/wssms/LoginUsr.do";
		}
		
		String resultMsg = "";
		Map<String, ?> redirectMap = RequestContextUtils.getInputFlashMap(request);
		if(redirectMap != null) {
			resultMsg = (String)redirectMap.get("resultMsg");
		}
		model.addAttribute("resultMsg", resultMsg);
		
		return "egovframework/gntbsc/wssms/main";
	}
}
