package egovframework.goncs.RoomRent.service;

import java.util.List;

import egovframework.goncs.RoomRent.service.RoomRentVO;

public interface RoomRentService {

	public List<RoomRentVO> selectRoomRentList(RoomRentVO vo) throws Exception;
	
	public List<RoomRentVO> selectRoomRentListw(RoomRentVO vo) throws Exception;
	
	public int selectRoomRentListCnt(RoomRentVO vo) throws Exception;

	public void insertRoomRent_info(RoomRentVO vo) throws Exception;

	public void updateRoomRent_info(RoomRentVO vo) throws Exception;

	public void changeRoomRent_info(RoomRentVO vo) throws Exception;

	public RoomRentVO selectRoomRent(RoomRentVO vo) throws Exception;
	
	public RoomRentVO selectRoomRent2(RoomRentVO vo) throws Exception;
	
	public RoomRentVO selectRoomRent3(int idx) throws Exception;

	public void deleteRoomRent(int idx) throws Exception;
	
}