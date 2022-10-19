package egovframework.goncs.member.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.goncs.member.service.McodeVO;

@Repository("mcodeDAO")
public class McodeDAO extends EgovComAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<McodeVO> selectMcodeList(int maxcod) throws Exception {
        return (List<McodeVO>) list("mcodeDAO.selectMcodeList", maxcod);
    }
}
