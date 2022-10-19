package egovframework.goncs.RoomRent.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.goncs.RoomRent.service.RoomRentService;
import egovframework.goncs.RoomRent.service.RoomRentVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("roomRentService")
public class RoomRentServiceImpl extends EgovAbstractServiceImpl implements RoomRentService {

	@Resource(name = "roomRentDAO")
    private RoomRentDAO roomRentDAO;
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.RoomRent.service.impl.RoomRentService#selectRoomRentList(egovframework.goncs.RoomRent.service.RoomRentVO)
	 */
	@Override
	public List<RoomRentVO> selectRoomRentList(RoomRentVO vo) throws Exception {
        return roomRentDAO.selectRoomRentList(vo);
    }
	
	@Override
	public List<RoomRentVO> selectRoomRentListw(RoomRentVO vo) throws Exception {
        return roomRentDAO.selectRoomRentListw(vo);
    }
	
	@Override
	public int selectRoomRentListCnt(RoomRentVO vo) throws Exception {
		return roomRentDAO.selectRoomRentListCnt(vo);
	}
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.RoomRent.service.impl.RoomRentService#insertRoomRent_info(egovframework.goncs.RoomRent.service.RoomRentVO)
	 */
	@Override
	public void insertRoomRent_info(RoomRentVO vo) throws Exception {
		roomRentDAO.insertRoomRent_info(vo);
	}
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.RoomRent.service.impl.RoomRentService#updateRoomRent_info(egovframework.goncs.RoomRent.service.RoomRentVO)
	 */
	@Override
	public void updateRoomRent_info(RoomRentVO vo) throws Exception {
		roomRentDAO.updateRoomRent_info(vo);
	}
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.RoomRent.service.impl.RoomRentService#changeRoomRent_info(egovframework.goncs.RoomRent.service.RoomRentVO)
	 */
	@Override
	public void changeRoomRent_info(RoomRentVO vo) throws Exception {
		roomRentDAO.changeRoomRent_info(vo);
	}
	
	/* (non-Javadoc)
	 * @see egovframework.goncs.RoomRent.service.impl.RoomRentService#selectRoomRent(egovframework.goncs.RoomRent.service.RoomRentVO)
	 */
	@Override
	public RoomRentVO selectRoomRent(RoomRentVO vo) throws Exception {
        return roomRentDAO.selectRoomRent(vo);
    }
	
	@Override
	public RoomRentVO selectRoomRent2(RoomRentVO vo) throws Exception {
        return roomRentDAO.selectRoomRent2(vo);
    }
	
	@Override
	public RoomRentVO selectRoomRent3(int idx) throws Exception {
        return roomRentDAO.selectRoomRent3(idx);
    }
	
	@Override
	public void deleteRoomRent(int idx) throws Exception {
		roomRentDAO.deleteRoomRent(idx);
	}
	
}
