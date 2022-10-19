package egovframework.goncs.sub01;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Sub01Controller {

	private static final Logger LOGGER = LoggerFactory.getLogger(Sub01Controller.class);
	
	@RequestMapping(value = "/sub01/sub01_01.do")
	public String get_sub01_page_01(ModelMap model, Locale locale) throws Exception{

		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
				
		return "egovframework/gntbsc/sub01/sub01_01";
	}
	
	@RequestMapping(value = "/sub01/sub02_01.do")
	public String get_sub01_page_02(ModelMap model, Locale locale) throws Exception{

		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
				
		return "egovframework/gntbsc/sub01/sub02_01";
	}
	
	@RequestMapping(value = "/sub01/sub03_01.do")
	public String get_sub01_page_03(ModelMap model, Locale locale) throws Exception{

		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
				
		return "egovframework/gntbsc/sub01/sub03_01";
	}
	
	@RequestMapping(value = "/sub01/sub04_01.do")
	public String get_sub01_page_04(ModelMap model, Locale locale) throws Exception{

		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
				
		return "egovframework/gntbsc/sub01/sub04_01";
	}
	
}
