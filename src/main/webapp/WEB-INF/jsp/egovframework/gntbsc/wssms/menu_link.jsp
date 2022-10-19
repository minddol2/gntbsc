<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
String mTitle[][][] = new String[10][12][10];
String mLink[][][] = new String[10][12][10];


	mTitle[0][0][0] = "gnb메뉴"; mLink[0][0][0] = "";
			mTitle[0][1][0] = "메인"; mLink[0][1][0] = "wssms/main.do";
			mTitle[0][2][0] = ""; mLink[0][2][0] = "";
			mTitle[0][3][0] = ""; mLink[0][3][0] = "";
			mTitle[0][4][0] = ""; mLink[0][4][0] = "";
		
		
	mTitle[1][0][0] = "사용자관리"; mLink[1][0][0] = "sb01/sub01.do"; 
		mTitle[1][1][0] = "사용자관리"; mLink[1][1][0] = "sb01/sub01.do";

	mTitle[2][0][0] = "게시판관리"; mLink[2][0][0] = "sb02/sub02.do"; 
		mTitle[2][1][0] = "팝업관리"; mLink[2][1][0] = "sb02/sub01.do";
		mTitle[2][2][0] = "공지사항"; mLink[2][2][0] = "sb02/sub02.do"; 
		mTitle[2][3][0] = "보도자료"; mLink[2][3][0] = "sb02/sub03.do"; 
		mTitle[2][4][0] = "FAQ"; mLink[2][4][0] = "sb02/sub04.do"; 
		mTitle[2][5][0] = "모두를 위한 관광정보"; mLink[2][5][0] = "sb02/sub05.do"; 
		mTitle[2][6][0] = "기업홍보"; mLink[2][6][0] = "sb02/sub06.do"; 
		mTitle[2][7][0] = "팝업존관리"; mLink[2][7][0] = "sb02/sub07.do"; 
		mTitle[2][8][0] = "기업소개"; mLink[2][8][0] = "sb02/sub02_08.do";
		mTitle[2][9][0] = "일자리정보"; mLink[2][9][0] = "sb02/sub02_09.do";
		mTitle[2][10][0] = "센터소식"; mLink[2][10][0] = "sb02/sub02_10.do";

	mTitle[3][0][0] = "대관신청"; mLink[3][0][0] = "sb03/sub01.do"; 
		mTitle[3][1][0] = "대관신청리스트"; mLink[3][1][0] = "sb03/sub01.do";
		mTitle[3][9][0] = "승인내역"; mLink[3][9][0] = "sb03/sub09.do";
		mTitle[3][2][0] = "소회의실1 설정"; mLink[3][2][0] = "sb03/sub02.do"; 
		mTitle[3][3][0] = "소회의실2 설정"; mLink[3][3][0] = "sb03/sub03.do"; 
		mTitle[3][4][0] = "소회의실3 설정"; mLink[3][4][0] = "sb03/sub04.do"; 
		mTitle[3][5][0] = "소회의실4 설정"; mLink[3][5][0] = "sb03/sub05.do"; 
		mTitle[3][6][0] = "소회의실5 설정"; mLink[3][6][0] = "sb03/sub06.do"; 
		mTitle[3][7][0] = "소회의실6 설정"; mLink[3][7][0] = "sb03/sub07.do"; 
		mTitle[3][8][0] = "대회의실 설정";  mLink[3][8][0] = "sb03/sub08.do"; 
		
	mTitle[5][0][0] = "기업상담관리"; mLink[5][0][0] = "sb05/sub01.do"; 		
		mTitle[5][1][0] = "상담신청현황"; mLink[5][1][0] = "sb05/sub01.do"; 
		mTitle[5][2][0] = "멘토관리"; mLink[5][2][0] = "sb05/sub02.do"; 
		mTitle[5][3][0] = "신청통계"; mLink[5][3][0] = "sb05/sub03.do"; 

	mTitle[6][0][0] = "일자리상담관리"; mLink[6][0][0] = "sb06/sub01.do"; 		
		mTitle[6][1][0] = "일자리신청현황"; mLink[6][1][0] = "sb06/sub01.do"; 
		mTitle[6][2][0] = "승인내역"; mLink[6][2][0] = "sb06/sub02.do";
		
	mTitle[4][0][0] = "통계"; mLink[4][0][0] = "sb04/sub01.do"; 		
	mTitle[4][1][0] = "접속로그조회"; mLink[4][1][0] = "sb04/sub01.do"; 
	mTitle[4][2][0] = "사용자로그"; mLink[4][2][0] = "sb04/sub02.do"; 
	mTitle[4][3][0] = "일자별방문자"; mLink[4][3][0] = "sb04/sub03.do"; 
	mTitle[4][4][0] = "월별방문자"; mLink[4][4][0] = "sb04/sub04.do"; 



%>