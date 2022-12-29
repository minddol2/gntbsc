package egovframework.goncs.bbs.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.FileVO;
import egovframework.goncs.bbs.service.Board;
import egovframework.goncs.bbs.service.BoardVO;
import egovframework.goncs.bbs.service.BBSManageService;
import egovframework.com.utl.fcc.service.EgovDateUtil;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

/**
 * 게시물 관리를 위한 서비스 구현 클래스
 *
 * @author 공통서비스개발팀 이삼섭
 * @version 1.0
 * @see <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일     	수정자           수정내용
 *  -----------    --------    ---------------------------
 *   2009.03.19  	이삼섭          최초 생성
 * 	 2011.09.22 	서준식          nttId IdGen 서비스로 변경
 * 	 2014.02.21		이기하          답글에 대한 nttId 생성
 * </pre>
 * @since 2009.06.01
 */
@Service("BBSManageService")
public class BBSManageServiceImpl extends EgovAbstractServiceImpl implements BBSManageService {

    @Resource(name = "BBSManageDAO")
    private BBSManageDAO bbsMngDAO;

    @Resource(name = "EgovFileMngService")
    private EgovFileMngService fileService;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

    @Resource(name = "egovNttIdGnrService")
    private EgovIdGnrService nttIdgenService;

    /**
     * 게시물 한 건을 삭제 한다.
     *
     * @see egovframework.com.cop.bbs.brd.service.EgovBBSManageService#deleteBoardArticle(egovframework.com.cop.bbs.brd.service.Board)
     */
    public void deleteBoardArticle(Board board) throws Exception {
        FileVO fvo = new FileVO();

        fvo.setAtchFileId(board.getAtchFileId());

        board.setNttSj("이 글은 작성자에 의해서 삭제되었습니다.");

        bbsMngDAO.deleteBoardArticle(board);

        if (!"".equals(fvo.getAtchFileId()) || fvo.getAtchFileId() != null) {
            fileService.deleteAllFileInf(fvo);
        }
    }

    /**
     * 게시판에 게시물 또는 답변 게시물을 등록 한다.
     *
     * @see egovframework.com.cop.bbs.brd.service.EgovBBSManageService#insertBoardArticle(egovframework.com.cop.bbs.brd.service.Board)
     */
    public void insertBoardArticle(Board board) throws Exception {
        // SORT_ORDR는 부모글의 소트 오더와 같게, NTT_NO는 순서대로 부여

        if ("Y".equals(board.getReplyAt())) {
            // 답글인 경우 1. Parnts를 세팅, 2.Parnts의 sortOrdr을 현재글의 sortOrdr로 가져오도록, 3.nttNo는 현재 게시판의 순서대로
            // replyLc는 부모글의 ReplyLc + 1

            board.setNttId(nttIdgenService.getNextIntegerId());    // 답글에 대한 nttId 생성
            bbsMngDAO.replyBoardArticle(board);

        } else {
            // 답글이 아닌경우 Parnts = 0, replyLc는 = 0, sortOrdr = nttNo(Query에서 처리)
            board.setParnts("0");
            board.setReplyLc("0");
            board.setReplyAt("N");
            board.setNttId(nttIdgenService.getNextIntegerId());//2011.09.22

            bbsMngDAO.insertBoardArticle(board);
        }
    }

    /**
     * 게시물 대하여 상세 내용을 조회 한다.
     *
     * @see egovframework.com.cop.bbs.brd.service.EgovBBSManageService#selectBoardArticle(egovframework.com.cop.bbs.brd.service.BoardVO)
     */
    public BoardVO selectBoardArticle(BoardVO boardVO) throws Exception {
        if (boardVO.isPlusCount()) {
            int iniqireCo = bbsMngDAO.selectMaxInqireCo(boardVO);

            boardVO.setInqireCo(iniqireCo);
            bbsMngDAO.updateInqireCo(boardVO);
        }

        return bbsMngDAO.selectBoardArticle(boardVO);
    }

    /**
     * 조건에 맞는 게시물 목록을 조회 한다.
     *
     * @see egovframework.com.cop.bbs.brd.service.EgovBBSManageService#selectBoardArticles(egovframework.com.cop.bbs.brd.service.BoardVO)
     */
    public Map<String, Object> selectBoardArticles(BoardVO boardVO, String attrbFlag) throws Exception {

        //System.out.println("bbsms1");
        List<BoardVO> list = null;
        if (boardVO.getBbsId().equals("BBSMSTR_000000000311")) {
            list = bbsMngDAO.selectBoardArticleListCenter(boardVO);
        } else if (boardVO.isNoPaging()) {
            System.out.println("selectBoardArticleListNoPaging start");
            list = bbsMngDAO.selectBoardArticleListNoPaging(boardVO);
            System.out.println("selectBoardArticleListNoPaging end");
        } else {
            list = bbsMngDAO.selectBoardArticleList(boardVO);
        }

        List<BoardVO> result = new ArrayList<BoardVO>();

        //System.out.println("bbsms2");
        if ("BBSA01".equals(attrbFlag)) {
            // 유효게시판 임
            String today = EgovDateUtil.getToday();

            BoardVO vo;
            Iterator<BoardVO> iter = list.iterator();
            while (iter.hasNext()) {
                vo = (BoardVO) iter.next();

                if (!"".equals(vo.getNtceBgnde()) || !"".equals(vo.getNtceEndde())) {
                    if (EgovDateUtil.getDaysDiff(today, vo.getNtceBgnde()) > 0 || EgovDateUtil.getDaysDiff(today, vo.getNtceEndde()) < 0) {
                        // 시작일이 오늘날짜보다 크거나, 종료일이 오늘 날짜보다 작은 경우
                        vo.setIsExpired("Y");
                    }
                }
                result.add(vo);
            }
        } else {
            result = list;
        }

        //System.out.println("bbsms3");
        int cnt = bbsMngDAO.selectBoardArticleListCnt(boardVO);

        //System.out.println("bbsms4");
        Map<String, Object> map = new HashMap<String, Object>();

        //System.out.println("bbsms5");
        map.put("resultList", result);
        map.put("resultCnt", Integer.toString(cnt));

        return map;
    }

    public Map<String, Object> selectBoardArticleList_qna(BoardVO boardVO, String attrbFlag) throws Exception {

        //System.out.println("bbsms1");
        List<BoardVO> list = bbsMngDAO.selectBoardArticleList_qna(boardVO);
        List<BoardVO> result = new ArrayList<BoardVO>();

        //System.out.println("bbsms2");
        if ("BBSA01".equals(attrbFlag)) {
            // 유효게시판 임
            String today = EgovDateUtil.getToday();

            BoardVO vo;
            Iterator<BoardVO> iter = list.iterator();
            while (iter.hasNext()) {
                vo = (BoardVO) iter.next();

                if (!"".equals(vo.getNtceBgnde()) || !"".equals(vo.getNtceEndde())) {
                    if (EgovDateUtil.getDaysDiff(today, vo.getNtceBgnde()) > 0 || EgovDateUtil.getDaysDiff(today, vo.getNtceEndde()) < 0) {
                        // 시작일이 오늘날짜보다 크거나, 종료일이 오늘 날짜보다 작은 경우
                        vo.setIsExpired("Y");
                    }
                }
                result.add(vo);
            }
        } else {
            result = list;
        }

        //System.out.println("bbsms3");
        int cnt = bbsMngDAO.selectBoardArticleListCnt(boardVO);

        //System.out.println("bbsms4");
        Map<String, Object> map = new HashMap<String, Object>();

        //System.out.println("bbsms5");
        map.put("resultList", result);
        map.put("resultCnt", Integer.toString(cnt));

        return map;
    }

    public Map<String, Object> selectBoardArticleList_Faq(BoardVO boardVO, String attrbFlag) throws Exception {

        //System.out.println("bbsms1");
        List<BoardVO> list = bbsMngDAO.selectBoardArticleList_Faq(boardVO);
        List<BoardVO> result = new ArrayList<BoardVO>();

        //System.out.println("bbsms2");
        if ("BBSA01".equals(attrbFlag)) {
            // 유효게시판 임
            String today = EgovDateUtil.getToday();

            BoardVO vo;
            Iterator<BoardVO> iter = list.iterator();
            while (iter.hasNext()) {
                vo = (BoardVO) iter.next();

                if (!"".equals(vo.getNtceBgnde()) || !"".equals(vo.getNtceEndde())) {
                    if (EgovDateUtil.getDaysDiff(today, vo.getNtceBgnde()) > 0 || EgovDateUtil.getDaysDiff(today, vo.getNtceEndde()) < 0) {
                        // 시작일이 오늘날짜보다 크거나, 종료일이 오늘 날짜보다 작은 경우
                        vo.setIsExpired("Y");
                    }
                }
                result.add(vo);
            }
        } else {
            result = list;
        }

        //System.out.println("bbsms3");
        int cnt = bbsMngDAO.selectBoardArticleListCnt(boardVO);

        //System.out.println("bbsms4");
        Map<String, Object> map = new HashMap<String, Object>();

        //System.out.println("bbsms5");
        map.put("resultList", result);
        map.put("resultCnt", Integer.toString(cnt));

        return map;
    }

    public Map<String, Object> selectBoard_Notice(BoardVO boardVO) throws Exception {

        //System.out.println("bbsms1");
        List<BoardVO> list = bbsMngDAO.selectBoardNoticeList(boardVO);
        List<BoardVO> result = new ArrayList<BoardVO>();

        String today = EgovDateUtil.getToday();

        BoardVO vo;
        Iterator<BoardVO> iter = list.iterator();
        while (iter.hasNext()) {
            vo = (BoardVO) iter.next();

            if (!"".equals(vo.getNtceBgnde()) || !"".equals(vo.getNtceEndde())) {
                if (EgovDateUtil.getDaysDiff(today, vo.getNtceBgnde()) > 0 || EgovDateUtil.getDaysDiff(today, vo.getNtceEndde()) < 0) {
                    // 시작일이 오늘날짜보다 크거나, 종료일이 오늘 날짜보다 작은 경우
                    vo.setIsExpired("Y");
                }
            }
            result.add(vo);
        }

        //System.out.println("bbsms3");
        int cnt = bbsMngDAO.selectBoardArticleListCnt(boardVO);

        //System.out.println("bbsms4");
        Map<String, Object> map = new HashMap<String, Object>();

        //System.out.println("bbsms5");
        map.put("resultList", result);
        map.put("resultCnt", Integer.toString(cnt));

        return map;
    }

    public Map<String, Object> selectBoard_Notice2(BoardVO boardVO) throws Exception {

        //System.out.println("bbsms1");
        List<BoardVO> list = bbsMngDAO.selectBoardNoticeList2(boardVO);
        List<BoardVO> result = new ArrayList<BoardVO>();

        String today = EgovDateUtil.getToday();

        BoardVO vo;
        Iterator<BoardVO> iter = list.iterator();
        while (iter.hasNext()) {
            vo = (BoardVO) iter.next();

            if (!"".equals(vo.getNtceBgnde()) || !"".equals(vo.getNtceEndde())) {
                if (EgovDateUtil.getDaysDiff(today, vo.getNtceBgnde()) > 0 || EgovDateUtil.getDaysDiff(today, vo.getNtceEndde()) < 0) {
                    // 시작일이 오늘날짜보다 크거나, 종료일이 오늘 날짜보다 작은 경우
                    vo.setIsExpired("Y");
                }
            }
            result.add(vo);
        }

        //System.out.println("bbsms3");
        int cnt = bbsMngDAO.selectBoardArticleListCnt(boardVO);

        //System.out.println("bbsms4");
        Map<String, Object> map = new HashMap<String, Object>();

        //System.out.println("bbsms5");
        map.put("resultList", result);
        map.put("resultCnt", Integer.toString(cnt));

        return map;
    }

    public Map<String, Object> selectBoard_Popup(BoardVO boardVO) throws Exception {

        //System.out.println("bbsms1");
        List<BoardVO> list = bbsMngDAO.selectBoardNoticeList3(boardVO);
        List<BoardVO> result = new ArrayList<BoardVO>();

        String today = EgovDateUtil.getToday();

        BoardVO vo;
        Iterator<BoardVO> iter = list.iterator();
        while (iter.hasNext()) {
            vo = (BoardVO) iter.next();

            if (!"".equals(vo.getNtceBgnde()) || !"".equals(vo.getNtceEndde())) {
                if (EgovDateUtil.getDaysDiff(today, vo.getNtceBgnde()) > 0 || EgovDateUtil.getDaysDiff(today, vo.getNtceEndde()) < 0) {
                    // 시작일이 오늘날짜보다 크거나, 종료일이 오늘 날짜보다 작은 경우
                    vo.setIsExpired("Y");
                }
            }
            result.add(vo);
        }

        //System.out.println("bbsms4");
        Map<String, Object> map = new HashMap<String, Object>();

        //System.out.println("bbsms5");
        map.put("resultList", result);

        return map;
    }

    public Map<String, Object> selectBoard_Comp(BoardVO boardVO) throws Exception {

        //System.out.println("bbsms1");
        List<BoardVO> list = bbsMngDAO.selectBoardCompList(boardVO);
        List<BoardVO> result = new ArrayList<BoardVO>();

        String today = EgovDateUtil.getToday();

        BoardVO vo;
        Iterator<BoardVO> iter = list.iterator();
        while (iter.hasNext()) {
            vo = (BoardVO) iter.next();

            if (!"".equals(vo.getNtceBgnde()) || !"".equals(vo.getNtceEndde())) {
                if (EgovDateUtil.getDaysDiff(today, vo.getNtceBgnde()) > 0 || EgovDateUtil.getDaysDiff(today, vo.getNtceEndde()) < 0) {
                    // 시작일이 오늘날짜보다 크거나, 종료일이 오늘 날짜보다 작은 경우
                    vo.setIsExpired("Y");
                }
            }
            result.add(vo);
        }

        //System.out.println("bbsms4");
        Map<String, Object> map = new HashMap<String, Object>();

        //System.out.println("bbsms5");
        map.put("resultList", result);

        return map;
    }

    public Map<String, Object> selectBoard_Comp2(BoardVO boardVO) throws Exception {

        //System.out.println("bbsms1");
        List<BoardVO> list = bbsMngDAO.selectBoardCompList2(boardVO);
        List<BoardVO> result = new ArrayList<BoardVO>();

        String today = EgovDateUtil.getToday();

        BoardVO vo;
        Iterator<BoardVO> iter = list.iterator();
        while (iter.hasNext()) {
            vo = (BoardVO) iter.next();

            if (!"".equals(vo.getNtceBgnde()) || !"".equals(vo.getNtceEndde())) {
                if (EgovDateUtil.getDaysDiff(today, vo.getNtceBgnde()) > 0 || EgovDateUtil.getDaysDiff(today, vo.getNtceEndde()) < 0) {
                    // 시작일이 오늘날짜보다 크거나, 종료일이 오늘 날짜보다 작은 경우
                    vo.setIsExpired("Y");
                }
            }
            result.add(vo);
        }

        //System.out.println("bbsms4");
        Map<String, Object> map = new HashMap<String, Object>();

        //System.out.println("bbsms5");
        map.put("resultList", result);

        return map;
    }

    /**
     * 게시물 한 건의 내용을 수정 한다.
     *
     * @see egovframework.com.cop.bbs.brd.service.EgovBBSManageService#updateBoardArticle(egovframework.com.cop.bbs.brd.service.Board)
     */
    public void updateBoardArticle(Board board) throws Exception {
        bbsMngDAO.updateBoardArticle(board);
    }

    /**
     * 방명록 내용을 삭제 한다.
     *
     * @see egovframework.com.cop.bbs.brd.service.EgovBBSManageService#deleteGuestList(egovframework.com.cop.bbs.brd.service.BoardVO)
     */
    public void deleteGuestList(BoardVO boardVO) throws Exception {
        bbsMngDAO.deleteGuestList(boardVO);
    }

    /**
     * 방명록에 대한 목록을 조회 한다.
     *
     * @see egovframework.com.cop.bbs.brd.service.EgovBBSManageService#selectGuestList(egovframework.com.cop.bbs.brd.service.BoardVO)
     */
    public Map<String, Object> selectGuestList(BoardVO boardVO) throws Exception {
        List<BoardVO> result = bbsMngDAO.selectGuestList(boardVO);
        int cnt = bbsMngDAO.selectGuestListCnt(boardVO);

        Map<String, Object> map = new HashMap<String, Object>();

        map.put("resultList", result);
        map.put("resultCnt", Integer.toString(cnt));

        return map;
    }

    /**
     * 방명록에 대한 패스워드를 조회 한다.
     *
     * @param board
     * @return
     * @throws Exception
     */
    public String getPasswordInf(Board board) throws Exception {
        return bbsMngDAO.getPasswordInf(board);
    }
}
