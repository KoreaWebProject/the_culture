<%--
  Created by IntelliJ IDEA.
  User: gion6
  Date: 2023-04-23
  Time: PM 7:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String root = request.getContextPath();
System.out.println(root);
%>
<html>
<head>
<title>공연에대한 상세 정보</title>
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="/culture/resources/assets/vendor/aos/aos.css"
	rel="stylesheet">
<link
	href="/culture/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="/culture/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="/culture/resources/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="/culture/resources/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link
	href="/culture/resources/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="/culture/resources/assets/css/style.css?ver=1"
	rel="stylesheet">
</head>
<body>
<body>

	<!-- ======= Top Bar ======= -->
	<section id="topbar" class="d-flex align-items-center">
		<div class="container d-flex justify-content-end">
			<div class="social-links d-none d-md-flex align-items-end">
				<c:if test="${empty login.user_id}">
					<a href="#" onclick="location.href='login_form.do'">로그인</a>
					<a href="#">회원가입</a>
					<a href="#">고객센터</a>
					<a href="#">마이페이지</a>
				</c:if>

				<c:if test="${not empty login.user_id}">
					<span>${login.user_name}님<span> <a href="#"
							onclick="location.href='logout.do'">로그아웃</a> <a href="#">고객센터</a>
							<a href="#">마이페이지</a>
				</c:if>

			</div>
		</div>
	</section>

	<!-- ======= Header ======= -->
	<header id="header" class="d-flex align-items-center">
		<div
			class="container d-flex align-items-center justify-content-between">
			<a href="#" onclick="location.href='culture.do'" class="logo"><img
				src="/culture/resources/assets/img/logo.png" alt="" width="130px"></a>
			<nav id="navbar" class="navbar">
				<form class="d-flex">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-primary" type="submit">Search</button>
				</form>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
		</div>
	</header>
	<!-- End Header -->


	<div id="menubar" class="navbar container justify-content-left">
		<nav id="navbar" class="navbar">
			<ul>
				<li><a class="nav-link scrollto" href="#"
					onclick="location.href='info.do?genrenm=연극'">연극</a></li>
				<li><a class="nav-link scrollto" href="#"
					onclick="location.href='info.do?genrenm=뮤지컬'">뮤지컬</a></li>
				<li class="dropdown"><a href="#"
					onclick="location.href='info.do?genrenm=음악'"><span>음악</span> <i
						class="bi bi-chevron-down"></i></a>
					<ul>
						<li><a href="#"
							onclick="location.href='info.do?genrenm=서양음악(클래식)'">서양음악(클래식)</a></li>
						<li><a href="#"
							onclick="location.href='info.do?genrenm=한국음악(국악)'">한국음악(국악)</a></li>
						<li><a href="#"
							onclick="location.href='info.do?genrenm=대중음악'">대중음악</a></li>
					</ul></li>
				<li><a class="nav-link scrollto" href="#"
					onclick="location.href='info.do?genrenm=무용'">무용</a></li>
				<li><a class="nav-link scrollto" href="#services"
					onclick="location.href='info.do?genrenm=서커스/마술'">서커스/마술</a></li>
				<li><a class="nav-link scrollto" href="#services"
					onclick="location.href='info.do?genrenm=복합'">복합</a></li>

			</ul>

		</nav>

	</div>




	<main class=" container ">

		<h2>뽀로로</h2>
		<div>연극</div>
		<hr  style="margin-bottom: 50px;">
		<div class=" container row d-flex justify-content-evenly " style="margin-bottom: 50px;">
			<img class="col-3  img-thumbnail rounded float-start"
				src="${info.playPoster}">
			<table class="col-6" border="1">
				<tr>
					<th style="width: 100px;">공연기간</th>
					<td style="width: 500px;"></td>
				</tr>
				<tr>
					<th>공연장소</th>
					<td></td>
				</tr>
				<tr>
					<th>공연시간</th>
					<td>${info.playDtguidance}</td>
				</tr>
				<tr>
					<th>관람연령</th>
					<td>${info.playPrfage}</td>
				</tr>
				<tr>
					<th>티켓가격</th>
					<td>${info.playTicketprice}</td>
				</tr>
				<tr>
					<th>출연진</th>
					<td>${info.playPrfcast}</td>
				</tr>
				<tr>
					<th>제작진</th>
					<c:if test="${fn:trim(info.playPrfcrew) eq ''}">
						<td>해당사항없음</td>
					</c:if>
					<c:if test="${fn:trim(info.playPrfcrew) ne ''}">
						<td>${info.playPrfcrew}</td>
					</c:if>

				</tr>
				<tr>
					<th>주최-주관</th>
					<td></td>
				</tr>
				<tr>
					<th>기획-제작</th>
					<td></td>
				</tr>
			</table>

		</div>
		
		<div>
		<button type="button" class="btn btn-dark">목록보기</button>
		</div>
		

		<div class="btn-group container" role="group"
			aria-label="Basic radio toggle button group" style="margin-bottom: 30px;">
			<input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked > 
			<label class="btn  btn-outline-danger" for="btnradio1">소개</label> 
			<input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off"> 
			<label class="btn  btn-outline-danger" for="btnradio2">공연장</label>
		</div>

		<div class="container d-flex justify-content-center" style="margin-bottom: 30px;">
			<div>
				<img src="http://www.kopis.or.kr/upload/pfmIntroImage/PF_PF217150_230420_1221160.jpg">
			
			</div>
		
		</div>

	</main>






	<!-- ======= Footer ======= -->
	<footer id="footer">

		<!--     <div class="footer-newsletter">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-6">
            <h4>Join Our Newsletter</h4>
            <p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna</p>
            <form action="" method="post">
              <input type="email" name="email"><input type="submit" value="Subscribe">
            </form>
          </div>
        </div>
      </div>
    </div> -->

		<div class="footer-top">
			<div class="container">
				<div class="row">

					<div class="col-lg-3 col-md-6 footer-contact">
						<h3>
							THE CULTURE<span>.</span>
						</h3>


						<div class="container py-4">
							<div class="copyright">
								&copy; Copyright <strong><span>THE CULTURE</span></strong>. All
								Rights Reserved
							</div>
							<div class="credits">
								<!-- All the links in the footer should remain intact. -->
								<!-- You can delete the links only if you purchased the pro version. -->
								<!-- Licensing information: https://bootstrapmade.com/license/ -->
								<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/bizland-bootstrap-business-template/ -->
								Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
							</div>
						</div>
	</footer>
	<!-- End Footer -->




	<div id="preloader"></div>
	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script
		src="/culture/resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="/culture/resources/assets/vendor/aos/aos.js"></script>

	<script
		src="/culture/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script
		src="/culture/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script
		src="/culture/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script
		src="/culture/resources/assets/vendor/waypoints/noframework.waypoints.js"></script>
	<script
		src="/culture/resources/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="/culture/resources/assets/js/main.js"></script>

	<div>
		<ul>

			<li>공연 시설ID:${info.locId}</li>
			<li>공연ID:${info.playId}</li>
			<li>출연진 정보:${info.playPrfcast}</li>
			<li>제작진 정보:${info.playPrfcrew}</li>
			<li>공연런타임:${info.playPrfruntime}</li>
			<li>관람연령:${info.playPrfage}</li>
			<li>제작사였구나:${info.playEntrpsnm}</li>
			<li>티켓가격${info.playTicketprice}</li>
			<li>포스터 이미지 ${info.playPoster}</li>
			<li>상세정보 이미지${info.playStyurls}</li>
			<li>공연시작 일시${info.playDtguidance}</li>

		</ul>
	</div>

</body>
<script>
	
</script>
</html>
