<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	 .top-div{
	width: 79%;
	height: 100px; 
	} 
	#Table{
	width:100%;
	border-collapse: collapse;
	}
	
	#filter{
	position: relative;
    bottom: 28px;
	}
	
	#Table td, #Table th{
	border: 1px solid lightgray;
		text-align: center;
		height: 33.1px;  
	}
	#Table th{
	background-color: #f7f7f7;
	color: #005B9E;
	}
	.searchCondition{
	margin-top: 32px;
	}
	.term{
	float:right;
	}
	#termId{
	margin-left: 10px;
	}
	#titlemsg{
		width: 220px;
		height: 36px;
	  margin-top: 17px;
	}
	#filterDiv{
	margin-top: -20px;
	}
	#searchBtn{
	color:white;
	background : #3498DB;
	border: 1px solid #3498DB;
	box-sizing: border-box;
	height: 25px;
	}
	#purSearch{
	border: 1px solid #919191;
	}
	#excel{
	background : white;
	color:gray;
	border: 1px solid gray;
	width: 68px;
	height: 25px;
	font-weight: bold;
	border-radius: 2px;
	}
	#print{
	color:white;
	background : #3498DB;
	border: 1px solid #3498DB;
	box-sizing: border-box;
	height: 25px;
	font-weight: bold;
	width: 60px;
	
	}
	.btns{
	margin-top: 5px;
	margin-left: 69.8%;
	}
	#purDivv{
	height: 403.7px;
	border: 1px solid lightgray;
	width: 1100px;
	margin-top: 2px;
	}
	#line{
		width: 120px;
		border-bottom: 1px solid black;
	}
	#pager_wrap {
width:1000px;
	padding: 60px 0;
	text-align: center;
}

#pager_wrap .pager_com {
	display: inline-block;
	width: 40px;
	margin: 0 2px;
	background-color: #f1f1f1;
}

#pager_wrap .pager_num.on {
	background-color: #171f57;
}

#pager_wrap .pager_com a {
	padding: 10px 0;
	text-align: center;
	color: #171f57;
	font-size:5px; 
	font-weight:none;
	
}

#pager_wrap .pager_num.on a {
	color: #fff;
}
</style>
</head>
<body>
	
<header>	
	<jsp:include page="../../common/menubar.jsp"/>
	<jsp:include page="../../common/productMenubar.jsp"/>
	 <jsp:include page="../modal/mAccountDetail.jsp"/> 
	 <jsp:include page="../modal/mAccountEnroll.jsp"/> 
</header>
	<section id="sbody">

		<div class="top-div">
		<div id="titlemsg"><h1>거래처관리</h1></div>
		<div id=line></div>
		<div id="searchZone" style="width: 1000px;"> 
		<div style="width: 1146px;">
			<select class="searchCondition"  id="purSearch" style="margin-left:70.2% ; height: 26px;">
				<option value="default" hidden="hidden">검색조건</option>
				<option value="acName">거래처명</option>
				<option value="acStock">거래항목</option>
			</select>
		<input type="text" name="serachCondition" class="searchCondition" style=";height: 20px;width: 150px; border: 1px solid gray">
		<button class="searchCondition" id="searchBtn" style="width: 56px;">검색</button>
		</div>
		
		</div>
		</div><!-- top div end -->
		
	<div id="purDivv">
	<table id="Table">
			<tr>
				<th>No</th>
				<th>거래처코드</th>
				<th>거래처명</th>
				<th>대표자명</th>
				<th>전화번호</th>
				<th>거래항목</th>
				<th style="width:40px;">사용구분</th>
				<th style="width:80px;">이체정보</th> 
				<th style="width:300px;">주소</th>
			</tr>
			<c:forEach var="i" items="${accountList}">
			<tr>
				<td><c:out value=""/></td>
				<td><c:out value="${i.cnCode }"/></td>
				<td><c:out value="${i.cnName }"/></td>
				<td><c:out value="${i.ownerName }"/></td>
				<td><c:out value="${i.cnPhone }" /></td>
				<td><c:out value="${i.cnItem }" /></td>
				<td><c:out value="${i.cnStatus }" /></td>
				<td><c:out value="확인"/></td>
				<td><c:out value="${i.cnAdd }" /></td>
			</tr>  
			</c:forEach>
		</table>

	</div><!-- purDivv end -->
	<div class="btns"><button id="excel" style="width: 125px;font-weight: bold;">사용중단/재사용</button>&nbsp;<button id="print">신규</button></div>

<!-- 페이저 시작 -->
			<!-- 페이징 영역 시작 -->
			<div id="pager_wrap" align="center">
				<ul class="pager_cnt clearfix add">
					<c:if test="${pi.currentPage <= 1 }">
						<li class="pager_com pager_arr prev on"><a
							href="javascirpt: void(0);">&#x003C;</a></li>
					</c:if>
					<c:if test="${pi.currentPage > 1 }">
						<c:url var="blistBack" value="selectStock.sto">
							<c:param name="currentPage" value="${pi.currentPage - 1 }" />
							<c:param name="scurrentPage" value=""/>
						</c:url>
						<li class="pager_com pager_arr prev "><a href="${blistBack }">&#x003C;</a></li>
					</c:if>

					<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
						<c:if test="${p eq pi.currentPage }">
							<li class="pager_com pager_num on"><a
								href="javascript: void(0);">${p }</a></li>
						</c:if>
						<c:if test="${p ne pi.currentPage }">

							<c:url var="blistCheck" value="selectStock.sto">
								<c:param name="currentPage" value="${p }" />
							</c:url>
							<li class="pager_com pager_num"><a href="${blistCheck }">${p }</a></li>
						</c:if>
					</c:forEach>


					<c:if test="${pi.currentPage >= pi.maxPage }">
						<li class="pager_com pager_arr next on"><a
							href="javascript: void(0);">&#x003E;</a></li>
					</c:if>
					<c:if test="${pi.currentPage < pi.maxPage }">
						<c:url var="blistEnd" value="selectStock.sto">
							<c:param name="currentPage" value="${pi.currentPage + 1 }" />
						</c:url>
						<li class="pager_com pager_arr next"><a href="${blistEnd }">&#x003E;</a></li>
					</c:if>
				</ul>
			</div>

			<!-- 페이징 영역 종료 -->
	</section>
	
	
	<script>
	//테이블
	$(function(){
		$("#Table").find("td").mouseenter(function(){
			$(this).parent("tr").css({"background":"lightgray","cursor":"pointer"});
		}).mouseout(function(){
			$(this).parent("tr").css({"background":"white"});
		}).click(function(){
			var bid = $(this).parent().children("td").eq(1).text();
			$(".modal").fadeIn();
			console.log(bid);
		});
	});
	
	$("#mState").click(function(){
		$(".modalState").fadeIn();
	});
	
	$("#print").click(function(){
		$(".modalEnroll").fadeIn();
	});
	</script>
</body>
</html>