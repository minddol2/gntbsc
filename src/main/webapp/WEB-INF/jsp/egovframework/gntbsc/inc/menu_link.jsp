<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
String mTitle[][][] = new String[12][11][10];
String mLink[][][] = new String[12][11][10];

	mTitle[0][0][0] = "gnb메뉴"; mLink[0][0][0] = "";
			mTitle[0][1][0] = "페이스북"; mLink[0][1][0] = "#ready";
			mTitle[0][2][0] = "인스타"; mLink[0][2][0] = "#ready";
			mTitle[0][3][0] = "블로그"; mLink[0][3][0] = "https://blog.naver.com/gyeongnam_tourbiz";
			mTitle[0][4][0] = "유튜브"; mLink[0][4][0] = "https://www.youtube.com/channel/UCMuDjR1e1iVS-akcGEAEjkA";
		
		

	mTitle[1][0][0] = "경남관광기업지원센터"; mLink[1][0][0] = "sub01/sub01_01.do"; 		
		mTitle[1][1][0] = "센터소개"; mLink[1][1][0] = "sub01/sub01_01.do"; 
		mTitle[1][2][0] = "시설안내"; mLink[1][2][0] = "sub01/sub02_01.do"; 
		mTitle[1][3][0] = "담당자안내"; mLink[1][3][0] = "sub01/sub03_01.do"; 
		mTitle[1][4][0] = "오시는 길"; mLink[1][4][0] = "sub01/sub04_01.do"; 
	


	
	mTitle[2][0][0] = "운영프로그램"; mLink[2][0][0] = "sub02/sub01_01.do"; 
		mTitle[2][1][0] = "참여안내"; mLink[2][1][0] = "sub02/sub01_01.do";
		mTitle[2][2][0] = "지원사업"; mLink[2][2][0] = "sub02/sub02_01.do";
			mTitle[2][2][1] = "지원프로그램 소개"; mLink[2][2][1] = "sub02/sub02_01.do";
			mTitle[2][2][2] = "교육 및 컨설팅 지원사업"; mLink[2][2][2] = "sub02/sub02_02.do";
			mTitle[2][2][3] = "인플루언서 양성 교육 사업"; mLink[2][2][3] = "sub02/sub02_03.do";
		mTitle[2][3][0] = "운영사업"; mLink[2][3][0] = "sub02/sub03_01.do";
			mTitle[2][3][1] = "관광기업 창업 및 육성 지원 사업"; mLink[2][3][1] = "sub02/sub03_01.do";
			mTitle[2][3][2] = "도내 관광기업 역량강화"; mLink[2][3][2] = "sub02/sub03_02.do";
			mTitle[2][3][3] = "관광일자리 허브 구축 및 운영 사업"; mLink[2][3][3] = "sub02/sub03_03.do";
			mTitle[2][3][4] = "지역 관광산업 활성화 지원 사업"; mLink[2][3][4] = "sub02/sub03_04.do";
		mTitle[2][4][0] = "기업입주안내"; mLink[2][4][0] = "sub02/sub04_01.do";
		mTitle[2][5][0] = "모두를 위한 관광정보"; mLink[2][5][0] = "sub02/sub05_01.do";
		

	mTitle[3][0][0] = "입주기업안내"; mLink[3][0][0] = "sub03/sub01_01.do"; 
		mTitle[3][1][0] = "기업소개"; mLink[3][1][0] = "sub03/sub01_01.do"; 
		mTitle[3][2][0] = "기업홍보"; mLink[3][2][0] = "sub03/sub02_01.do"; 
		mTitle[3][3][0] = "경남관광스타트업"; mLink[3][3][0] = "sub03/sub03_01.do";



	mTitle[4][0][0] = "센터이용안내"; mLink[4][0][0] = "sub04/sub01_01.do"; 
		mTitle[4][1][0] = "기업 상담신청"; mLink[4][1][0] = "sub04/sub01_01.do"; 
		mTitle[4][2][0] = "일자리 지원 창구"; mLink[4][2][0] = "sub04/sub02_01.do"; 
		mTitle[4][3][0] = "회의실 대관 신청"; mLink[4][3][0] = "sub04/sub03_01.do"; 
			mTitle[4][3][1] = "대관신청안내"; mLink[4][3][1] = "sub04/sub03_01.do"; 
			mTitle[4][3][2] = "대관신청"; mLink[4][3][2] = "sub04/sub03_02.do"; 



	mTitle[5][0][0] = "알림마당"; mLink[5][0][0] = "sub05/sub01_01.do"; 
		mTitle[5][1][0] = "공지사항"; mLink[5][1][0] = "sub05/sub01_01.do";
		mTitle[5][5][0] = "센터소식"; mLink[5][5][0] = "sub05/sub05_01.do";
		mTitle[5][2][0] = "보도자료"; mLink[5][2][0] = "sub05/sub02_01.do"; 
		mTitle[5][3][0] = "FAQ"; mLink[5][3][0] = "sub05/sub03_01.do"; 
		mTitle[5][4][0] = "JOB Fair 일자리정보"; mLink[5][4][0] = "sub05/sub04_01.do"; 
		mTitle[5][6][0] = "관광in 일자리현황"; mLink[5][6][0] = "https://academy.visitkorea.or.kr/job/recruit/list.do"; 
		



	mTitle[11][0][0] = "회원서비스"; mLink[11][0][0] = "member/login.do"; 
		mTitle[11][1][0] = "로그인"; mLink[11][1][0] = "member/login.do"; 
		mTitle[11][2][0] = "회원가입"; mLink[11][2][0] = "member/join.do"; 
		mTitle[11][3][0] = "아이디/비밀번호찾기"; mLink[11][3][0] = "member/search.do"; 
		mTitle[11][4][0] = "마이페이지"; mLink[11][4][0] = "member/mypage.do"; 
			mTitle[11][4][1] = "대관신청현황"; mLink[11][4][1] = "member/mypage.do"; 
			mTitle[11][4][3] = "일자리상담현황"; mLink[11][4][3] = "member/myjob.do"; 
			mTitle[11][4][2] = "회원정보수정"; mLink[11][4][2] = "member/edit.do"; 
		
		mTitle[11][7][0] = "기업상담관리"; mLink[11][7][0] = "member/mentor_list.do"; 
		mTitle[11][5][0] = "회원탈퇴"; mLink[11][5][0] = "member/out.do"; 
		mTitle[11][6][0] = "로그아웃"; mLink[11][6][0] = "member/logout.do"; 
		
	




	mTitle[10][0][0] = "홈페이지이용안내"; mLink[10][0][0] = "";  
		mTitle[10][1][0] = "개인정보취급방침"; mLink[10][1][0] = "sub10/sub01_01.do";  
		mTitle[10][2][0] = "이용약관"; mLink[10][2][0] = "sub10/sub02_01.do";  
		mTitle[10][3][0] = "이메일무단수집거부"; mLink[10][3][0] = "sub10/sub03_01.do";  


%>