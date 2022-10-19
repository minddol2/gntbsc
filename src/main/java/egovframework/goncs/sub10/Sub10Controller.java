package egovframework.goncs.sub10;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.goncs.sub01.Sub01Controller;

@Controller
public class Sub10Controller {

	private static final Logger LOGGER = LoggerFactory.getLogger(Sub10Controller.class);
	
	@RequestMapping(value = "/sub10/sub01_01.do")
	public String get_sub10_page_01(ModelMap model, Locale locale) throws Exception{

		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
				
		return "egovframework/gntbsc/sub10/sub01_01";
	}
	
	@RequestMapping(value = "/sub10/sub02_01.do")
	public String get_sub10_page_02(ModelMap model, Locale locale) throws Exception{

		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
				
		return "egovframework/gntbsc/sub10/sub02_01";
	}
	
	@RequestMapping(value = "/sub10/sub03_01.do")
	public String get_sub10_page_03(ModelMap model, Locale locale) throws Exception{

		String lang_temp = (String) locale.getLanguage();
		model.addAttribute("lang_temp", lang_temp);
				
		return "egovframework/gntbsc/sub10/sub03_01";
	}
}
