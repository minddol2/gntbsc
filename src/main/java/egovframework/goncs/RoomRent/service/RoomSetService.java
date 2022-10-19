package egovframework.goncs.RoomRent.service;

import java.util.List;

import egovframework.goncs.RoomRent.service.RoomSetVO;

public interface RoomSetService {

	public List<RoomSetVO> selectRoomSetList(RoomSetVO vo) throws Exception;

	public void insertRoomSet_info(RoomSetVO vo) throws Exception;

	public void updateRoomSet_info(RoomSetVO vo) throws Exception;
	
	public RoomSetVO selectRoomSet_info(RoomSetVO vo) throws Exception;
	
	public RoomSetVO selectRoomSet_info2(RoomSetVO vo) throws Exception;

}