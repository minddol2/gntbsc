package egovframework.goncs.RoomRent.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.goncs.RoomRent.service.RoomSetService;
import egovframework.goncs.RoomRent.service.RoomSetVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("roomSetService")
public class RoomSetServiceImpl extends EgovAbstractServiceImpl implements RoomSetService {

	@Resource(name = "roomSetDAO")
    private RoomSetDAO roomSetDAO;
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.RoomRent.service.impl.RoomSetService#selectRoomSetList(egovframework.goncs.RoomRent.service.RoomSetVO)
	 */
	@Override
	public List<RoomSetVO> selectRoomSetList(RoomSetVO vo) throws Exception {
        return roomSetDAO.selectRoomSetList(vo);
    }
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.RoomRent.service.impl.RoomSetService#insertRoomSet_info(egovframework.goncs.RoomRent.service.RoomSetVO)
	 */
	@Override
	public void insertRoomSet_info(RoomSetVO vo) throws Exception {
		roomSetDAO.insertRoomSet_info(vo);
	}
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.RoomRent.service.impl.RoomSetService#updateRoomSet_info(egovframework.goncs.RoomRent.service.RoomSetVO)
	 */
	@Override
	public void updateRoomSet_info(RoomSetVO vo) throws Exception {
		roomSetDAO.updateRoomSet_info(vo);
	}
	
	@Override
	public RoomSetVO selectRoomSet_info(RoomSetVO vo) throws Exception {
        return roomSetDAO.selectRoomSet_info(vo);
    }
	
	@Override
	public RoomSetVO selectRoomSet_info2(RoomSetVO vo) throws Exception {
        return roomSetDAO.selectRoomSet_info2(vo);
    }
}
