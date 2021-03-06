<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelsCompile</title>
<style>
.site-outer{
	width: 90%; 
	margin-left: 5%;
}

.searchArea{
	background: #F3F3F3;
	width: 100%;
}

.spend{
	margin-left: 10px;
}

.price{
	text-align: right;
}

.date{
	text-align: center;
}
.list-table{
	text-align: center;
	border-collapse: collapse;
	position: relative;
}

.list-table td, th{
	padding: 10px;
}
.list-table tr{
	height: 30px;
}

.list-table th{
	background: #F3F3F3;
}

.list-table tr td:nth-child(3){
	text-align: left;
}

.list-table th:nth-child(4){
	width: 200px;
}

.list-table th:nth-child(7){
	width: 150px;
}

.list-table td:not(:last-child), .list-table th:not(:last-child){
	border-right: 1px solid #D9D9D9;
}

.list-table tbody tr:last-child th{
	border: none;
}

.list-table thead th{
	position: sticky;
	top: 0;
}

.list-table tbody th{
	position: sticky;
	bottom: 0;
}

.analysMenubar div {
	display: inline-block;
	width: 80px;
	height: 31px;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 10px;
	background-color: white;
	color: black;
	box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
}

.analysMenubar>div:hover{
	background: #3498DB;
	color: white;
	cursor: pointer;
}

.analys-item{
	line-height: 30px;
}

#hrDiv{
	border-bottom: 1px solid lightgray;
	width: 100%;
}

.excel-btn{
	background: white;
    color: green !important;
    width: 68px;
    height: 25px;
    border-radius: 2px;
    line-height: 30px;
}

.excel-btn:hover{
	background: green !important;
	color: white !important;
}

input[type=text], select{
	width: 100px;
	border: 1px solid lightgray;
	padding: 0;
	border-radius: 3px;
	height:23px;
}

.anlys-btn{
	width:80px;
	height:25px;
	border-radius:5px;
	border:0;
	background-color: #3498DB;
   	color: white;
   	cursor:pointer;
}

.anlys-btn:focus{
	outline: none;
}
</style>
</head>
<body>
	<header>
<%-- 		<jsp:include page="../common/analysMenubar.jsp"/> --%>
		<jsp:include page="../common/menubar.jsp"/>
	</header>
	<section>
		<c:set var="sum" value="0"/>
		<div class="site-outer">
			<div class="analysMenubarArea">
				<div class="analysMenubar">
					<div id="sales"
						class="analys-item sales ${ Condition eq 'sales' ? '_active' : '' }">??????
						??????</div>
					<div id="spend"
						class="analys-item spend ${ Condition eq 'spend' ? '_active' : '' }">??????
						??????</div>
					<div class="excel-btn" style="float: right;">??????</div>
					<input id="excel" type="file" style="display: none;">
				</div>
				<div id="hrDiv" style="background-color: lightgray; color: lightgray"></div>
			</div>
			<br>
			<!-- ?????? ?????? -->
			<c:if test="${ Condition eq 'sales' }">
			<!-- ?????? ?????? -->
			<form id="searchForm" action="searchDetail.an?Condition=sales" method="post">
				<div class="searchArea" align="right">
					<c:if test="${ view eq 'view' }">
						<select class="searchCondition" name="searchCondition">
							<option value="sales" selected>????????????</option>
							<option value="checkIn">????????????</option>
							<option value="checkOut">????????????</option>
						</select>
					</c:if>
					<c:if test="${ view eq 'search' }">
						<select class="searchCondition" name="searchCondition">
							<option value="sales">????????????</option>
							<option value="checkIn">????????????</option>
							<option value="checkOut">????????????</option>
						</select>
					</c:if>
					
					<c:if test="${ view eq 'view' }">
						<input type="text" name="startDate" class="date" id="startDate" readonly> - 
					</c:if>
					<c:if test="${ view eq 'search' }">
						<input type="text" name="startDate" class="date" id="startDate" value="${ startDate }" readonly> - 
					</c:if>
					<c:if test="${ view eq 'view' }">
						<input type="text" name="endDate" class="date" id="endDate" readonly>
					</c:if>
					<c:if test="${ view eq 'search' }">
						<input type="text" name="endDate" class="date" id="endDate" value="${ endDate }" readonly>
					</c:if>
					<button type="submit" class="anlys-btn">??????</button>
				</div>
			</form>
			<!-- ?????? ?????? ??? -->
			<br>
			<!-- ????????? ?????? -->
			<div style="max-height: 530px; overflow: auto;">
				<table class="list-table" style="width: 100%;">
					<thead>
						<tr>
							<th>????????????</th>
							<th>????????????</th>
							<th>?????????</th>
							<th>????????????</th>
							<th>????????????</th>
							<th>????????????</th>
							<th>?????? ??????</th>
							<th>??????</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${ sdList }" varStatus="st">
						<tr>
							<td>${ list.rmNum }</td>
							<td>${ list.rsvNo }</td>
							<td>${ list.name }</td>
							<td>${ list.rsvDate }</td>
							<td>${ list.checkIn }</td>
							<td>${ list.checkOut }</td>
							<td align="right"><fmt:formatNumber value="${ list.price }" pattern="#,###"/> ???</td>
							<td></td>	
						</tr>
						<c:set var="sum" value="${ sum + list.price }"></c:set>
						</c:forEach>
						<tr>
							<th colspan="5"></th>
							<th>??? ?????? ??????</th>
							<th align="right"><fmt:formatNumber value="${ sum }" pattern="#,###"/> ???</th>
							<th></th>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- ????????? ?????? ??? -->
			</c:if>
			<!-- ?????? ?????? -->
			<c:if test="${ Condition eq 'spend' }">
			<!-- ?????? ?????? -->
			<form id="searchForm" action="searchDetail.an?Condition=spend" method="post">
				<div class="searchArea" align="right">
					<label>?????? ??????</label>
					<input type="hidden" name="searchCondition" value="search">
					<input type="text" name="startDate" class="date" id="startDate" readonly> - 
					<input type="text" name="endDate" class="date" id="endDate" readonly>
					<button type="submit" class="anlys-btn">??????</button>
				</div>
			</form>
			<!-- ?????? ?????? ??? -->
			<br>
			<!-- ????????? ?????? -->
			<div style="max-height: 530px; overflow: auto;">
				<table class="list-table" style="width: 100%;">
					<tr>
						<th>??????</th>
						<th>?????????</th>
						<th>???????????????</th>
						<th>????????????</th>
						<th>????????????</th>
						<th>????????????</th>
						<th>?????? ??????</th>
						<th>??????</th>
					</tr>
					<c:forEach var="list" items="${ sdList }">
					<c:if test="${ list.rptType eq '??????' }">
						<c:set var="type" value="??????"/>
					</c:if>
					<c:if test="${ list.rptType ne '??????' }">
						<c:set var="type" value="??????"/>
					</c:if>
					<tr>
						<td>${ type }</td>
						<td>${ list.rptType }</td>
						<td>${ list.name }</td>
						<td>${ list.pway }</td>	
						<td>${ list.modDate }</td>
						<td>${ list.response }</td>
						<td align="right"><fmt:formatNumber value="${ list.totalPrice }" pattern="#,###"/> ???</td>
						<td>${ list.memo }</td>
					</tr>
					<c:set var="sum" value="${ sum + list.totalPrice }"></c:set>
					</c:forEach>
					<tr>
						<th colspan="5"></th>
						<th>??? ?????? ??????</th>
						<th align="right"><fmt:formatNumber value="${ sum }" pattern="#,###"/> ???</th>
						<th></th>
					</tr>
				</table>
			</div>
			<!-- ????????? ?????? ??? -->
			</c:if>
		</div>
	</section>
	<footer>
	</footer>
	<script>
		
		$(function() {
			date = new Date();

			startDate = $("#startDate").datepicker({
				autoClose : true,
				//????????? ????????? ?????????
				onSelect : function(date) {
					//????????? datepicker??? ??????????????? ?????? ????????? ????????? ??????
					startNum = date;
					$("#endDate").datepicker({
						minDate : new Date(startNum),
					});
				}
			}).data('datepicker');

			endDate = $("#endDate").datepicker({
				autoClose : true,
				//????????? ????????? ?????????
				onSelect : function(date) {
					endNum = date;
					$('#startDate').datepicker({
						//????????? datepicker??? ??????????????? ?????? ????????? ????????? ??????
						maxDate : new Date(endNum),
					});
				}
			}).data('datepicker');
		});
		
		$(function(){
			$("._active").css({"background":"#3498DB", "color":"white"});
		});
		
		$(".analys-item").click(function(){
			var Condition = $(this).attr('id');
			location.href='viewDetailList.an?Condition=' + Condition;
		});
		
		$(".excel-btn").click(function(){
			$("#excel").click();
		});
	</script>
</body>
</html>