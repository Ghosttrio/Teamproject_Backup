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


    </style>


</head>
<body>
    <div class="header">
        <div>영화</div>
        <div>예매</div>
        <div>극장</div>
        <div><img src="../image/logo.png" width="150" height="110"></div>
        <div>스토어</div>
        <div>고객센터</div>
        <div>로그인</div>
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