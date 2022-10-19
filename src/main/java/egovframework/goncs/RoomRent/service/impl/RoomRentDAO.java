package egovframework.goncs.RoomRent.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.goncs.RoomRent.service.RoomRentVO;

@Repository("roomRentDAO")
public class RoomRentDAO extends EgovComAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<RoomRentVO> selectRoomRentList(RoomRentVO vo) throws Exception {
        return (List<RoomRentVO>) list("roomRentDAO.selectRoomRentList", vo);
    }
	
	@SuppressWarnings("unchecked")
	public List<RoomRentVO> selectRoomRentListw(RoomRentVO vo) throws Exception {
        return (List<RoomRentVO>) list("roomRentDAO.selectRoomRentListw", vo);
    }
	
	public int selectRoomRentListCnt(RoomRentVO vo) throws Exception{
        return (Integer) select("roomRentDAO.selectRoomRentListCnt", vo);
    }
	
	//설정 추가
	public void insertRoomRent_info(RoomRentVO vo) throws Exception {
		insert("roomRentDAO.insertRoomRent_info", vo);
	}
	
	//설정 수정
	public void updateRoomRent_info(RoomRentVO vo) throws Exception {
		update("roomRentDAO.updateRoomRent_info", vo);
	}	
	
	//상태변경
	public void changeRoomRent_info(RoomRentVO vo) throws Exception {
		update("roomRentDAO.changeRoomRent_info", vo);
	}	
	
	public RoomRentVO selectRoomRent(RoomRentVO vo){
        return (RoomRentVO) select("roomRentDAO.selectRoomRent", vo);
    }
	
	public RoomRentVO selectRoomRent2(RoomRentVO vo){
        return (RoomRentVO) select("roomRentDAO.selectRoomRent2", vo);
    }
	
	public RoomRentVO selectRoomRent3(int idx){
        return (RoomRentVO) select("roomRentDAO.selectRoomRent3", idx);
    }
	
	public void deleteRoomRent(int idx) throws Exception {
		delete("roomRentDAO.deleteRoomRent", idx);
	}
}
