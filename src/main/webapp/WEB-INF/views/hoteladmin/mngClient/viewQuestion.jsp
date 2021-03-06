<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelsCompile</title>
<style>
.topSec {
	display: inline-flex;
	width:1200px;
}

.topSec select {
	height: 25px;
	width: 100px;
	margin-top: 25px;
	margin-left: 20px;
	border: 1px solid lightgrey;
}

.searchSec {
	margin-top: 10px;
	float: right;
	display: inline;
	margin-left:10px;
}

.searchSec select {
	height: 25px;
	width: 80px;
	border: 1px solid lightgrey;
}

.searchContent {
	height: 19px;
	width: 200px;
	border: 1px solid lightgrey;
}

#searchBtn {
	height: 25px;
	width: 60px;
	border: 1px solid #3498DB;
}

#openNewMD {
	margin-top: 10px;
	width: 100px;
	margin-left: 790px;
	border: 1px solid #3498DB;
	border-radius: 5px;
	background-color: #3498DB;
	color: white;
	font-weight: bold;
} 

.qList {
	margin-left: 10px;
	margin-top: 10px;
	width: 1250px;
	height: 392px;
	max-height: 520px;
	overflow-y: auto;
}

.qList th, .qList td {
	border: 1px solid darkgray;
	text-align: center;
	padding: 5px;
}

.qList th {
	background-color: #f7f7f7;
	color: #005B9E;
	border: 1px solid lightgray;
	height:30px;
}
section{
	width:1250px;
}
a{
	color:black;
	text-decoration:none;
}
.pagingArea{
	text-align:center;
	margin-left:300px;
}
#pager_wrap {
	padding: 60px 0;
	text-align: center;
	margin-top: -45px;
}

#pager_wrap .pager_com {
	display: inline-block;
	width: 35px;
	margin: 0 2px;
	background-color: #f7f7f7;
	height:35px;
	padding:auto;
	border:1px solid lightgray;
	border-radius:2px;
}

#pager_wrap .pager_num.on {
	background-color: #171f57;
	border:1px solid white;
	color:black;
	
}

#pager_wrap .pager_com .pager_num a {
	padding:auto;
	text-align: center;
	
}

#pager_wrap .pager_num.pager_num.on a {
	color: white;
}
#pager_wrap .pager_com.pager_num a{
	color:black;
}
#pager_wrap .pager_com.pager_arr.prev.on a{
	color:black;
}
#pager_wrap .pager_com.pager_arr.next on a {
	color:black;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="viewQuestionNewModal.jsp"></jsp:include>
		<jsp:include page="viewQuestionNewModal2.jsp"></jsp:include>
		<jsp:include page="../common/cmsMenubar.jsp"></jsp:include>
		<jsp:include page="../common/menubar.jsp"></jsp:include>
	</header>
	<section>
		<div class="topSec">
			<h1 style="margin-left: 10px; margin-bottom:0px;">????????????</h1>
			<c:if test="${ empty filterType }">
				<select name="filterOption" style="width:140px;" id="quefilter">
					<option value="" selected="selected">????????????</option>
					<option value="all">?????? ??????</option>
					<option value="online">????????? ??????</option>
					<option value="offline">???????????? ??????</option>
					<option value="unQue">????????? ??????</option>
				</select>
			</c:if>
			<c:if test="${ !empty filterType }">
				<select name="filterOption" style="width:140px;" id="quefilter">
					<option value="${ filterType }" selected="selected">
						<c:if test="${ filterType.equals('on') }">
						????????? ??????
						</c:if>
						<c:if test="${ filterType.equals('off') }">
						???????????? ??????
						</c:if>
						<c:if test="${ filterType.equals('unQue') }">
						????????? ??????
						</c:if>
						<c:if test="${ filterType.equals('all') }">
						?????? ??????
						</c:if>
					</option>
					<option value="all">?????? ??????</option>
					<option value="online">????????? ??????</option>
					<option value="offline">???????????? ??????</option>
					<option value="unQue">????????? ??????</option>
				</select>
			</c:if>
		</div>
		<hr style="width:1250px; margin-left:10px;"> 
		<div style="display: flex;">
		<!-- searchSec -->
		<form action="searchQue.cl" method="post">
		<div class="searchSec">
			<select name="searchOption" >
				<option value="">????????????</option>
				<option value="clientName">?????????</option>
				<option value="clientPhone">????????????</option>
				<option value="queTitle">????????????</option>
				<option value="queType">????????????</option>
			</select>
			<input type="text" name="searchContent" class="searchContent">
			<button id="searchBtn" type="submit" onclick="return searchQue();">??????</button>
		</div>
		</form>
		<button id="openNewMD">??????</button>
		</div>
		<!-- searchSec end -->
		
		<div class="qList">
			<table style="border-collapse: collapse;" class="queTable">
				<tr>
					<th width="50px">No</th>
					<th width="550px">????????????</th>
					<th width="100px">????????????</th>
					<th width="100px">???????????????</th>
					<th width="200px">?????????</th>
					<th width="150px">????????????</th>
					<th width="100px">?????????</th>
				</tr>
				<c:forEach var="queList" items="${ queList }">
					<tr>
						<td class="qno"><input type="hidden" value="${ queList.qno }">${ queList.qno }</td>
						<td>${ queList.qtitle }</td>
						<td>${ queList.qtype }</td>
						<td class="mno"><input type="hidden" value="${ queList.mno }"> ${ queList.userName }</td>
						<td>${ queList.phone }</td>
						<td>${ queList.qdateView }</td>
						<td>${ queList.ansStatus }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="pagingSec">
		<c:if test="${ empty check }">
			<div id="pager_wrap" align="center">
				<ul class="pager_cnt clearfix add">
					<c:if test="${pi.currentPage <= 1 }">
						<li class="pager_com pager_arr prev on"><a
							href="javascirpt: void(0);">&#x003C;</a></li>
					</c:if>
					<c:if test="${pi.currentPage > 1 }">
						<c:url var="clistBack" value="queFilter.cl">
							<c:param name="currentPage" value="${pi.currentPage - 1 }" />
							<c:param name="filterType" value="${ filterType }"/>
						</c:url>
						<li class="pager_com pager_arr prev "><a href="${clistBack }">&#x003C;</a></li>
					</c:if>

					<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
						<c:if test="${p eq pi.currentPage }">
							<li class="pager_com pager_num on"><a
								href="javascript: void(0);">${p }</a></li>
						</c:if>
						<c:if test="${p ne pi.currentPage }">
							<c:url var="clistCheck" value="queFilter.cl">
								<c:param name="currentPage" value="${p }" />
								<c:param name="filterType" value="${ filterType }"/>
							</c:url>
							<li class="pager_com pager_num"><a href="${clistCheck }">${p }</a></li>
						</c:if>
					</c:forEach>


					<c:if test="${pi.currentPage >= pi.maxPage }">
						<li class="pager_com pager_arr next on"><a
							href="javascript: void(0);">&#x003E;</a></li>
					</c:if>
					<c:if test="${pi.currentPage < pi.maxPage }">
						<c:url var="clistEnd" value="queFilter.cl">
							<c:param name="currentPage" value="${pi.currentPage + 1 }" />
							<c:param name="filterType" value="${ filterType }"/>
						</c:url>
						<li class="pager_com pager_arr next"><a href="${clistEnd }">&#x003E;</a></li>
					</c:if>
				</ul>
			</div>
		</c:if>
		
		<c:if test="${ !empty check }">
			<div id="pager_wrap" align="center">
				<ul class="pager_cnt clearfix add">
					<c:if test="${pi.currentPage <= 1 }">
						<li class="pager_com pager_arr prev on"><a
							href="javascirpt: void(0);">&#x003C;</a></li>
					</c:if>
					<c:if test="${pi.currentPage > 1 }">
						<c:url var="clistBack" value="searchQue.cl">
							<c:param name="currentPage" value="${pi.currentPage - 1 }" />
							<c:param name="searchContent" value="${ sessionScope.searchContent }"/>
							<c:param name="searchOption" value="${ sessionScope.searchOption }"/>	
						</c:url>
						<li class="pager_com pager_arr prev "><a href="${clistBack }">&#x003C;</a></li>
					</c:if>

					<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
						<c:if test="${p eq pi.currentPage }">
							<li class="pager_com pager_num on"><a
								href="javascript: void(0);">${p }</a></li>
						</c:if>
						<c:if test="${p ne pi.currentPage }">
							<c:url var="clistCheck" value="searchQue.cl">
								<c:param name="currentPage" value="${p }" />
								<c:param name="searchContent" value="${ sessionScope.searchContent }"/>
								<c:param name="searchOption" value="${ sessionScope.searchOption }"/>	
							</c:url>
							<li class="pager_com pager_num"><a href="${clistCheck }">${p }</a></li>
						</c:if>
					</c:forEach>


					<c:if test="${pi.currentPage >= pi.maxPage }">
						<li class="pager_com pager_arr next on"><a
							href="javascript: void(0);">&#x003E;</a></li>
					</c:if>
					<c:if test="${pi.currentPage < pi.maxPage }">
						<c:url var="clistEnd" value="searchQue.cl">
							<c:param name="currentPage" value="${pi.currentPage + 1 }" />
							<c:param name="searchContent" value="${ sessionScope.searchContent }"/>
							<c:param name="searchOption" value="${ sessionScope.searchOption }"/>	
						</c:url>
						<li class="pager_com pager_arr next"><a href="${clistEnd }">&#x003E;</a></li>
					</c:if>
				</ul>
			</div>
		</c:if>>
		</div>
	</section>
	<script>
		var searchCheck = "";
		
		function searchQue(){
			
			if($(".searchOption").val() == ""){
				alert("?????? ????????? ??????????????????.");
				return false;
			}
			if($(".searchContent").val() == ""){
				alert("?????? ????????? ??????????????????.");
				return false;
			}
			
			searchCheck = "ok";
			return true;
			
		}
		
		
		$(function(){
			
			$("#openNewMD").click(function(){
				$(".queNewModal").fadeIn();
			});
			
			
			$(".queTable td").parent().mouseenter(function(){
				$(this).css("background","lightgray");
				$(this).css("cursor","pointer");
			}).mouseleave(function(){
				$(this).css("background","white");
				$(this).css("cursor","pointer");
			});
			$(".queTable td").parent().click(function(){
				var qno = $(this).children(".qno").children().val();
				var mno = $(this).children(".mno").children().val();
				$.ajax({
					url:"queDetail.cl",
					type:"post",
					data:{
						qno:qno,
						mno:mno
					},
					success:function(data){
						//data.queModal
						console.log(data.queModal);
						$(".queModalName").val(data.queModal.userName);
						if(data.queModal.email == null){
							console.log("?????????");
						}
						$(".queModalPhone").val(data.queModal.phone);
						$(".queModalQtype").val(data.queModal.qtype);
						$(".queModalQdate").val(data.queModal.qdate);
						$(".queModalQtitle").val(data.queModal.qtitle);
						$(".queModalQcontent").val(data.queModal.qcontent);
						$(".queModalQno").val(data.queModal.qno);
						$(".queModalAcontent").val(data.queModal.acontent);
						if($(".queModalAcontent").val() != ""){
							$(".queModalAcontent").attr("readonly","readonly");
							$(".answerBtn").css("display","none");
						}
						
						
					},
					error:function(data){
						
					}
				});
				$(".queModal").fadeIn();
			});
			
			$("#quefilter").on("change",function(){
				if($("#quefilter").val() == "all"){
					location.href="queFilter.cl?filterType=all";
				}
				if($("#quefilter").val() == "online"){
					location.href="queFilter.cl?filterType=on";
				}
				if($("#quefilter").val() == "offline"){
					location.href="queFilter.cl?filterType=off";
				}
				if($("#quefilter").val() == "unQue"){
					location.href="queFilter.cl?filterType=unQue";
				}
			});
				
			
		});
	</script>
</body>
</html>