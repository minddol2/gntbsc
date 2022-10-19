package egovframework.com.cmm;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;
/**
 * ImagePaginationRenderer.java 클래스
 *
 * @author 서준식
 * @since 2011. 9. 16.
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    -------------    ----------------------
 *   2011. 9. 16.   서준식       이미지 경로에 ContextPath추가
 * </pre>
 */
public class ImagePaginationRenderer extends AbstractPaginationRenderer implements ServletContextAware{

	private ServletContext servletContext;

	public ImagePaginationRenderer() {

	}

	public void initVariables(){
		firstPageLabel    = "";
        previousPageLabel = "<span class=\"btn btn_prev\"><a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \">이전</a></span>&#160;";
        currentPageLabel  = "<span><a href='#' class='on'>{0}</a></span>&#160;";
        otherPageLabel    = "<span><a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \">{2}</a></span>&#160;";
        nextPageLabel     = "<span class=\"btn btn_next\"><a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \">다음</a></span>&#160;";
        lastPageLabel     = "";
	}



	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
		initVariables();
	}

}
