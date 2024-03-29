<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
	<head>
	    
	    <!-- jQuery -->
		<script type="text/javascript" src="resources/js/jquery/jquery-1.9.0.min.js"></script>
		<meta charset="utf-8" />
		<base href="/ExamOnLine/">
		<style type="text/css">
			#bk-exam-control{
				 
    position: fixed;
    left: 20px;
    top: 150px;
    width: 250px;

			}
		</style>
		<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame
		Remove this if you use the .htaccess -->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8"><meta http-equiv="X-UA-Compatible" 
		   content="IE=edge,chrome=1">
		<title>兄弟连java在线考试系统</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<link rel="shortcut icon" href="resources/images/favicon.ico" />
		<link href="resources/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
		<link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="resources/css/exam.css" rel="stylesheet" type="text/css">
		<link href="resources/css/style.css" rel="stylesheet">
		
		<!--  赋值 考试用时 -->
		
	</head>
	<body>
		<header>
			<div class="container">
				<div class="row">
					<div class="col-xs-5">
						<div class="logo">
							<h1><a href="#"><img alt="" src="resources/images/logo.png"></a></h1>
						</div>
					</div>
					<div class="col-xs-7" id="login-info">
					 
							<div id="login-info-user">
								
								<a href="usercenter.html" id="system-info-account" target="_blank">张三</a>
								<span>|</span>
								<a href="login.html"><i class="fa fa-sign-out"></i> 退出</a>
							</div>
						 
				</div>
				</div>
			</div>
		</header>
		<!-- Navigation bar starts -->

		<div class="navbar bs-docs-nav" role="banner">
			<div class="container">
				<nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
					<ul class="nav navbar-nav">
						<li>
							<a href="home.html"><i class="fa fa-home"></i>主页</a>
						</li>
						<li class="active">
							<a href="start-exam.html"><i class="fa fa-edit"></i>试题练习</a>
						</li>
						<li>
							<a href="usercenter.html"><i class="fa fa-dashboard"></i>会员中心</a>
						</li>
						<li>
							<a href="setting.html"><i class="fa fa-cogs"></i>个人设置</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>

		<!-- Navigation bar ends -->

		<div class="content" style="margin-bottom: 100px;">

			<div class="container">
				<div class="row">
					<div class="col-xs-3" style="position:relative;padding-right: 0px;padding-bottom:15px;">
						<div class="def-bk" id="bk-exam-control">

							<div class="def-bk-content" id="exam-control">

								<div id="question-time" class="question-time-normal">
									<div style="height:140px;text-align: center;">
										<i id="time-icon" class="fa fa-clock-o"> </i>
									</div>

									<span style="margin-right:10px;color: #B8B8B8;" >已用时</span>
									<span id="exam-clock">&nbsp;</span>
									<span id="exam-timestamp" style="display:none;">${duration }</span>
									<div id="answer-save-info"></div>

								</div>
								<div id="question-submit">
									<button class="btn-success btn" style="width:100%;" onclick="submitExam()">
										我要交卷
									</button>
								</div>
								<div id="exam-info" style="display:none;">
									<span id="answer-hashcode"></span>
								</div>
							</div>

						</div>

					</div>
					<div class="col-xs-9" style="padding-right: 0px;">
						<div class="def-bk" id="bk-exampaper">

							<div class="expand-bk-content" id="bk-conent-exampaper">
								<div id="exampaper-header">
									<div id="exampaper-title">
										<i class="fa fa-send"></i>
										<span id="exampaper-title-name"> 模拟试卷 </span>
										<span style="display:none;" id="exampaper-id">1</span>
									</div>
									<div id="exampaper-desc-container">
										<div id="exampaper-desc" class="exampaper-filter">
											<ul id="ex-body" >
										<!--  暂时把客观题 和 主观题 分开   以后可以更详细-->
										<!--  选择题   -->
										<c:forEach  items="${paper.questions}"  var="question" 
					>
											<c:if test="${question.question_type_id==1}">
												<li class="${question.question_type_id }">
												     <div> ${question.description }</div>
												     <ul  style="list-style:none">
												         <c:forEach  items = "${question.questionOptions}"  var="option_item">
												         <li><input  type="radio" name="${question.id}" id="${question.id}" 
												           value="${option_item.option_name}">${option_item.option_name}.${option_item.option_content}</li>
												         </c:forEach>
												     </ul>
												</li>
											</c:if>
										    <c:if test="${question.question_type_id==4}">
												<li class="${question.question_type_id }">
												     <div>${question.description }</div>
												     <textarea rows="5" cols="80" ></textarea>
												</li>
										    </c:if>
										</c:forEach>
									</ul>
									
										</div>
									</div>
									
								</div>
								<input type="hidden" id="hist-id" value="${examHistoryId }">
								<input type="hidden" id="paper-id" value="${examPaperId }">
								<input type="hidden" id="startTime" value="${startTime }">
								<ul id="exampaper-body">
									这是所有试题和选项区域
								</ul>    
								<div id="exampaper-footer">
									<div id="question-navi">
										<div id="question-navi-controller">
											<i class="fa fa-arrow-circle-down"></i>
											<span>答题卡</span>
										</div>
										<div id="question-navi-content">
										</div>
									</div>

								</div>
							</div>

						</div>
					</div>
				</div>
			</div>

		</div>

		<!-- Slider Ends -->

		<!-- Javascript files -->
		
		<!-- Bootstrap JS -->
		<script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="resources/js/all.js?v=0712"></script>
		<!--  <script type="text/javascript" src="resources/js/paper-examing.js"></script>
        -->
		

	</body>
</html>
