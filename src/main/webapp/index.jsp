<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="shortcut icon" href="icon/fa2.ico" type="image/x-icon"> <!--아이콘 마음에 안 들면 연두색 방패 만들어놨으니까 그걸로 수정 가능해요-->
	    <link rel="stylesheet" href="css/style.css" /> <!--소중한 css 파일ㅎㅎ-->
	    <link rel="stylesheet" href="css/animation.css" /> <!--수정 예정, 아마 시간 부족하면 안 할듯... 그러면 그때는 이건 삭제해도 돼요.-->
	    <title>YIGA</title> <!--이름 바꿉시당-->
	</head>
	<body>
	    <video autoplay muted loop id="bgVideo"> <!-- 다른 거 하려다가 시간 부족으로 배경에 영상 넣었음. -->
	        <source src="video/b.mp4" type="video/mp4">
	    </video>
	    <nav>
	        <div class="menu_button">
	            <div class="line line--1"></div>
	            <div class="line line--2"></div>
	            <div class="line line--3"></div>
	        </div>
	        <div class="nav-links"> <!-- 카테고리 -->
	            <a href="./Home.html" class="link">HOME</a>
	            <a href="./ISMS-P.html" class="link">ISMS-P 인증 제도</a>
	            <a href="./About.html" class="link">About</a>
	        </div>
	    </nav>
	    <!--우리 메인페이지!!! 버튼 누르면 솔루션 페이지로 이동~~-->
	    <div class="YIGA">
	        Your ISMS-P Guide Assistant <br>
	        <div class="YIGA_2">YIGA</div>
	        <button class="center-button" onclick="location.href='YIGA.jsp'"><span> RUN </span></button>
	    </div>
	    <script>
	        // 전체 메뉴 아이콘 클릭하면 메뉴 나옴
	        var menubutton = document.querySelector('.menu_button');
	        var nav = document.querySelector('nav');
	        var lineOne = document.querySelector('nav .menu_button .line--1');
	        var lineTwo = document.querySelector('nav .menu_button .line--2');
	        var lineThree = document.querySelector('nav .menu_button .line--3');
	        var link = document.querySelector('nav .nav-links');
	
	        menubutton.addEventListener('click', () => {
	            nav.classList.toggle('nav-open');
	            lineOne.classList.toggle('line-cross');
	            lineTwo.classList.toggle('line-fade-out');
	            lineThree.classList.toggle('line-cross');
	            link.classList.toggle('fade-in');
	        });
	    </script>
	</body>
</html>