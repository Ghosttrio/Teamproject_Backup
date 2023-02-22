<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"    
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>휴먼시네마 메인화면</title>
    <style>
        .header {
            width: 100%;
            display: flex;
            justify-content: space-around;
            height: 150px;
            border: 1px solid red;
        }
        .header > div {
            font-size: 20px;
            font-weight: 600;
            border:1px solid red;
            width: 150px;
            text-align: center;
            margin: auto;
        }
        .main {
            border:1px solid red;
            width: 100%;
            height: 750px;
        }
        
        
		/* 상단바 */
		li { 
			list-style: none; 
		}
		 
		a { 
			text-decoration: none; 
		}
		
		#wrap2 {
			width: 100%;
			margin-top: 80px;
		}
		 
		header {
			position: fixed;
			top: 0;
			width: 100%;
			height: 80px;
			z-index: 2000;
			background-color: #fff;
			box-shadow: 0 2px 2px rgba(0, 0, 0, 0.05), 0 1px 0 rgba(0, 0, 0, 0.05);
		}
		 
		.logo {
			display: inline-block;
			height: 5px;
			margin: 12px 0 12px 25px;
		}
		 
		.logo > img { 
			height: 50px; 
		}
		
		nav {
			display: flex;
			justify-content: space-around;
		}
		
		.nav-items {
			margin-right: 20px;
		}
		
		.nav-items > li {
			display: inline-block;
			margin-left: 40px;
			margin-right: 40px;
		}
		.nav-items > li > a {
			line-height: 80px;
			padding: 0 30px;
			color: rgba(0, 0, 0, 0.4);
		}
		.nav-items > li > a:hover {
			color: rgba(0, 0, 0, 0.8);
		}
			
		#detail{
			font-size : 20px;
		}
		.title_long{
			white-space: nowrap; 
			overflow: hidden;  
			text-overflow: ellipsis;
		}





    </style>


</head>
<body>
    <div id="wrap2">
				<header>
					<nav id="nav">
						<ul class="nav-items">
							<li><a href="#home">영화</a></li>
							<li><a href="#news">예매</a></li>
							<li><a href="#news">극장</a></li>
							<a class="logo" href="#home">로고</a>
							<li><a href="#contact">스토어</a></li>
							<li><a href="#about">고객센터</a></li>
							<li><a href="#about">로그인</a></li>
						</ul>
					</nav>
		        </header>
		   	</div>

    <div class="main">
        <div class="a1">
			<c:forEach var="movie" items="${movieList }" varStatus="status">
				<c:if test="${movie.opendate < 20230217 }">
					<div class="show1">
					    <div class="image">
					        <div class="explain">
					        	<form id="article_form" action="movieInfo.do" method="post">
						          	<input type="hidden" name="articleNO" value="${movie.articleNO }">
						       		<input id="detail" type="submit" value="상세보기">
					    		</form>
					     	</div>
					   	<img class="poster" src="${movie.poster_main }">
					 	</div>
					 	<div class="info">
						    <div class="title_long">${movie.title }</div>
							<div>${movie.age }</div>
						  	<div>
								<fmt:parseDate var="parsedDate" value="${movie.opendate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${parsedDate }" pattern="yyyy/MM/dd"/> 
						  	</div>
					 	</div>
						<div class="btn1">
						  <form id="like_form">
						  	<input id="like_num" type="hidden" name="like_num" value="${movie.like_num}">
						  	<input id="command" type="hidden" name="command" value="like_it">
						  	<input id="like_btn" name="like_num2" type="button" value="좋아요 ${movie.like_num }">
						  	<a href="changsoon/영화탭/예매탭.jsp"><input id="btn2"  type="button" value="예매"></a>
						  </form>
						     <!-- 예매버튼을 눌렀을때 각 영화의 값을 예매탭으로 전달해서 예매탭에서 getparameter할 수 있게만들기 -->
					    </div>
					</div>
				</c:if>
			</c:forEach>
		</div>	
    </div>
</body>
</html>