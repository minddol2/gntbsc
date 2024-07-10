<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
String lang_mode = (String) request.getAttribute("lang_temp");

String is_main = "";
int m1 = 2;
int m2 = 3;
int m3 = 2;
%>

<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/inc/top.jsp" flush="true" >
	<jsp:param name="is_main" value="<%=is_main%>"/>
</jsp:include>

<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/inc/sub_top.jsp" flush="true" >
		<jsp:param name="m1" value="<%=m1%>"/>
		<jsp:param name="m2" value="<%=m2%>"/>
		<jsp:param name="m3" value="<%=m3%>"/>
</jsp:include>


<jsp:include page="/WEB-INF/jsp/egovframework/gntbsc/sub02/tablist.jsp" flush="true" >
		<jsp:param name="m1" value="<%=m1%>"/>
		<jsp:param name="m2" value="<%=m2%>"/>
		<jsp:param name="m3" value="<%=m3%>"/>
</jsp:include>



<!--
<h5 class="tit_nm mb20">회차별 교육내용</h5>
        <table class="time_table tac mb20">
            <thead>
                <tr>
                    <th>과정</th>
                    <th>제목</th>
                    <th>날짜 및 시간</th>
                    <th>교육내용</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td rowspan="7" class="bgc">기 초</td>
                    <td>(1)오리엔테이션
                    </td>
                    <td rowspan="2">10. 14.(금) 10:00 ~ 13:00</td>
                    <td class="tal">
                    <ul class="dot_li">
                                                    <li>
                        오리엔테이션</li>
                                                      </ul>
                    </td>
                </tr>
                <tr>
                    <td>특강 및 토크콘서트</td>
                    <td class="tal">
                        <ul class="dot_li">
                            <li>
                                심용환 작가의 &lsquo;역사로 배우는 경남 관광이야기&rsquo;
                            </li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>(2)변화의 중심 MZ세대와 관광 트렌드!</td>
                    <td>10. 15.(토) 10:00 ~ 13:00</td>
                    <td class="tal">
                        <ul class="dot_li">
                            <li>관광 트렌드와 소비 환경 분석</li>
                            <li>관광객의 소비 심리와 미래 관광</li>
                            <li>MZ세대 유형의 여행시장 패턴 분석과 전략</li>
                            <li>MZ세대가 사랑하는 관광상품 성공 사례 공유</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>(3)관광 산업 플랫폼 비즈니스 전략과 활용법을 알아보아요!
                    </td>
                    <td>10. 21.(금) 10:00 ~ 13:00</td>
                    <td class="tal">
                        <ul class="dot_li">
                            <li>플랫폼 비즈니스의 개념과 이해</li>
                            <li>관광 플랫폼의 유형과 활용 사례</li>
                            <li>관광 패러다임 변화에 따른 관광 플랫폼의 발전 방향</li>
                            <li>나의 관광 콘텐츠와 맞는 플랫폼 찾기와 활용</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>(4)메타버스/NFT와 관광 콘텐츠가 만난다면?</td>
                    <td>10. 22.(토) 10:00 ~ 13:00</td>
                    <td class="tal">
                        <ul class="dot_li">
                            <li>관광기업 메타버스 활용 사례</li>
                            <li>제페토 체험 및 아이템 만들기</li>
                            <li>NFT를 활용한 마케팅 전략</li>
                            <li>ZEP공간 활용 사례 및 나만의 ZEP 맵 만들기</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>(5)관광정책 DMO와 지역 연계 활용법</td>
                    <td>10. 28.(금) 10:00 ~ 13:00</td>
                    <td class="tal">
                        <ul class="dot_li">
                            <li>국내 지역별 DMO 우수사례 소개</li>
                            <li>관광두레 이해와 지역 연계 방안</li>
                            <li>경남 지역 DMO의 발전 방향과 이해</li>
                            <li>관광두레PD의 역할과 지역 활용 방법</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>(6)다양한 유형의 여행 상품, 나도 기획해볼까?</td>
                    <td>10. 29.(토) 10:00 ~ 13:00</td>
                    <td class="tal">
                        <ul class="dot_li">
                            <li>국내여행상품 만들어지는 과정과 업무</li>
                            <li>여행상품의 기획 툴 활용과 디자이닝</li>
                            <li>여행상품 기획 실전 4가지 전략과 브랜드</li>
                            <li>경남 여행상품 기획안 발표 및 실습</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td rowspan="7" class="bgc">심화</td>
                    <td>(1)디지털 융합 쉽게 이해하기</td>
                    <td>10. 14.(금) 14:00 ~ 17:00</td>
                    <td class="tal">
                        <ul class="dot_li">
                            <li>기업의 디지털 전환 가속화와 비대면 사회의 부상</li>
                            <li>코로나19로 인한 관광업계 디지털 전환과 플랫폼 사업자의 영향
                            </li>
                            <li>온라인 기반의 관광소비 확산과 실감형 콘텐츠의 관광 활용 증가</li>
                            <li>관광산업과 ICT 산업 분야와의 융복합화와 새로운 비즈니스 모델</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>(2)뉴노멀시대 변화하는 MICE산업이란?</td>
                    <td>10. 15.(토) 14:00 ~ 17:00</td>
                    <td class="tal">
                        <ul class="dot_li">
                            <li>MICE 산업 동향과 글로벌 트렌드</li>
                            <li>MICE 관광 상품개발 및 관광지 관리 및 마케팅 분석</li>
                            <li>
                                하이브리드형 국제회의 기획 성공 및 실패 사례</li>
                            <li>경남 기반 국내축제/MICE 기획안 발표 및 실습</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>(3)관광에서 빅데이터는 어떻게 활용될까?</td>
                    <td>10. 21.(금) 14:00 ~ 17:00</td>
                    <td class="tal">
                        <ul class="dot_li">
                            <li>관광 빅데이터 개념 및 용어 이해
                            </li>
                            <li>빅데이터 기반 의사결정 사례 소개</li>
                            <li>관광 데이터랩 소개 및 활용법</li>
                            <li>우리 지역 관광 상황판 활용하기</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>(4)다양한 여행 상품을 개발하기 위한 방법!</td>
                    <td>10. 22.(토) 14:00 ~ 17:00</td>
                    <td class="tal">
                        <ul class="dot_li">
                            <li>여행 상품 개발 방법 : 국내 여행 상품</li>
                            <li>여행 상품 개발 방법 : 해외 여행 상품</li>
                            <li>여행 상품 개발 방법 : 축제 및 MICE 여행 상품</li>
                            <li>여행 상품 개발 방법 : FIT 여행 상품</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>(5)크라우드펀딩! 이제는 관광에서도 필수?</td>
                    <td>10. 28.(금) 14:00 ~ 17:00</td>
                    <td class="tal">
                        <ul class="dot_li">
                            <li>온라인 플랫폼 유형별 디지털 콘텐츠 제작 기법</li>
                            <li>크라우드 펀딩 사이트별 등록 절차와 상세 페이지 제작법</li>
                            <li>후원형과 증권형의 구분 이해와 맞춤 전략 방법</li>
                            <li>크라우드 펀딩 목표 금액 달성을 위한 홍보 전략 및 활용</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>(6)특강 및 토크콘서트</td>
                    <td rowspan="2">10. 29.(토) 14:00 ~ 17:00</td>
                    <td>
                        오성민 PD의 &lsquo;다시 돌아온 경남관광속으로&rsquo;
                    </td>
                </tr>
                <tr>
                    <td>수료식</td>
                    <td class="tal">
                        <ul class="dot_li">
                            <li>
                                수료식 및 참가자 네트워킹</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td rowspan="4" class="bgc">창업</td>
                    <td>(1)전략적인 사업계획서 및 비즈니스 모델</td>
                    <td>11. 2.(수) 14:00 ~ 17:00</td>
                    <td class="tal">
                        <ul class="dot_li">
                            <li>로컬 관광업 비즈니스 모델 구성 요소의 이해</li>
                            <li>비즈니스 모델 설계 실습</li>
                            <li>비즈니스 모델 기반 사업계획서 작성법 및 작성 실습</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>(2)경남 관광 상품 기획을 위한 아이디어!</td>
                    <td>11. 3.(목) 14:00 ~ 17:00</td>
                    <td class="tal">
                        <ul class="dot_li">
                            <li>여행상품의 기획 툴 활용과 디자이닝</li>
                            <li>여행상품 기획 실전 4가지 전략과 브랜드</li>
                            <li>경남 여행상품 기획안 발표 및 실습</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>(3)스타트업을 위한 경영실무(세무 및 법률)</td>
                    <td>11. 4.(금) 14:00 ~ 17:00</td>
                    <td class="tal">
                        <ul class="dot_li">
                            <li>세무/회계 : 사업자등록, 부가가치세/법인세 등</li>
                            <li>법률 : 법인 설립, 임대차 계약, 고용 계약 등</li>
                            <li>특허 : 특허 출원 절차, 상표 및 디자인 출원 등</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>(4)비즈니스 매너, 이것만 기억하자!</td>
                    <td>11. 5.(토) 14:00 ~ 17:00</td>
                    <td class="tal">
                        <ul class="dot_li">
                            <li>스타트업이 갖추어야 하는 비즈니스 매너(CS)</li>
                            <li>성공한 창업가의 이미지메킹 전략과 사례</li>
                            <li>비대면 커뮤니케이션의 원칙 및 현업 적용법</li>
                        </ul>
                    </td>
                </tr>
            </tbody>
        </table>-->
<!--
<table class="time_table tac mb20">
	<thead>
		<tr>
				<th>과정</th>
				<th>제목</th>
				<th>날짜 및 시간</th>
				<th>교육내용</th>
		</tr>
	</thead>
	<tbody>
		<tr>
				<td rowspan="7" class="bgc">기
				초</td>
				<td>(1)자세히 들여다보는 로컬여행의 재발견!</td>
				<td>6. 10.(금)<br/>
				10:00 ~13:00</td>
				
				<td class="tal">
					<ul class="dot_li">
						<li>포스트 코로나 시대 여행 패러다임의 변화</li>
						<li>로컬관광의 이해와 우수 사례</li>
						<li>지역 원천 소재의 발굴과 개발 방법</li>
						<li>핫플레이스의 발견과 확산 프로세스의 이해</li>
					</ul>
			 </td>
		</tr>
		<tr>
				<td>(2)사례로 보는 경남관광의 현재와 미래</td>
				<td>6. 11.(토)<br/>
				10:00 ~13:00</td>			
				<td class="tal">
					<ul class="dot_li">
						<li>경남 관광의 과거와 현실, 그리고 미래</li> 
						<li>경남 원천 소재를 활용한 관광 콘텐츠 우수 사례</li> 
						<li>경남형 관광기업의 발견과 사업화 전략</li> 
						<li>실습 : 경남 원천 소재 기반 관광 콘텐츠 기획안 발표/피드백</li> 
					</ul>
				</td>
		</tr>
		<tr>
				<td>(3)세계로 뻗어가는 K-관광과 앞으로의 과제</td>
				<td>6. 17.(금)<br/>
				10:00 ~ 13:00</td>
				
				<td class="tal">
					<ul class="dot_li">
						<li>코로나19 이후의 한국 관광의 변화된 모습</li> 
						<li>국내 관광 우수 사례 공유</li> 
						<li>해외 관광 우수 사례 공유</li> 
						<li>실습 : 국내외 우수 관광지 사례 발표/공유</li> 
					</ul>
				</td>
		</tr>
		<tr>
				<td>(4)매출을 향상시키는 온라인 마케팅 방법은?</td>
				<td>6. 18.(토)<br/>
				10:00 ~ 13:00</td>				
				<td class="tal">
					<ul class="dot_li">
						<li>온라인 마케팅 데이터 및 고객 데이터 분석/활용법</li>
						<li>온라인 마케팅을 통한 브랜드 성공사례</li>
						<li>SNS채널별 최적화 포스팅 전략</li>
						<li>SNS매체별 콘텐츠 제작과 광고집행 방법</li> 
					</ul>
				</td>
		</tr>
		<tr>
				<td>(5)관광 상품화 콘텐츠 기획자가 되어봅시다! </td>
				<td>6. 24.(금)<br/>
				10:00 ~ 13:00</td>			
				<td class="tal">
					<ul class="dot_li">
						<li>관광 자원의 이해와 지역 관광콘텐츠 기획방법론</li> 
						<li>지역 관광 명소 발굴 및 연계성 찾기</li> 
						<li>취향에 맞는 여행 상품 기획 사례 분석</li> 
						<li>실습 : 경남 관광 자원 기반 콘텐츠 기획안 발표/    피드백</li> 
					</ul>
				</td>
		</tr>
		<tr>
				<td>(6)특강 및 토크콘서트</td>
				<td rowspan="2">6. 25.(토)<br/>
				10:00 ~ 13:00</td>			
				<td class="tal">
					<ul class="dot_li">
						<li>문화콘텐츠를 통해 알아보는 K-관광 트렌드 특강 및 토크 콘서트 </li> 
					</ul>
				 </td>
		</tr>
		<tr>
				<td>수료식</td>				
				<td class="tal">
					<ul class="dot_li">
						<li>수료식</li> 
					</ul>
				 </td>
		</tr>
		<tr>
				<td rowspan="7" class="bgc">심화</td>
				<td>(1)관광 트렌드 분석과 관광벤처를 알아봐요!</td>
				<td>6. 10.(금)<br/>
				14:00 ~ 17:00</td>				
				<td class="tal">
					<ul class="dot_li">
						<li>관광 트렌드 분석 및 지역 관광 활용 방안</li> 
						<li>코로나19 위기 대응전략과 여행 인식 변화</li> 
						<li>관광창업과 관광벤처의 이해와 활용</li> 
						<li>한국관광공사 관광벤처 공모 방법 이해</li> 
					</ul>
				</td>
		</tr>
		<tr>
				<td>(2)스토리텔링으로 만들어보는 관광 상품 기획!</td>
				<td>6. 11.(토)<br/>
				14:00 ~ 17:00</td>
				
				<td class="tal">
					<ul class="dot_li">
						<li>스토리텔링을 위한 구조 짜기와 스토리텔링 매트릭스 활용</li> 
						<li>이미지로 보여주고 이야기할 수 있는 스토리 프로세스 기법</li> 
						<li>스토리텔링형 콘텐츠의 성공사례 공유</li> 
						<li>실습 : 스토리프로세스 작성/발표</li> 
					</ul>
				 </td>
		</tr>
		<tr>
				<td>(3)경남 관광의 이유, 우리의 관광상품 때문일까?</td>
				<td>6. 17.(금)<br/>
				14:00 ~ 17:00</td>				
				<td class="tal">
					<ul class="dot_li">
						<li>제품형 관광상품의 이해와 개발</li> 
						<li>체험형 관광상품의 이해와 개발</li> 
						<li> ICT/기술형 관광상품의 이해와 개발</li> 
						<li>실습 : 경남의 자원을 활용한 관광상품 발표/피드백</li> 
					</ul>
				</td>
		</tr>
		<tr>
				<td>(4)고객의 마음에 달라붙는 콘텐츠 브랜딩 기술!</td>
				<td>6. 18.(토)<br/>
				14:00 ~ 17:00</td>				
				<td class="tal">
					<ul class="dot_li">
						<li>자기다움과 우리다움이 공존하는 콘텐츠를 위한 브랜딩 전략</li> 
						<li>브랜드 이미지의 실체와 브랜딩 휠 만들기 실습</li> 
						<li>고객과 소통하는 브랜드 모델 만드는 방법과 성공사례 공유</li> 
						<li>실습 : 브랜드 메시지 만들기 실습/발표</li> 
					</ul>
				</td>
		</tr>
		<tr>
				<td>(5)SNS채널별 전략과 디지털 마케팅이 답이다!</td>
				<td>6. 24.(금)<br/>
				14:00 ~ 17:00</td>				
				<td class="tal">
					<ul class="dot_li">
						<li>온라인 콘텐츠와 디지털 마케팅의 개념 이해</li> 
						<li>실사례를 활용한 관광콘텐츠 마케팅 연구</li> 
						<li>SNS 채널별 인바운드 마케팅 운영 전략과 사례 </li> 
						<li>실습 : 기업 제품별 마케팅 계획서 작성/코칭</li> 
					</ul>
				</td>
		</tr>
		<tr>
				<td>(6)특강 및 토크콘서트</td>
				<td rowspan="2">6. 25.(토)<br/>
				14:00 ~ 17:00</td>				
				<td class="tal">
					<ul class="dot_li">
						<li>포스트 코로나시대 지속가능관광, ESG 경영 특강 및 토크 콘서트</li> 
					</ul>
				 </td>
		</tr>
		<tr>
				<td>수료식</td>				
				<td class="tal">
					<ul class="dot_li">
						<li>수료식</li> 
					</ul>
				 </td>
		</tr>
		<tr>
				<td rowspan="4" class="bgc">창업</td>
				<td>(1)스타트업을 위한 창업가 정신</td>
				<td>6. 29.(수)<br/>
				14:00 ~ 17:00</td>				
				<td class="tal">
					<ul class="dot_li">
						<li>급변하는 미래 시대를 대비한 창업의 의미와 필요성/li> 
						<li>스타트업 관리를 위한 마인드 셋과 비즈니스 매너(CS)/li> 
						<li>관광 스타트업이 알아야 할 기초 창업 지식</li> 
					</ul>
				</td>
		</tr>
		<tr>
				<td>(2)시장 분석과 고객 발굴 방법론</td>
				<td>6. 30.(목)<br/>
				14:00 ~ 17:00</td>				
				<td class="tal">
					<ul class="dot_li">
						<li>제품 또는 서비스의 문제 발굴 및 정의</li> 
						<li>시장 내 사업 성장을 견인하는 핵심타겟 설정</li> 
						<li>내적/외적 경쟁 환경 분석 및 경쟁 우위 요소</li> 
					</ul>
				</td>
		</tr>
		<tr>
				<td>(3)제품 및 서비스 비즈니스 모델 완성은 이렇게!</td>
				<td>7. 1.(금)<br/>
				14:00 ~ 17:00</td>				
				<td class="tal">
					<ul class="dot_li">
						<li>관광벤처기업 비즈니스 모델의 이해와 성공사례 공유</li> 
						<li>B2B/B2C 강화를 위한 비즈니스 모델 구조화</li> 
						<li>제품 및 서비스  비즈니스모델  검증 및 작성법 </li> 
					</ul>
				</td>
		</tr>
		<tr>
				<td>(4)전략적이고 임팩트 있는 사업계획서 작성법!</td>
				<td>7. 2.(토)<br/>
				14:00 ~ 17:00</td>				
				<td class="tal">
					<ul class="dot_li">
						<li>관광 스타트업 사업계획서 작성의 이해</li> 
						<li>관광 스타트업 사업계획서 항목별 작성법 및 필수 요소</li> 
						<li>사업계획서 구조화 및 핵심 포인트 작성 팁</li> 
					</ul>
				</td>
		</tr>
	</tbody>
</table>-->
<!--<div class="pointbox mb bdbt">
	<ul class="dot_li">
		<li>일정, 장소, 교육 내용 및 방법, 강사진 등은 사정에 따라 변경될 수 있으며, 코로나19로
                  상황에 따라 변경 가능 </li>
		<li>기초·심화 중복지원 가능하며, 교육장소는 오프라인 또는 온라인 중 택1만 가능 </li>
		<li> 기초는 예비창업자에 추천, 심화는 재직자에 추천, 창업은 기초/심화 수료자에 한해 신청 가능  </li>
		<li> 특강만 신청할 경우 온라인으로만 수강 가능 (단, 특강 2회 모두 참석 필수)  </li>
	</ul>
</div>
<div class="business_img bdbt">
	<ul>
		<li><a href="#img3" class="litebox"><img src="<c:url value='/img/new-pos20220919-1.png'/>" alt="관광아카데미포스터 01" /></a></li>
		<li><a href="#img4" class="litebox"><img src="<c:url value='/img/new-pos20220919-2.jpg'/>" alt="관광아카데미포스터 02" /></a></li>
	</ul>
</div>-->
<!--
<div class="business_img bdbt">
	<ul>
		<li><img src="<c:url value='/img/b_academy_img01.jpg'/>" alt="관광아카데미포스터 01" /></li>
		<li><img src="<c:url value='/img/b_academy_img02.jpg'/>" alt="관광아카데미포스터 02" /></li>
	</ul>
</div>
-->


<!--20240710추가-->
<h4 class="tit_dot mb20">지역기반 경남관광 협업 프로젝트</h4>
<table class="comm_table mb20">
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tbody>
		<tr>
			<th class="bgc">공모기간</th>
			<td>상반기 중 모집 예정</td>
		</tr>
		<tr>
			<th class="bgc">공모내용</th>
			<td>협업을 통해 시너지 효과 창출할 수 있는 사업, 관광객
                             대상 관광상품/서비스/제품을 제공하는 사업, 협약 기간
                             내 구체적 성과 창출이 가능한 사업</td>
		</tr>
		<tr>
			<th class="bgc">공모대상</th>
			<td>경남도내·외 2개 이상 관광기업이 1팀으로 공모 /
                             경남도 내·외 관광사업을 운영 중인 기업(대표기업+협업기업)</td>
		</tr>
		<tr>
			<th class="bgc">지원규모</th>
			<td>5개 프로젝트 내외 선정 /
                             최대 5천만원 협업사업비 지원</td>
		</tr>
		<tr>
			<th class="bgc">지원사항</th>
			<td>협업사업비(최대5천만원 지원 – 홍보비 및 마케팅비            등), 사전컨설팅 및 상시멘토링, 기업간 네트워킹 지원</td>
		</tr>
	</tbody>
</table>
<div class="business_img mb bdbt">
	<ul class="list02">
		<li><img src="/img/new_prj01.jpg" alt="경남관광 협업프로젝트 포스터"></li>
	</ul>
</div>
<!--20240710추가-->



<h4 class="tit_dot mb20">도내 관광기업 상설 컨설팅 지원</h4>
<div class="pointbox mb20">
	<p class="fsb fwb tac">도내 관광기업 및 예비 창업자의 경영 개선 및 애로사항 해결</p>
</div>
<table class="comm_table mb20">
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tbody>
		<tr>
			<th class="bgc">추진대상</th>
			<td>도내 관광업 종사자 및 예비 창업자 등</td>
		</tr>
		<tr>
			<th class="bgc">지원내용</th>
			<td>6개 분야
                 (창업, 마케팅/홍보, 투자, 경영심화, 관광, 제품디자인) 무료 멘토링 지원</td>
		</tr>
	</tbody>
</table>
<p class="mb20">※ 기업상담 신청은 <a href="<c:url value='/'/>sub04/sub01_01.do" class="ic_blank">상담신청안내를 참조</a>해주세요.</p>
<div class="business_img bdbt">
	<ul class="list02">
		<li><a href="#img1" class="litebox"><img src="<c:url value='/img/new-consulting-1.jpg'/>" alt="관광기업 상설컨설팅 포스터" /></a></li>
		<li><a href="#img2" class="litebox"><img src="<c:url value='/img/new-consulting-2.jpg'/>" alt="관광기업 상설컨설팅 포스터" /></a></li>
	</ul>
</div>


<!--
<h4 class="tit_dot mb20">경남 관광 크리에이터 발굴 및 콘텐츠 제작 </h4>
<div class="pointbox mb20">
	<p class="fsb fwb tac">지역관광자원을 소재로 관광 콘텐츠 제작 및 운영 교육 지원</p>
</div>
<table class="comm_table mb20">	
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tbody>	
		<tr>
			<th class="bgc">신청자격</th>
			<td>
				<ul class="dot_li">
					<li>비대면 관광콘텐츠 개발에 관심 있는 경남도민</li>
					<li>공고일 기준 사업장 소재지가 경남으로 되어 있는 관광 관련 사업체</li>
				</ul>
			</td>
		</tr>
		<tr>
			<th class="bgc">교육기간</th>
			<td>21.10 ~ 12</td>
		</tr>
		<tr>
			<th class="bgc">참여혜택</th>
			<td>
				<ul class="dot_li">
					<li>무료 교육 및 총 300만원의 상금</li>
					<li>우수콘텐츠에 한해 앱 내 상용화 지원</li>
				</ul>
			</td>
		</tr>
		<tr>
			<th class="bgc">교육내용</th>
			<td>웹 기반 저작 도구를 활용한 비대면 관광 콘텐츠 개발 교육</td>
		</tr>
		<tr>
			<th class="bgc">교육신청</th>
			<td><a href="https://gyeongnam.tourbiz.or.kr/sub05/sub01_view.do?bbsId=BBSMSTR_000000000301&nttId=253&bbsTyCode=BBST03&bbsAttrbCode=BBSA03&authFlag=Y&pageIndex=1" class="ic_blank">교육신청안내</a> </td>
		</tr>
	</tbody>
</table>
<div class="business_img bdbt">
	<ul class="list01">
		<li><img src="<c:url value='/img/b_creator_img01.jpg'/>" alt="경남 관광 크리에이터 발굴 및 콘텐츠 제작" /></li>
	</ul>
</div>
-->

<!--
<h4 class="tit_dot mb20">액셀러레이팅 프로그램 </h4>
<div class="pointbox mb20">
	<p class="fsb fwb tac"> 도내 관광기업 투자유치 및 온라인 마케팅 역량 강화 지원</p>
</div>
<table class="comm_table mb20">	
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tbody>	
		<tr>
			<th class="bgc">신청자격</th>
			<td>공고일 기준 사업장 소재지가 경남으로 되어 있는 관광 관련 사업체</td>
		</tr>
		<tr>
			<th class="bgc">신청기간</th>
			<td>2021. 9. 1.(수) ~ 9. 23.(목)</td>
		</tr>
		<tr>
			<th class="bgc">모집규모</th>
			<td>
				<ul class="dot_li">
					<li>총 15개 내외 사업체 </li>
					<li>IR 투자유치 지원 과정 5개사</li>
					<li>온라인 판로지원 과정 10개사</li>
				</ul>
			</td>
		</tr>
		<tr>
			<th class="bgc">행사장소</th>
			<td>경남관광기업지원센터 대회의실</td>
		</tr>
		<tr>
			<th class="bgc">참여혜택</th>
			<td>
				<ul class="dot_li">
					<li>투자 지원금(총 500만원 이내)</li>
					<li>크라우드 펀딩, 라이브 커머스 송출 지원</li>
					<li>데모데이를 통한 투자유치 지원</li>
					<li>IR 작성, 코칭, 온라인 마케팅, 상품 콘텐츠 제작 등 교육 </li>
					<li>타 지역 우수사례 벤치마킹 투어 등</li>
				</ul>
			</td>
		</tr>		
		<tr>
			<th class="bgc">참가신청</th>
			<td><a href="https://gyeongnam.tourbiz.or.kr/sub05/sub01_view.do?bbsId=BBSMSTR_000000000301&nttId=254&bbsTyCode=BBST03&bbsAttrbCode=BBSA03&authFlag=Y&pageIndex=1" class="ic_blank">공고문 참조</a> </td>
		</tr>
	</tbody>
</table>
<div class="business_img bdbt">
	<ul class="list01">
		<li><img src="<c:url value='/img/b_exel_img01.jpg'/>" alt="액셀러레이팅 포스터" /></li>
	</ul>
</div>-->


<!--

<h4 class="tit_dot mb20">관광기업 온라인 마케팅 지원</h4>
<div class="pointbox mb20">
	<p class="fsb fwb tac">온라인 마케팅 및 홍보활동을 통한 관광기업의 경쟁력 강화</p>
</div>
<table class="comm_table mb20">	
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tbody>	
		<tr>
			<th class="bgc">지원대상</th>
			<td>도내 관광사업체 및 센터 입주기업</td>
		</tr>
		<tr>
			<th class="bgc">지원내용</th>
			<td>기업진단(컨설팅), SNS마케팅, 온라인 판로개척, 브랜드 디자인, 신제품 제작지원, E-커머스 지원 등</td>
		</tr>
	</tbody>
</table>
<div class="business_img">
	<ul class="list01">
		<li><a href="#img5" class="litebox"><img src="<c:url value='/img/online-marketing-1.jpg'/>" alt="관광기업 온라인 마케팅 지원사업 포스터" /></a></li>
	</ul>
</div>


-->
<!--
<h4 class="tit_dot mb20">경남 관광 청년창업 사관학교 운영</h4>
<table class="comm_table mb20">
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tbody>
		<tr>
			<th class="bgc">신청자격</th>
			<td>19세 이상 39세 이하 경남도 청년 대상</td>
		</tr>
		<tr>
			<th class="bgc">신청기간</th>
			<td>2023. 6. 5(월) ~ 7. 16(일)까지</td>
		</tr>
		<tr>
			<th class="bgc">모집인원</th>
			<td>
				<ul class="dot_li">
					<li>창업 스타트 과정(10개팀)</li>
					<li>엑셀러레이션 과정(10개팀)</li>
				</ul>
			</td>
		</tr>
		<tr>
			<th class="bgc">모집유형</th>
			<td>경남기반의 관광체험 서비스, 관광인프라 등</td>
		</tr>
		<tr>
			<th class="bgc">참여혜택</th>
			<td>관광창업 맞춤 교육 및 컨설팅 제공, 졸업증 및 기념품 지급,    멘토링 등 후속지원</td>
		</tr>

	</tbody>
</table>
<h5 class="tit_nm mb20">프로그램 일정</h5>
<table class="time_table tac mb20">
	<thead>
		<tr>
			<th>프로그램</th>
			<th>일시</th>
			<th>장소</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="bgc">교 육</td>
			<td>23.7.20(목) ~ 8.29(화)</td>
			<td>경남관광기업지원센터</td>				
		</tr>
		<tr>
			<td class="bgc">집중캠프</td>
			<td>23.8.24(목) ~ 8.25(금)</td>
			<td>통영 동원리조트</td>				
		</tr>
		<tr>
			<td class="bgc">공모전</td>
			<td>23.8.31(목) 09:00~ 17:00</td>
			<td>창원컨벤션센터</td>				
		</tr>
	</tbody>
</table>
-->



<h4 class="tit_dot mb20">경남 관광스타트업 팝업스토어 운영</h4>
<div class="pointbox mb20">
	<p class="fsb fwb tac">도내 관광기업 상품 판매 활성화 및 인지도 제고</p>
</div>
<table class="comm_table bdbt">
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tbody>
		<tr>
			<th class="bgc">운영기간</th>
			<td>하반기 운영 예정 </td>
		</tr>
	</tbody>
</table>




<!--20240710추가-->

<h4 class="tit_dot mb20">관광상품 판매·홍보 박람회 참가</h4>
<div class="pointbox mb20">
	<p class="fsb fwb tac">국내 주요 관광박람회 참가 및 관광 홍보관 운영을 통한 관광객 유치</p>
</div>
<table class="comm_table mb20">
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tbody>
		<tr>
			<th class="bgc">활동내용</th>
			<td>경남 주요 관광자원 홍보를 통한 경남관광 인지도 제고
                             / 경남관광기업지원센터 입주기업 아웃도어 관련 제품 및
                              브랜드 홍보<br><br>

                              <b>2024년 박람회 참가 : </b><br>
                <ul class="dot">
                    <li>'24. 3. 21.(목) ~ 3. 23.(토) 2024 경남관광박람회 참가</li>
                    <li>'24. 5. 24.(금) ~ 5. 26.(일) 2024 GOCAF(국제아웃도어캠핑         &레포츠 페스티벌) 참가</li>
                </ul>
            </td>
		</tr>
	</tbody>
</table>
<div class="business_img bdbt">
	<ul class="list03">
		<li><img src="<c:url value='/img/newBs03.jpg'/>" alt="" /></li>
		<li><img src="<c:url value='/img/newBs04.jpg'/>" alt="" /></li>
		<li><img src="<c:url value='/img/newBs05.jpg'/>" alt="" /></li>
	</ul>
</div>

<!--20240710추가-->




<div id="img1" class="program-img-box no-display">
    <img src="/img/new-consulting-1.jpg" alt=""/>
</div>
<div id="img2" class="program-img-box no-display">
    <img src="/img/new-consulting-2.jpg" alt=""/>
</div>
<div id="img3" class="program-img-box no-display">
    <img src="/img/new-pos20220919-1.png" alt=""/>
</div>
<div id="img4" class="program-img-box no-display">
    <img src="/img/new-pos20220919-2.jpg" alt=""/>
</div>

<div id="img5" class="program-img-box no-display">
    <img src="/img/online-marketing-1.jpg" alt=""/>
</div>




			</div><!--con-->
		</div><!--subcon-->
	</div><!--subwrap-->





<%@ include file="/WEB-INF/jsp/egovframework/gntbsc/inc/footer.jsp" %>