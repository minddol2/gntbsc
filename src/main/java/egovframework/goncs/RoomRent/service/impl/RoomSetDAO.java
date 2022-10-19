package egovframework.goncs.RoomRent.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.goncs.RoomRent.service.RoomSetVO;

@Repository("roomSetDAO")
public class RoomSetDAO extends EgovComAbstractDAO {

	//Room 리스트
	@SuppressWarnings("unchecked")
	public List<RoomSetVO> selectRoomSetList(RoomSetVO vo) throws Exception {
        return (List<RoomSetVO>) list("roomSetDAO.selectRoomSetList", vo);
    }
	
	//설정 추가
	public void insertRoomSet_info(RoomSetVO vo) throws Exception {
		insert("roomSetDAO.insertRoomSet_info", vo);
	}
	
	//설정 수정
	public void updateRoomSet_info(RoomSetVO vo) throws Exception {
		update("roomSetDAO.updateRoomSet_info", vo);
	}
	
	public RoomSetVO selectRoomSet_info(RoomSetVO vo) throws Exception{
        return (RoomSetVO) select("roomSetDAO.selectRoomSet_info", vo);
    }
	
	public RoomSetVO selectRoomSet_info2(RoomSetVO vo) throws Exception{
        return (RoomSetVO) select("roomSetDAO.selectRoomSet_info2", vo);
    }
	
}
