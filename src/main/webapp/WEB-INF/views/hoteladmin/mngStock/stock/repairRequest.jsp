<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style> 
	 .top-div{
	width: 63.7%;
	height: 100px; 
	margin-top: -50px;
	}
 
	.searchCondition{

	margin-top: -50px;
	display: inline-block; 
	width: 100px;
	
	}

	#titlemsg{
		width: 220px;
		height: 50px;
		margin-top: 60px;
	}
	#mainMsg{
	font-size: 30px;
	font-weight: bold;
	}
	#searchZone{
	float: right;
	}
	#stockTb{
	width: 700px;
	height: 364px;
	border-collapse: collapse;
	border: 1px solid lightgray;
	margin-top: -22px;
	}
	td,th{
		border: 1px solid lightgray;
		align-content: center;
		text-align: center;
		height: 30px;
	}
	th{
	background-color: #f7f7f7;
	height: 30px;
	}
	#hrDiv{
	border-bottom: 1px solid lightgray;
	width: 700px;
	}
	.btns{
	 margin-top: 8px;
    margin-left: 48.1%
	}
	.tabClass{
	display: inline-block;
	width: 120px;
	height: 30px;
	border: 1px solid gray;
	border-radius: 10px 10px 0px 0px;
	border-bottom: none;
	font-weight: bold;
	
	}
	#tclass{
		margin-top: 20px; 
	}

<!-- -->
.tabb{
	display: inline-block;
	
	text-align: center;
	margin-top: 20px;
	margin-bottom: 10px;
	width: 80px;
	height: 31px;
	
	}
	#myTab{
	line-height: 30px;
	}
	#mailSet:hover{
	cursor: pointer;
	color: white;
	background-color: #3498DB;
	} 
	#mailText{
	background-color: #3498DB;
	color:white;
	}
	#mailText:hover{
	cursor: pointer;
	}
	#excel{
background : white;
	color:green;
	border: 1px solid green;
	width: 68px;
	height: 25px;
	font-weight: bold;
	border-radius: 2px;
}

#delete{
	background : white;
	color:red;
	border: 1px solid red;
	font-weight: bold;
	width: 68px;
	height: 25px;
	border-radius: 2px;
	margin-left: 5px;
}

#pager_wrap {
	padding: 60px 0;
	text-align: center;
	margin-top: -45px;
	margin-left:-633px;
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
a {
	text-decoration:none;
}
	
</style>
</head>
<body>
	
	

	<header>	
		<jsp:include page="../../common/menubar.jsp"/>
		<jsp:include page="../../common/productMenubar.jsp"/>
		 <jsp:include page="../modal/mRepairDetail.jsp"/> 
	</header>
	<section>
		
		<!-- <div class="tabClass" id="tclass" align="center">????????????
		</div>
		<div class="tabClass" id="rclass" align="center">????????????
		</div> -->
		<div>
		<div id="myTab">
			<div class="tabb" style="box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);" id="mailSet">????????????</div>
			<div class="tabb" style="margin-left: 10px;box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);" id="mailText">????????????</div>
			<div id="hrDiv"></div>
		</div>
	</div>
		<div id="hidden">
		</div>
	<div class="top-div">
			<div id="titlemsg"><label id="mainMsg">????????????</label></div>
	</div><!-- top div end -->
		<div id="stockTb">
			<table style="border-collapse: collapse; width: 100%">  
				<colgroup>
                  <col width="15%">
                  <col width="20%">
                  <col width="40%">
                  <col width="25%">
                  
               </colgroup>
			
			
			
				<tr>  
					<th><input type="checkbox"></th>
					<th style="color: #005B9E">????????????</th>
					<th style="color: #005B9E">??????</th>
					<th style="color: #005B9E">??????</th>
				
				</tr>
				<c:forEach var="i" items="${repairList}">
					<tr>
						<td><input type="checkbox"></td>
						<td style="color: #005B9E"><c:out value="${i.repNo} "/></td>
						<td style="color: #005B9E"><c:out value="${i.rpTitle}"/></td>
						<td><c:out value="${i.repStatus}"/><input type="hidden" value="${i.rptNo }" class="rptno"></td>
					</tr>
				</c:forEach>
			</table>
		<div id="hrDiv"></div>
		</div>
			<div class="btns">
			</div> 
	<!-- ????????? ?????? -->
			<!-- ????????? ?????? ?????? -->
			<div id="pager_wrap" align="center">
				<ul class="pager_cnt clearfix add">
					<c:if test="${pi.currentPage <= 1 }">
						<li class="pager_com pager_arr prev on"><a
							href="javascirpt: void(0);">&#x003C;</a></li>
					</c:if>
					<c:if test="${pi.currentPage > 1 }">
						<c:url var="blistBack" value="selectRepair.sto">
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

							<c:url var="blistCheck" value="selectRepair.sto">
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
		
			<!-- ????????? ?????? ?????? -->
	
	
	
	
	</section>
	
	<script>
	
		//?????????
		$(function(){
			$("#stockTb").find("td").mouseenter(function(){
				$(this).parent("tr").css({"background":"lightgray","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent("tr").css({"background":"white"});
			}).click(function(){
				var rptNo = $(this).parent("tr").find(".rptno").val();
				var repNo = $(this).parent("tr").children().eq(1).text();
				console.log(rptNo);
				console.log(repNo);
				
				$.ajax({
					url:"repairFilter.sto",
					type:"get",
					data:{
						rptNo:rptNo,
						repNo:repNo
					},
					success:function(data) {
						
						 $.each(data.list, function(index, list) {
			                  $('#Table .repairDetail').after("<tr class='repeatOrder'><td>"+list.INO+"</td><td>" + list.SCATEGORY + "</td><td>"+list.VOS+"</td><td>" + list.INAME +"</td><td>"+list.VOS + "</td><td>" + list.REP_PRICE + "</td></tr>");
			              	
			                  
			 			  });
						 $("#day1").val(data.list[0].REP_BEGIN);
						 
						 if(data.list[0].REP_STATUS == 'Y') {
							 $("#day2").val(data.list[0].REP_END)
						 }
						 
						 $("#person1").val(data.list[0].RECEIVER);
						 $("#etcText").val(data.list[0].CN_NAME);
						 $("#person2").val(data.list[0].REP_NO);
						 
					
						
						$(".modal").fadeIn();
					},
					error:function(data) {
						
					}
				});
				
				
				
			});
			
		});
		
		//???????????????
		$("#mailSet").click(function(){
			location.href='selectStock.sto';
		});
		
		
	</script>
	
</body>
</html>