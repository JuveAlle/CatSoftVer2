<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>CatSoft</title>

    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

    <!-- Theme CSS -->
    <link href="${pageContext.request.contextPath}/css/agency.min.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js" integrity="sha384-0s5Pv64cNZJieYFkXYOTId2HMA2Lfb6q2nAcx2n0RTLUnCAoTTsS0nKEO27XyKcY" crossorigin="anonymous"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js" integrity="sha384-ZoaMbDF+4LeFxg6WdScQ9nnR1QC2MIRxA1O9KWEXQwns1G8UNyIEZIQidzb0T1fo" crossorigin="anonymous"></script>
    <![endif]-->
 <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
<%--  <script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/jquery.js"></script> --%>
<script>
// 	$(document).ready(function(){
// 		$("input[name='list']").each(function(index,element) {
// 			index+=1;
// 			$("#mdf"+index+"").click(modify);
// 		});
// 	});

// 	var modify = function(data) {
// 		console.log(data);
// // 		alert("수정되었습니다."+data);
// 	}
	var mdf = function(data){
		console.log(data);
		$.ajax({
			url:"/CatSoft/updateMember.do"
			,type:"get"
			,data : {
				"id" : $("#selectId"+data+"").val(),
				"password" :$("#mdfval"+data+"").val()
			}
			,success : update
			,error : errorcallback
		});
	};
	
	var del = function(data) {
		console.log(data);
		$.ajax({
			url:"/CatSoft/deleteMember.do"
			,type:"get"
			,data : {
				"id" : $("#selectId"+data+"").val()
			}
			,success : update
			,error : errorcallback
		})
	};
	
	var update = function(data) {
		if(data) {
			alert("수정완료");
			window.location.reload();
		} else {
			alert("오류");
		}
	}

	var errorcallback = function(data) {
		console.log("실패");
	}
</script>


</head>

<body id="page-top" class="index">

    <!-- Navigation -->
    <nav id="mainNav" class="navbar navbar-default navbar-custom navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">
                	<img alt="logo" style="width: 50px; height: 40px;" src="${pageContext.request.contextPath}/img/logo.png">
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#page-top">Home</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#services">Services</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#about">History</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#portfolio">Shop</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#team">Team</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#contact">Contact</a>
                    </li>
                    <li>
                    
                    <c:choose>
                    	<c:when test="${id eq null}">
	                        <a class="page-scroll" href="${pageContext.request.contextPath}/views/login.jsp">Login</a>
                    	</c:when>
                    	<c:otherwise>
							<a class="page-scroll" href="${pageContext.request.contextPath}/logout.do">Logout</a>
                    	</c:otherwise>
                    </c:choose>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <!-- Header -->
    <header>
        <div class="container">
            <div class="intro-text">
                <div class="intro-lead-in">CatSoft에 오신것을 환영합니다!</div>
                <c:choose>
                	<c:when test="${user.name eq 'admin' }">
		                <div class="intro-heading">회원관리</div>
                	</c:when>
                	<c:otherwise>
						<c:choose>
							<c:when test="${user eq null }">
				                <div class="intro-heading">반갑습니다.</div>
							</c:when>
							<c:otherwise>
				                <div class="intro-heading">${user.name}님 반가워요!</div>
							</c:otherwise>
						</c:choose>                	
                	</c:otherwise>
                </c:choose>
                <c:choose>
                	<c:when test="${id eq 'admin' }">
		                <a href="#portfolioModal4" class="page-scroll btn btn-xl" data-toggle="modal">회원관리</a>
                	</c:when>
                	<c:otherwise>
                			<a href="#services" class="page-scroll btn btn-xl">자세히</a>
                	</c:otherwise>
                </c:choose>
            </div>
        </div>
    </header>

    <!-- Services Section -->
    <section id="services">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Services</h2>
                    <h3 class="section-subheading text-muted" style="font-style: normal;">고양이소프트는 청소년 코딩교육의 <label style="color: red;">『출발점』</label>이 될 것 입니다.</h3>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa fa-shopping-cart fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="service-heading">IOT SW R&D</h4>
                    <p class="text-muted">-</p>
                </div>
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa fa-laptop fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="service-heading">교육용 키트의 개발</h4>
                    <p class="text-muted">.</p>
                </div>
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa fa-lock fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="service-heading">찾아가는 수업 오프라인 수업 진행</h4>
                    <p class="text-muted">.</p>
                </div>
            </div>
        </div>
    </section>

<!-- About Section -->
    <section id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">History</h2>
                    <h3 class="section-subheading text-muted">고양이 소프트는 2017년 이후 지속적인 발전과 활동으로 사회에 공헌할 것입니다.</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <ul class="timeline">
                        <li>
                            <div class="timeline-image">
                                <img class="img-circle img-responsive" src="${pageContext.request.contextPath}/img/about/1.jpg" alt="">
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4>2017</h4>
                                    <h4 class="subheading">화정 청소년 카페 톡톡톡</h4>
                                    <h4 class="subheading">아두이노 단기 교육</h4>
                                </div>
                                <div class="timeline-body">
<!--                                     <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p> -->
                                </div>
                            </div>
                        </li>
                        <li class="timeline-inverted">
                            <div class="timeline-image">
                                <img class="img-circle img-responsive" src="${pageContext.request.contextPath}/img/about/2.jpg" alt="">
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4>2017</h4>
                                    <h4 class="subheading">스마트 창작터 1차 선정</h4>
                                </div>
                                <div class="timeline-body">
<!--                                     <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p> -->
                                </div>
                            </div>
                        </li>
<!--                         <li> -->
<!--                             <div class="timeline-image"> -->
<!--                                 <img class="img-circle img-responsive" src="img/about/3.jpg" alt=""> -->
<!--                             </div> -->
<!--                             <div class="timeline-panel"> -->
<!--                                 <div class="timeline-heading"> -->
<!--                                     <h4>December 2012</h4> -->
<!--                                     <h4 class="subheading">Transition to Full Service</h4> -->
<!--                                 </div> -->
<!--                                 <div class="timeline-body"> -->
<!--                                     <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </li> -->
<!--                         <li class="timeline-inverted"> -->
<!--                             <div class="timeline-image"> -->
<!--                                 <img class="img-circle img-responsive" src="img/about/4.jpg" alt=""> -->
<!--                             </div> -->
<!--                             <div class="timeline-panel"> -->
<!--                                 <div class="timeline-heading"> -->
<!--                                     <h4>July 2014</h4> -->
<!--                                     <h4 class="subheading">Phase Two Expansion</h4> -->
<!--                                 </div> -->
<!--                                 <div class="timeline-body"> -->
<!--                                     <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </li> -->
<!--                         <li class="timeline-inverted"> -->
<!--                             <div class="timeline-image"> -->
<!--                                 <h4>Be Part -->
<!--                                     <br>Of Our -->
<!--                                     <br>Story!</h4> -->
<!--                             </div> -->
<!--                         </li> -->
                    </ul>
                </div>
            </div>
        </div>
    </section>



    <!-- Portfolio Grid Section -->
    <section id="portfolio" class="bg-light-gray">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Shop</h2>
                    <h3 class="section-subheading text-muted">제품 구입과 교육 신청을 받습니다.</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a href="#portfolioModal1" class="portfolio-link" data-toggle="modal">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="img/portfolio/roundicons.png" class="img-responsive" alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>제품 구입하기</h4>
<!--                         <p class="text-muted">제품 구입하러가기</p> -->
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a href="#portfolioModal2" class="portfolio-link" data-toggle="modal">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="img/portfolio/startup-framework.png" class="img-responsive" alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>교육신청하기</h4>
<!--                         <p class="text-muted">Website Design</p> -->
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a href="#portfolioModal3" class="portfolio-link" data-toggle="modal">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="img/portfolio/treehouse.png" class="img-responsive" alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>교육내용 미리보기</h4>
<!--                         <p class="text-muted">Website Design</p> -->
                    </div>
                </div>
            </div>
        </div>
    </section>

    

    <!-- Team Section -->
    <section id="team" class="bg-light-gray">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Cat Soft Team</h2>
                    <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <div class="team-member">
                        <img src="${pageContext.request.contextPath}/img/team/mj.png" class="img-responsive img-circle" alt="">
                        <h4>이민재</h4>
                        <p class="text-muted">CEO</p>
                        <ul class="list-inline social-buttons">
                            <li><a href="#"><i class="fa fa-twitter"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-facebook"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="team-member">
                        <img src="${pageContext.request.contextPath}/img/team/js.png" class="img-responsive img-circle" alt="">
                        <h4>양지선</h4>
                        <p class="text-muted">Designer</p>
                        <ul class="list-inline social-buttons">
                            <li><a href="#"><i class="fa fa-twitter"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-facebook"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="team-member">
                        <img src="${pageContext.request.contextPath}/img/team/sa.png" class="img-responsive img-circle" alt="">
                        <h4>김성아</h4>
                        <p class="text-muted">Developer</p>
                        <ul class="list-inline social-buttons">
                            <li><a href="#"><i class="fa fa-twitter"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-facebook"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="team-member">
                        <img src="${pageContext.request.contextPath}/img/team/he.png" class="img-responsive img-circle" alt="">
                        <h4>이현의</h4>
                        <p class="text-muted">Developer</p>
                        <ul class="list-inline social-buttons">
                            <li><a href="#"><i class="fa fa-twitter"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-facebook"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="team-member">
                        <img src="${pageContext.request.contextPath}/img/team/ms.png" class="img-responsive img-circle" alt="">
                        <h4>신민식</h4>
                        <p class="text-muted">Web Developer</p>
                        <ul class="list-inline social-buttons">
                            <li><a href="#"><i class="fa fa-twitter"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-facebook"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="team-member">
                        <img src="${pageContext.request.contextPath}/img/team/sh.png" class="img-responsive img-circle" alt="">
                        <h4>강수훈</h4>
                        <p class="text-muted">Developer</p>
                        <ul class="list-inline social-buttons">
                            <li><a href="#"><i class="fa fa-twitter"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-facebook"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
<!--                     <p class="large text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut eaque, laboriosam veritatis, quos non quis ad perspiciatis, totam corporis ea, alias ut unde.</p> -->
                </div>
            </div>
        </div>
    </section>

    <!-- Clients Aside -->
    <aside class="clients">
        <div class="container">
<!--             <div class="row"> -->
<!--                 <div class="col-md-3 col-sm-6"> -->
<!--                     <a href="#"> -->
<!--                         <img src="img/logos/envato.jpg" class="img-responsive img-centered" alt=""> -->
<!--                     </a> -->
<!--                 </div> -->
<!--                 <div class="col-md-3 col-sm-6"> -->
<!--                     <a href="#"> -->
<!--                         <img src="img/logos/designmodo.jpg" class="img-responsive img-centered" alt=""> -->
<!--                     </a> -->
<!--                 </div> -->
<!--                 <div class="col-md-3 col-sm-6"> -->
<!--                     <a href="#"> -->
<!--                         <img src="img/logos/themeforest.jpg" class="img-responsive img-centered" alt=""> -->
<!--                     </a> -->
<!--                 </div> -->
<!--                 <div class="col-md-3 col-sm-6"> -->
<!--                     <a href="#"> -->
<!--                         <img src="img/logos/creative-market.jpg" class="img-responsive img-centered" alt=""> -->
<!--                     </a> -->
<!--                 </div> -->
<!--             </div> -->
        </div>
    </aside>

    <!-- Contact Section -->
    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Contact Us</h2>
                    <h3 class="section-subheading text-muted">Hp. 010-9706-5001</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
<!--                     <form name="sentMessage" id="contactForm" novalidate> -->
<!--                         <div class="row"> -->
<!--                             <div class="col-md-6"> -->
<!--                                 <div class="form-group"> -->
<!--                                     <input type="text" class="form-control" placeholder="Your Name *" id="name" required data-validation-required-message="Please enter your name."> -->
<!--                                     <p class="help-block text-danger"></p> -->
<!--                                 </div> -->
<!--                                 <div class="form-group"> -->
<!--                                     <input type="email" class="form-control" placeholder="Your Email *" id="email" required data-validation-required-message="Please enter your email address."> -->
<!--                                     <p class="help-block text-danger"></p> -->
<!--                                 </div> -->
<!--                                 <div class="form-group"> -->
<!--                                     <input type="tel" class="form-control" placeholder="Your Phone *" id="phone" required data-validation-required-message="Please enter your phone number."> -->
<!--                                     <p class="help-block text-danger"></p> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="col-md-6"> -->
<!--                                 <div class="form-group"> -->
<!--                                     <textarea class="form-control" placeholder="Your Message *" id="message" required data-validation-required-message="Please enter a message."></textarea> -->
<!--                                     <p class="help-block text-danger"></p> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="clearfix"></div> -->
<!--                             <div class="col-lg-12 text-center"> -->
<!--                                 <div id="success"></div> -->
<!--                                 <button type="submit" class="btn btn-xl">Send Message</button> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </form> -->
                </div>
            </div>
        </div>
    </section>

    <footer>
<!--         <div class="container"> -->
<!--             <div class="row"> -->
<!--                 <div class="col-md-4"> -->
<!-- <!--                     <span class="copyright">Copyright &copy; Your Website 2016</span> -->
<!--                 </div> -->
<!--                 <div class="col-md-4"> -->
<!--                     <ul class="list-inline social-buttons"> -->
<!--                         <li><a href="#"><i class="fa fa-twitter"></i></a> -->
<!--                         </li> -->
<!--                         <li><a href="#"><i class="fa fa-facebook"></i></a> -->
<!--                         </li> -->
<!--                         <li><a href="#"><i class="fa fa-linkedin"></i></a> -->
<!--                         </li> -->
<!--                     </ul> -->
<!--                 </div> -->
<!--                 <div class="col-md-4"> -->
<!--                     <ul class="list-inline quicklinks"> -->
<!--                         <li><a href="#">Privacy Policy</a> -->
<!--                         </li> -->
<!--                         <li><a href="#">Terms of Use</a> -->
<!--                         </li> -->
<!--                     </ul> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
    </footer>

    <!-- Portfolio Modals -->
    <!-- Use the modals below to showcase details about your portfolio projects! -->

    <!-- Portfolio Modal 1 -->
    <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="close-modal" data-dismiss="modal">
                    <div class="lr">
                        <div class="rl">
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-lg-offset-2">
                            <div class="modal-body">
                                <!-- Project Details Go Here -->
                                <h2>아직 준비중 입니다.........</h2>
<!--                                 <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p> -->
<!--                                 <img class="img-responsive img-centered" src="img/portfolio/roundicons-free.png" alt=""> -->
<!--                                 <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p> -->
<!--                                 <p> -->
<!--                                     <strong>Want these icons in this portfolio item sample?</strong>You can download 60 of them for free, courtesy of <a href="https://getdpd.com/cart/hoplink/18076?referrer=bvbo4kax5k8ogc">RoundIcons.com</a>, or you can purchase the 1500 icon set <a href="https://getdpd.com/cart/hoplink/18076?referrer=bvbo4kax5k8ogc">here</a>.</p> -->
<!--                                 <ul class="list-inline"> -->
<!--                                     <li>Date: July 2014</li> -->
<!--                                     <li>Client: Round Icons</li> -->
<!--                                     <li>Category: Graphic Design</li> -->
<!--                                 </ul> -->
                                <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i>창 닫기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Portfolio Modal 2 -->
    <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="close-modal" data-dismiss="modal">
                    <div class="lr">
                        <div class="rl">
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-lg-offset-2">
                            <div class="modal-body">
                                <h2></h2>
                                <h2>아직 준비중 입니다.........</h2>
<!--                                 <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p> -->
<!--                                 <img class="img-responsive img-centered" src="img/portfolio/roundicons-free.png" alt=""> -->
<!--                                 <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p> -->
<!--                                 <p> -->
<!--                                     <strong>Want these icons in this portfolio item sample?</strong>You can download 60 of them for free, courtesy of <a href="https://getdpd.com/cart/hoplink/18076?referrer=bvbo4kax5k8ogc">RoundIcons.com</a>, or you can purchase the 1500 icon set <a href="https://getdpd.com/cart/hoplink/18076?referrer=bvbo4kax5k8ogc">here</a>.</p> -->
<!--                                 <ul class="list-inline"> -->
<!--                                     <li>Date: July 2014</li> -->
<!--                                     <li>Client: Round Icons</li> -->
<!--                                     <li>Category: Graphic Design</li> -->
<!--                                 </ul> -->
                                <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i>닫기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Portfolio Modal 3 -->
    <div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="close-modal" data-dismiss="modal">
                    <div class="lr">
                        <div class="rl">
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-lg-offset-2">
                            <div class="modal-body">
                                <!-- Project Details Go Here -->
                                <h2>아직 준비중 입니다.........</h2>
<!--                                 <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p> -->
<!--                                 <img class="img-responsive img-centered" src="img/portfolio/roundicons-free.png" alt=""> -->
<!--                                 <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p> -->
<!--                                 <p> -->
<!--                                     <strong>Want these icons in this portfolio item sample?</strong>You can download 60 of them for free, courtesy of <a href="https://getdpd.com/cart/hoplink/18076?referrer=bvbo4kax5k8ogc">RoundIcons.com</a>, or you can purchase the 1500 icon set <a href="https://getdpd.com/cart/hoplink/18076?referrer=bvbo4kax5k8ogc">here</a>.</p> -->
<!--                                 <ul class="list-inline"> -->
<!--                                     <li>Date: July 2014</li> -->
<!--                                     <li>Client: Round Icons</li> -->
<!--                                     <li>Category: Graphic Design</li> -->
<!--                                 </ul> -->
                                <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i>닫기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Portfolio Modal 4 -->
    <div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="close-modal" data-dismiss="modal">
                    <div class="lr">
                        <div class="rl">
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-lg-offset-2">
                            <div class="modal-body">
                                <!-- Project Details Go Here -->
                                <h2>회원 목록</h2>
									<table style="border: 1px solid black; width: 800px;">
									<thead style="border: 1px solid black;">
										<tr>
											<td>번호</td>
											<td>아이디</td>
											<td>이름</td>
											<td>비밀번호</td>
											<td>변경비밀번호</td>
											<td>	수정</td>
											<td>삭제</td>
										</tr>
										</thead>
										<tbody>
										<c:choose>
											<c:when test="${memberList.size()==0 }">
												<tr>
													<td colspan="6">
														회원이 없습니다.
													</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach var="memberList" items="${memberList }" varStatus="sts">
													<tr>
														<td>${sts.count }</td>
														<td>${memberList.id }</td>
														<td>${memberList.name }</td>
														<td>${memberList.password }</td>
														<td>
															<input type="text" id="mdfval${sts.count }" style="width: 60px;">
														</td>
														<td>
															<input type="button" id="mdf${sts.count }" onclick="mdf(${sts.count})" name="list" value="수정하기">
<%-- 															<a href="${pageContext.request.contextPath}/updateMember.do?id=${memberList.id}">수정하기</a> --%>
														</td>
														<td>
															<input type="button" id="del${sts.count }" onclick="del(${sts.count})" value="삭제하기">
															<input type="hidden" id="selectId${sts.count }" value="${memberList.id }">
<%-- 															<a href="${pageContext.request.contextPath}/deleteMember.do?id=${memberList.id}">삭제</a> --%>
														</td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
										</tbody>
									</table>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Portfolio Modal 5 -->
    <div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="close-modal" data-dismiss="modal">
                    <div class="lr">
                        <div class="rl">
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-lg-offset-2">
                            <div class="modal-body">
                                <!-- Project Details Go Here -->
                                <h2>Project Name</h2>
                                <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
                                <img class="img-responsive img-centered" src="img/portfolio/escape-preview.png" alt="">
                                <p>Escape is a free PSD web template built by <a href="https://www.behance.net/MathavanJaya">Mathavan Jaya</a>. Escape is a one page web template that was designed with agencies in mind. This template is ideal for those looking for a simple one page solution to describe your business and offer your services.</p>
                                <p>You can download the PSD template in this portfolio sample item at <a href="http://freebiesxpress.com/gallery/escape-one-page-psd-web-template/">FreebiesXpress.com</a>.</p>
                                <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close Project</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Portfolio Modal 6 -->
    <div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-2" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="close-modal" data-dismiss="modal">
                    <div class="lr">
                        <div class="rl">
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-lg-offset-2">
                            <div class="modal-body">
                                <!-- Project Details Go Here -->
                                <h2>Project Name</h2>
                                <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
                                <img class="img-responsive img-centered" src="img/portfolio/dreams-preview.png" alt="">
                                <p>Dreams is a free PSD web template built by <a href="https://www.behance.net/MathavanJaya">Mathavan Jaya</a>. Dreams is a modern one page web template designed for almost any purpose. It’s a beautiful template that’s designed with the Bootstrap framework in mind.</p>
                                <p>You can download the PSD template in this portfolio sample item at <a href="http://freebiesxpress.com/gallery/dreams-free-one-page-web-template/">FreebiesXpress.com</a>.</p>
                                <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close Project</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js" integrity="sha384-mE6eXfrb8jxl0rzJDBRanYqgBxtJ6Unn4/1F7q4xRRyIw7Vdg9jP4ycT7x1iVsgb" crossorigin="anonymous"></script>

    <!-- Contact Form JavaScript -->
    <script src="${pageContext.request.contextPath}/js/jqBootstrapValidation.js"></script>
    <script src="${pageContext.request.contextPath}/js/contact_me.js"></script>

    <!-- Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/js/agency.min.js"></script>

</body>

</html>
