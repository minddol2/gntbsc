package egovframework.goncs.member.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.goncs.member.service.McodeService;
import egovframework.goncs.member.service.McodeVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("mcodeService")
public class McodeServiceImpl extends EgovAbstractServiceImpl implements McodeService {

	@Resource(name = "mcodeDAO")
    private McodeDAO mcodeDAO;
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.member.service.impl.McodeService#selectMcodeList(int)
	 */
	@Override
	public List<McodeVO> selectMcodeList(int maxcod) throws Exception {
    	return mcodeDAO.selectMcodeList(maxcod);
    }
}
