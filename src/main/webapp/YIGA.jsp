<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #1a1f36;
            color: #fff;
            overflow-y: auto;
        }

        .container {
            display: flex;
            height: 100vh;
            overflow: hidden;
        }

        .main {
            flex: 1;
            padding: 20px;
            display: flex;
            flex-direction: column;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .header .search {
            display: flex;
            align-items: center;
            background-color: #2a2e45;
            border-radius: 5px;
            padding: 5px 10px;
        }

        .header .search i {
            color: #9fa1b4;
            cursor: pointer;
        }

        .content {
            display: flex;
            flex: 1;
        }

        .left-panel {
            flex: 1;
            padding-right: 20px;
        }

        .right-panel {
            flex: 2;
            background-color: #1a1f36;
            border-radius: 10px;
            padding: 20px;
        }

        .UPT {
            height: 90%;
            overflow-y: auto;
        }

        .UPT,
        .check-button,
        .live-upt2us,
        .earnings-summary {
            background-color: #2a2e45;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;

        }

        .UPT .upt2 {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            
        }

        .UPT .upt2:last-child {
            margin-bottom: 0;
        }

        .UPT .upt2 div {
            text-align: right;
        }

        .UPT .upt2 div span {
            display: block;
        }

        .check-button,
        .live-upt2us {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .check-button button {
            background-color: #4e5cdb;
            border: none;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .live-upt2us table {
            width: 100%;
            border-collapse: collapse;
        }

        .live-upt2us table th,
        .live-upt2us table td {
            padding: 10px;
            text-align: left;
        }

        .live-upt2us table th {
            background-color: #3a3e52;
        }

        .live-upt2us table td {
            background-color: #2a2e45;
        }

        .live-upt2us table td .details {
            background-color: #4e5cdb;
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
        }

        .earnings-summary canvas {
            width: 100%;
            height: 300px;
        }

        nav {
            overflow: hidden;
            position: relative;
            width: calc(250px + 20px);
            z-index: 2;
        }

        .menu-btn {
            position: absolute;
            top: 20px;
            right: 20px;
            cursor: pointer;
            z-index: 3;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 20px;
            color: #fff;
        }

        .menu-btn .line {
            width: 100%;
            height: 2px;
            background-color: #fff;
            transition: transform 0.5s ease, opacity 0.5s ease;
        }

        .menu-btn.open .line--1 {
            transform: translateY(9px) rotate(-45deg);
        }

        .menu-btn.open .line--2 {
            opacity: 0;
        }

        .menu-btn.open .line--3 {
            transform: translateY(-9px) rotate(45deg);
        }

        .nav-links {
            position: absolute;
            right: -20px;
            top: 50%;
            transform: translateY(-50%);
            width: calc(250px + 20px);
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background-color: #111528;
            padding: 20px;
            transition: transform 0.5s ease;
            overflow-y: auto;
        }

        .nav-links a {
            color: #9fa1b4;
            text-decoration: none;
            margin: 10px 0;
            display: block;
            font-size: 16px;
        }

        .nav-links a:hover {
            color: #fff;
        }

        .nav-links ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .nav-links ul li {
            margin: 5px 0;
            cursor: pointer;
            padding: 5px 10px;
            background-color: #2a2e45;
            border-radius: 5px;

        }

        ul {
            padding: 0;
        }

        li {
            list-style: none;
            line-height: 34px;
        }

        a {
            display: block;
            text-decoration: none;
            color: #616161;
            text-align: center;
        }

        .snd_menu {
            background: #ffffff;
        }

        .trd_menu {
            background: #ddd;
        }

        .sub_menu {
            display: none;
        }

        /* 서브메뉴들 숨김 */

        .selec {
            background: #4e5cdb;
            color: #ffffff;
        }

        .snd_menu {
            background: #ffffff;
        }

        .trd_menu {
            background: #ddd;
        }

        .sub_menu {
            display: none;
        }

        .selec {
            background: #4e5cdb;
            color: #ffffff;
        }

         /* 이전 페이지 이동 아이콘 흰색으로 바꾸기(아니 이거 왜 안 돼...) */
         .index-page {
            color: #fff;
            text-decoration: none;
        }
        .index-page:hover {
            color: #fff;
        }
        /*여기까지 아이콘 흰색*/
    </style>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="shortcut icon" href="icon/fa2.ico" type="image/x-icon">
	    <title>ISMS-P 인증 분석 자동화 UPT</title>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
	</head>
	<body>
	    <div class="container">
	        <!-- Side Navbar -->
	        <nav>
	            <div class="menu-btn">
	                <div class="line line--1"></div>
	                <div class="line line--2"></div>
	                <div class="line line--3"></div>
	            </div>
	            <div class="nav-links"> <!--와.. 이거 진짜 빡세다... 너무 힘들어... 제발.. 이거 고칠 때는 미리 말해주세요.-->
	                <nav>
	                    <ul id="main_menu">
	                        <li><a href="#">1. 관리체계 수립 및 운영</a> <!--아 맞다 이거 수정..-->
	                            <ul class="snd_menu sub_menu">
	                                <li><a href="#">1.1. 관리체계 기반 마련</a>
	                                    <ul class="trd_menu sub_menu">
	                                        <li><a href="#">1.1.1 경영진의 참여</a></li>
	                                        <li><a href="#">1.1.2 최고책임자의 지정</a></li>
	                                        <li><a href="#">1.1.3 조직 구성</a></li>
	                                        <li><a href="#">1.1.4 범위 설정</a></li>
	                                        <li><a href="#">1.1.5 정책 수립</a></li>
	                                        <li><a href="#">1.1.6 자원 할당</a></li>
	                                    </ul>
	                                </li>
	                                <li><a href="#">1.2. 위험 관리</a>
	                                    <ul class="trd_menu sub_menu">
	                                        <li><a href="#">1.2.1 정보자산 식별</a></li>
	                                        <li><a href="#">1.2.2 현황 및 흐름분석</a></li>
	                                        <li><a href="#">1.2.3 위험 평가</a></li>
	                                        <li><a href="#">1.2.4 보호대책 선정</a></li>
	                                    </ul>
	                                </li>
	                                <li><a href="#">1.3. 관리체계 운영</a>
	                                    <ul class="trd_menu sub_menu">
	                                        <li><a href="#">1.3.1 보호대책 구현</a></li>
	                                        <li><a href="#">1.3.2 보호대책 공유</a></li>
	                                        <li><a href="#">1.3.3 운영현황 관리</a></li>
	                                    </ul>
	                                </li>
	                                <li><a href="#">1.4. 관리체계 점검 및 개선</a>
	                                    <ul class="trd_menu sub_menu">
	                                        <li><a href="#">1.4.1 법적 요구사항 준수 검토</a></li>
	                                        <li><a href="#">1.4.2 관리체계 점검</a></li>
	                                        <li><a href="#">1.4.3 관리체계 개선</a></li>
	                                    </ul>
	                                </li>
	                            </ul>
	                        </li>
	                        <li><a href="#">2. 보호대책 요구사항</a>
	                            <ul class="snd_menu sub_menu">
	                                <li><a href="#">2.1. 정책, 조직, 자산 관리</a>
	                                    <ul class="trd_menu sub_menu">
	                                        <li><a href="#">2.1.1 정책의 유지관리</a></li>
	                                        <li><a href="#">2.1.2 조직의 유지관리</a></li>
	                                        <li><a href="#">2.1.3 정보자산 관리</a></li>
	                                    </ul>
	                                </li>
	                                <li><a href="#">2.2. 인적 보안</a>
	                                    <ul class="trd_menu sub_menu">
	                                        <li><a href="#">2.2.1 주요 직무자 지정 및 관리</a></li>
	                                        <li><a href="#">2.2.2 직무 분리</a></li>
	                                        <li><a href="#">2.2.3 보안 서약</a></li>
	                                        <li><a href="#">2.2.4 인식제고 및 교육훈련</a></li>
	                                        <li><a href="#">2.2.5 퇴직 및 직무변경 관리</a></li>
	                                        <li><a href="#">2.2.6 보안 위반 시 조치</a></li>
	                                    </ul>
	                                </li>
	                                <li><a href="#">2.3. 외부자 보안</a>
	                                    <ul class="trd_menu sub_menu">
	                                        <li><a href="#">2.3.1 외부자 현황 관리</a></li>
	                                        <li><a href="#">2.3.2 외부자 계약 시 보안</a></li>
	                                        <li><a href="#">2.3.3 외부자 보안 이행 관리</a></li>
	                                        <li><a href="#">2.3.4 외부자 계약 변경 및 만료 시 보안</a></li>
	                                    </ul>
	                                </li>
	                                <li><a href="#">2.4. 물리 보안</a>
	                                    <ul class="trd_menu sub_menu">
	                                        <li><a href="#">2.4.1 보호구역 지정</a></li>
	                                        <li><a href="#">2.4.2 출입통제</a></li>
	                                        <li><a href="#">2.4.3 정보시스템 보호</a></li>
	                                        <li><a href="#">2.4.4 보호설비 운영</a></li>
	                                        <li><a href="#">2.4.5 보호구역 내 작업</a></li>
	                                        <li><a href="#">2.4.6 반출입 기기 통제</a></li>
	                                        <li><a href="#">2.4.7 업무환경 보안</a></li>
	                                    </ul>
	                                </li>
	                                <li><a href="#">2.5. 인증 및 권한관리</a>
	                                    <ul class="trd_menu sub_menu">
	                                        <li><a href="#">2.5.1 사용자 계정 관리</a></li>
	                                        <li><a href="#">2.5.2 사용자 식별</a></li>
	                                        <li><a href="#">2.5.3 사용자 인증</a></li>
	                                        <li><a href="#">2.5.4 비밀번호 관리</a></li>
	                                        <li><a href="#">2.5.5 특수 계정 및 권한관리</a></li>
	                                        <li><a href="#">2.5.6 접근권한 검토</a></li>
	                                    </ul>
	                                </li>
	                                <li><a href="#">2.6. 접근통제</a>
	                                    <ul class="trd_menu sub_menu">
	                                        <li><a href="#">2.6.1 네트워크 접근</a></li>
	                                        <li><a href="#">2.6.2 정보시스템 접근</a></li>
	                                        <li><a href="#">2.6.3 응용프로그램 접근</a></li>
	                                        <li><a href="#">2.6.4 데이터베이스 접근</a></li>
	                                        <li><a href="#">2.6.5 무선 네트워크 접근</a></li>
	                                        <li><a href="#">2.6.6 원격접근 통제</a></li>
	                                        <li><a href="#">2.6.7 인터넷 접속 통제</a></li>
	                                    </ul>
	                                </li>
	                                <li><a href="#">2.7. 암호화 적용</a>
	                                    <ul class="trd_menu sub_menu">
	                                        <li><a href="#">2.7.1 암호정책 적용</a></li>
	                                        <li><a href="#">2.7.2 암호키 관리</a></li>
	                                    </ul>
	                                </li>
	                                <li><a href="#">2.8. 정보시스템 도입 및 개발 보안</a>
	                                    <ul class="trd_menu sub_menu">
	                                        <li><a href="#">2.8.1 보안 요구사항 정의</a></li>
	                                        <li><a href="#">2.8.2 보안 요구사항 검토 및 시험</a></li>
	                                        <li><a href="#">2.8.3 시험과 운영 환경 분리</a></li>
	                                        <li><a href="#">2.8.4 시험 데이터 보안</a></li>
	                                        <li><a href="#">2.8.5 소스 프로그램 관리</a></li>
	                                        <li><a href="#">2.8.6 운영환경 이관</a></li>
	                                    </ul>
	                                </li>
	                                <li><a href="#">2.9. 시스템 및 서비스 운영관리</a>
	                                    <ul class="trd_menu sub_menu">
	                                        <li><a href="#">2.9.1 변경관리</a></li>
	                                        <li><a href="#">2.9.2 성능 및 장애관리</a></li>
	                                        <li><a href="#">2.9.3 백업 및 복구관리</a></li>
	                                        <li><a href="#">2.9.4 로그 및 접속기록 관리</a></li>
	                                        <li><a href="#">2.9.5 로그 및 접속기록 점검</a></li>
	                                        <li><a href="#">2.9.6 시간 동기화</a></li>
	                                        <li><a href="#">2.9.7 정보자산의 재사용 및 폐기</a></li>
	                                    </ul>
	                                </li>
	                                <li><a href="#">2.10. 시스템 및 서비스 보안관리</a>
	                                    <ul class="trd_menu sub_menu">
	                                        <li><a href="#">2.10.1 보안시스템 운영</a></li>
	                                        <li><a href="#">2.10.2 클라우드 보안</a></li>
	                                        <li><a href="#">2.10.3 공개서버 보안</a></li>
	                                        <li><a href="#">2.10.4 전자거래 및 핀테크 보안</a></li>
	                                        <li><a href="#">2.10.5 정보전송 보안</a></li>
	                                        <li><a href="#">2.10.6 업무용 단말기기 보안</a></li>
	                                        <li><a href="#">2.10.7 보조저장매체 관리</a></li>
	                                        <li><a href="#">2.10.8 패치관리</a></li>
	                                        <li><a href="#">2.10.9 악성코드 통제</a></li>
	                                    </ul>
	                                </li>
	                                <li><a href="#">2.11. 사고 예방 및 대응</a>
	                                    <ul class="trd_menu sub_menu">
	                                        <li><a href="#">2.11.1 사고 예방 및 대응체계 구축</a></li>
	                                        <li><a href="#">2.11.2 취약점 점검 및 조치</a></li>
	                                        <li><a href="#">2.11.3 이상행위 분석 및 모니터링</a></li>
	                                        <li><a href="#">2.11.4 사고 대응 훈련 및 개선</a></li>
	                                        <li><a href="#">2.11.5 사고 대응 및 복구</a></li>
	                                    </ul>
	                                </li>
	                                <li><a href="#">2.12. 재해 복구</a>
	                                    <ul class="trd_menu sub_menu">
	                                        <li><a href="#">2.12.1 재해·재난 대비 안전조치</a></li>
	                                        <li><a href="#">2.12.2 재해 복구 시험 및 개선</a></li>
	                                    </ul>
	                                </li>
	                            </ul>
	                        </li>
	                        <li><a href="#">3. 개인정보 처리 단계별 요구사항</a>
	                            <ul class="snd_menu sub_menu">
	                                <li><a href="#">3.1. 개인정보 수집 시 보호조치</a>
	                                    <ul class="trd_menu sub_menu">
	                                        <li><a href="#">3.1.1 개인정보 수집·이용</a></li>
	                                        <li><a href="#">3.1.2 개인정보 수집 제한</a></li>
	                                        <li><a href="#">3.1.3 주민등록번호 처리 제한</a></li>
	                                        <li><a href="#">3.1.4 민감정보 및 고유식별정보의 처리 제한</a></li>
	                                        <li><a href="#">3.1.5 개인정보 간접수집</a></li>
	                                        <li><a href="#">3.1.6 영상정보처리기기 설치·운영</a></li>
	                                        <li><a href="#">3.1.7 마케팅 목적의 개인정보 수집·이용</a></li>
	                                    </ul>
	                                </li>
	                                <li><a href="#">3.2. 개인정보 보유 및 이용 시 보호조치</a>
	                                    <ul class="trd_menu sub_menu">
	                                        <li><a href="#">3.2.1 개인정보 현황관리</a></li>
	                                        <li><a href="#">3.2.2 개인정보 품질보장</a></li>
	                                        <li><a href="#">3.2.3 이용자 단말기 접근 보호</a></li>
	                                        <li><a href="#">3.2.4 개인정보 목적 외 이용 및 제공</a></li>
	                                        <li><a href="#">3.2.5 가명정보 처리</a></li>
	                                    </ul>
	                                </li>
	                                <li><a href="#">3.3. 개인정보 제공 시 보호조치</a>
	                                    <ul class="trd_menu sub_menu">
	                                        <li><a href="#">3.3.1 개인정보 제3자 제공</a></li>
	                                        <li><a href="#">3.3.2 개인정보 처리 업무 위탁</a></li>
	                                        <li><a href="#">3.3.3 영업의 양도 등에 따른 개인정보 이전</a></li>
	                                        <li><a href="#">3.3.4 개인정보 국외이전</a></li>
	                                    </ul>
	                                </li>
	                                <li><a href="#">3.4. 개인정보 파기 시 보호조치</a>
	                                    <ul class="trd_menu sub_menu">
	                                        <li><a href="#">3.4.1 개인정보 파기</a></li>
	                                        <li><a href="#">3.4.2 처리목적 달성 후 보유 시 조치</a></li>
	                                    </ul>
	                                </li>
	                                <li><a href="#">3.5. 정보주체 권리보호</a>
	                                    <ul class="trd_menu sub_menu">
	                                        <li><a href="#">3.5.1 개인정보 처리방침 공개</a></li>
	                                        <li><a href="#">3.5.2 정보주체 권리보장</a></li>
	                                        <li><a href="#">3.5.3 정보주체에 대한 통지</a></li>
	                                    </ul>
	                                </li>
	                            </ul>
	                        </li>
	                    </ul>
	                </nav>
	            </div>
	        </nav>
	
	        <!-- Main Content -->
	        <div class="main">
	            <div class="header">
	                <div class="user-info">
	                    <h2>ISMS-P 인증</h2>
	                    <p>2024, Jun, 03, Mon 11:30 AM</p>
	                </div>
	
	                <!--이전 페이지로 이동 (index.html)-->
	                <a href="./index.jsp">
	                    <div class="index-page">
	                        <i class="fa fa-arrow-circle-left" aria-hidden="true"></i>
	                    </div>
	                </a>
	            </div>
	
	            <div class="content">
	                <div class="left-panel">
	                    <div class="UPT">
	                        <div class="upt2">
	                            <div>
	                                1. 관리체계 수립 및 운영
	                            </div>
	                            <div>
	                            </div>
	                        </div>
	                        <div class="upt2">
	                            <div>
	                            </div>
	                            <div>
	                            </div>
	                        </div>
	                        <div class="upt2">
	                            <div>
	                            </div>
	                            <div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="right-panel">
	                    <div class="check-button">
	                        <button class="cb">Check</button>
	                    </div>
	                    <div class="live-upt2us">
	                        <table>
	                            <thead>
	                                <tr>
	                                    <th>No.</th>
	                                    <th>파일명</th>
	                                    <th>ISMS-P 준수 여부</th>
	                                    <th>위험도</th>
	                                    <th>으아아</th>
	                                    <th>상세내용 보기</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                                <tr>
	                                    <td>01</td>
	                                    <td>개인정보 처리방침</td>
	                                    <td>양호</td>
	                                    <td></td>
	                                    <td></td>
	                                    <td><button class="details">Details</button></td>
	                                </tr>
	                                <tr>
	                                    <td>02</td>
	                                    <td>파일</td>
	                                    <td>위반</td>
	                                    <td></td>
	                                    <td></td>
	                                    <td><button class="details">Details</button></td>
	                                </tr>
	                                <tr>
	                                    <td>03</td>
	                                    <td>파일</td>
	                                    <td>보완 필요</td>
	                                    <td></td>
	                                    <td></td>
	                                    <td><button class="details">Details</button></td>
	                                </tr>
	                            </tbody>
	                        </table>
	                    </div>
	                    <div class class="earnings-summary">
	                        <canvas id="earningsChart"></canvas>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	
	    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	    <script>
	        const ctx = document.getElementById('earningsChart').getContext('2d');
	        const earningsChart = new Chart(ctx, {
	            type: 'line',
	            data: {
	                labels: ['A', 'B', 'C', 'D', 'E', 'F'],
	                datasets: [{
	                    label: 'rate',
	                    data: [0, 20, 40, 60, 80, 100],
	                    borderColor: 'rgba(75, 192, 192, 1)',
	                    backgroundColor
	                        : 'rgba(75, 192, 192, 0.2)',
	                    fill: true
	                }]
	            },
	            options: {}
	        });
	    </script>
	    <script>
	        $(document).ready(function () {
	
	            $('#main_menu > li > a').click(function () {
	                $(this).next($('.snd_menu')).slideToggle('fast');
	            })
	            $('.snd_menu > li > a').click(function (e) {
	                e.stopPropagation();
	                $(this).next($('.trd_menu')).slideToggle('fast');
	            })
	
	            // 버튼 클릭 시 색 변경
	            $('li > a').focus(function () {
	                $(this).addClass('selec');
	            })
	            $("li > a").blur(function () {
	                $(this).removeClass('selec');
	            })
	
	        })
	    </script>
	</body>
</html>