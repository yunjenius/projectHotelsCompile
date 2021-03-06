<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelsCompile</title>
<style type="text/css">
	.rightAreaRoom{
		width:1300px;
		height:600px;
	}
	.serviceSearchArea{
		margin-top:30px;
		width:1200px;
		height:40px;
		background:#E9F3FF;
		display: flex;
		padding-top:15px;
		padding-left:10px;
	}
	.serviceSearchArea h4{
		margin-top:0;
		margin-bottom:0;
	}
	.serviceBtnArea{
		text-align:center;
		margin-left:30px;
	}
	.serviceBtn{
		width:100px;
		height:30px;
		background:#3498DB;
		color:white;
		border:0;
		cursor:pointer;
	}
	.serviceAddBtn{
		background:#3498DB;
		color:white;		
		border:0;
		cursor:pointer;
	}
	.serviceTableArea{
		margin-top:30px;
		width:1215px;
		height:400px;
		overflow-x:hidden;
		overflow-y:scroll;
		border:1px solid lightgray;
	}
	.serviceTable{
		width:1200px;
		text-align:center;
		border-collapse: collapse;
		border:1px solid lightgray;
	}
	.serviceTable th{
		background-color: #f7f7f7;
		color: #005B9E;
		border: 1px solid lightgray;
		height:30px;
	}
	.serviceTitleArea{
		width:1215px;  
		height:36px;
		padding-bottom:10px;
		border-bottom-color: lightgray;
		border-bottom-style: solid;
		border-bottom-width: 1px;
	}
	.serviceTitle{
		margin-top:20px; 
		border:0;
		width:180px;
		height:40px;
		font-weight: bold;
		box-shadow: 0 0.25rem 1rem rgba(0,0,0,0.2);
		background:#3498DB;
		color:white;
	}
	/* .serviceTable tr td input{
		border:0;
		font-weight:bold;
		text-align:center;
	} */
	
</style>
</head>
<body>
<header>
	<jsp:include page="modal/serviceModal.jsp"/>
	<jsp:include page="modal/serviceDetailModal.jsp"/>
	<jsp:include page="../common/settingMenubar.jsp"/>
	<jsp:include page="../common/menubar.jsp"/>
</header>
<section>
	<div class="mainArea">
		<div class="rightAreaRoom">
			<div class="serviceTitleArea">
				<h2>????????? ??????</h2>
			</div>
			<div class="serviceSearchArea">
			<form action="searchService.st" method="post">
				<select style="height:30px;" class="serviceOption" name="serviceOption">
					<option value="">????????????</option>
					<option value="serviceName">????????????</option>
					<option value="serviceCode">???????????????</option>
				</select>
				<input type="text" name="serviceValue" class="serviceValue" style="height:25px;">
				<button class="serviceBtn" onclick="return searchService();">??????</button>
			</form>
			<button type="button" class="serviceAddBtn" onclick="openServiceModal();" style="margin-left:720px; height:30px;">???????????????</button>
			</div>
			<div class="serviceTableArea">
				<table class="serviceTable" border="1">
					<tr class="thArea">
						<th width="15%">????????? ??????</th>
						<th width="30%">????????? ???</th>
						<th width="20%">?????? ??????</th>
						<th width="25%">??????</th>
						<th width="10%">????????????</th>
					</tr>
					<c:forEach var="svcList" items="${ svcList }">
					<tr>
						<td class="svcCodeTd">${ svcList.svcCode }</td>
						<td class="svcNameTd">${ svcList.svcName }</td>
						<c:if test="${ svcList.salesType.equals('ADDTIME') }">
							<td>????????????</td>
						</c:if>
						<c:if test="${ svcList.salesType.equals('ETC') }">
							<td>??????</td>
						</c:if>
						<td>${ svcList.svcPrice } ???</td>
						<c:if test="${ svcList.svcStatus.equals('Y') }">
							<td>??????</td>						
						</c:if>
						<c:if test="${ svcList.svcStatus.equals('N') }">
							<td>?????????</td>						
						</c:if>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</section>
<script type="text/javascript">
	
	$(function(){
		$(".serviceTableArea .serviceTable tr:not(.thArea)").mouseenter(function(){
	 		$(this).css({"background":"lightgray", "cursor":"pointer"});
	 	}).mouseout(function(){
	 		$(this).css({"background":"white"});
	 	}).click(function(){
	 		svcCode = $(this).children(".svcCodeTd").html();
	 		
	 		$.ajax({
	 			url:"serviceDetail.st",
	 			type:"post",
	 			data:{
	 				svcCode:svcCode
	 			},
	 			success:function(data){
	 				
	 				$(".serviceCodeDetailModal").val(data.svc.svcCode);
	 				$(".serviceNameDetailModal").val(data.svc.svcName);
	 				$(".servicePriceDetailModal").val(data.svc.svcPrice);
	 				$(".serviceTypeDetailModal").val(data.svc.salesType);
	 				
	 				if(data.svc.svcStatus == "Y"){
		 				$("#usedDetailModal").prop("checked", true);
	 				}else if(data.svc.svcStatus == "N"){
		 				$("#unUseDetailModal").prop("checked", true);
	 				}
	 				
	 				$(".modalDetail").fadeIn();
	 			},
	 			error:function(data){
	 				
	 			}
	 		});
	 		
	 	});
	});

	function openServiceModal(){
		$(".modal").fadeIn();
	}
	function addService(){
		
		if($(".svcCodeTd").html() == $(".serviceCode").val()){
			alert("????????? ??????????????? ?????????.");
			return false;
		}
		if($(".svcNameTd").html() == $(".serviceName").val()){
			alert("????????? ???????????? ?????????.");
			return false;
		}
		
		if($(".serviceCode").val() == ""){
			alert("????????? ????????? ??????????????????.");
			return false;
		}
		if($(".serviceName").val() == ""){
			alert("????????? ????????? ??????????????????.");
			return false;
		}
		if($(".servicePrice").val() == ""){
			alert("????????? ????????? ??????????????????.");
			return false;
		}
		if($(".serviceType").val() == ""){
			alert("????????? ????????? ??????????????????.");
			return false;
		}
		if($(".serviceUsing").val() == ""){
			alert("????????? ?????? ????????? ??????????????????.");
			return false;
		}
		
		return true;
	}
	
	function updateService(){
		
		if($(".servicePriceDetailModal").val() == ""){
			alert("????????? ????????? ??????????????????.");
			return false;
		}
		if(comfirm("??????????????? ???????????????????????? ? ")){
			return true;
		}
	}
	function searchService(){
		
		if($(".serviceOption").val() == ""){
			alert("??????????????? ??????????????????");
			return false;
		}
		if($(".serviceValue").val() == ""){
			alert("??????????????? ??????????????????");
			return false;
		}
		
		return true;
	}
</script>
</body>
</html>