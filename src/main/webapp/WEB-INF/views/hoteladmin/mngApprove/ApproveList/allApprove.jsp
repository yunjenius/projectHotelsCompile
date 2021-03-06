<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelsCompile</title>
<style>
.approval {
	width: 1200px;
	height: auto;
	margin-left: auto;
	margin-right: auto;
	text-align: left;
	margin-top: -190px;
}

.title {
	margin-top: 20px;
	width: 80px;
	height: 35px;
	border-bottom: 1px solid lightgray;
}

.approval .category {
	width: auto;
	height: 30px;
	display: inline-block;
	margin: 1px;
}

.approval .category .btl {
	border: 1px solid white;
	background: white;
	color: #3498DB;
	width: 75px;
	box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
}

.tbl_wrap {
	margin-top: 20px;
}

.tbl_wrap .tbl {
	border-collapse: collapse;
	width: 100%;
	text-align: center;
}

.tbl_wrap.tbl tr:not(:last-child) {
	border-bottom:1px solid #aaa;

}
.tbl_wrap .tbl td, th {
	border: 1px solid lightgray;
	text-align: center;
	padding: 7px;
}

.tbl_wrap .tbl th {
	background-color: #f7f7f7;
	color: #005B9E;
}

.tbl_wrap .tbl .squ_tbl {
	padding: 4px 8px;
	background-color: #ddd;
	font-size: 13px;
}

.writeDocu {
	float: right;
	margin-bottom: 10px;
	height: 30px;
}

.write {
	height: 30px;
	border: 2px solid royalblue;
	background: royalblue;
	color: white;
	font-weight: bold;
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
a {
	text-decoration:none;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<header>
		<jsp:include page="../../common/menubar.jsp" />
	</header>
	<%-- <c:set var="contextPath"
      value="${pageContext.servletContext.contextPath }" scope="application" /> --%>
	<section>
		<jsp:include page="../approveModal/purchaseApproveModal.jsp"></jsp:include>
		<jsp:include page="../approveModal/repairApproveModal.jsp"></jsp:include>
		<jsp:include page="../approveModal/orderApproveModal.jsp"></jsp:include>
		<div class="approval">
			<div class="title">
				<h2>?????????</h2>
			</div>
			<br> <br>
			<div class="category">


				<button class="category btl total">??????</button>
				<!-- <button class="category btl">?????????</button> -->
				<button class="category btl">?????????</button>
				<button class="category btl">??????</button>
				<button class="category btl">??????</button>
				<button class="category btl">??? ?????????</button>
			</div>
			<div class="writeDocu">
				<button class="write" onclick="location.href='writeAllApprove.ap'">?????????
					??????</button>
			</div>







			<div class="tbl_wrap">
				<table class="tbl">
					<colgroup>
						<col width="7%">
						<col width="25%">
						<col width="25%">
						<col width="13%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
					</colgroup>

					<tr>
						<th>No<input type="hidden" value="${sessionScope.loginUser.mno }" class="mno"></th>
						<th>????????????</th>
						<th>??????</th>
						<th>??????</th>
						<th>?????????</th>
						<th>?????????</th>
						<th>????????????</th>
					</tr>
					<c:forEach var="b" items="${list }">
						<tr class="tbl_tit">
							<input type="hidden" value="${b.RPT_NO}">
							<td><c:out value="${b.RNUM }" /></td>
							<td><c:out value="${b.RPTDATE }" /></td>
							<td><c:out value="${b.RPTITLE }" /></td>
							<td><c:out value="${b.RPTYPE }" /></td>
							<td><c:out value="${b.MNAME }" /></td>
							<c:choose>
							<c:when test="${b.RPSTATUS eq '??????' }">
 								<td><c:out value="${b.SNAME }" /></td>
							 </c:when>
							 <c:when test="${b.RPSTATUS eq '??????' }">
							 	<td><c:out value="${b.SNAME }" /></td>
							 </c:when>
							 <c:otherwise >
							 <td></td>
							 </c:otherwise> 
							 </c:choose>
							<td><c:out value="${b.RPSTATUS }" /></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!-- ????????? ?????? -->
			<!-- ????????? ?????? ?????? -->
			<div id="pager_wrap" align="center">
				<ul class="pager_cnt clearfix add">
					<c:if test="${pi.currentPage <= 1 }">
						<li class="pager_com pager_arr prev on"><a
							href="javascirpt: void(0);"><</a></li>
					</c:if>
					<c:if test="${pi.currentPage > 1 }">
						<c:url var="blistBack" value="/documentApproval.ap">
							<c:param name="currentPage" value="${pi.currentPage - 1 }" />
							<c:param name="scurrentPage" value="" />
						</c:url>
						<li class="pager_com pager_arr prev "><a href="${blistBack }"><</a></li>
					</c:if>

					<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
						<c:if test="${p eq pi.currentPage }">
							<li class="pager_com pager_num on"><a
								href="javascript: void(0);">${p }</a></li>
						</c:if>
						<c:if test="${p ne pi.currentPage }">

							<c:url var="blistCheck" value="documentApproval.ap">
								<c:param name="currentPage" value="${p }" />
							</c:url>
							<li class="pager_com pager_num"><a href="${blistCheck }">${p }</a></li>
						</c:if>
					</c:forEach>


					<c:if test="${pi.currentPage >= pi.maxPage }">
						<li class="pager_com pager_arr next on"><a
							href="javascript: void(0);">></a></li>
					</c:if>
					<c:if test="${pi.currentPage < pi.maxPage }">
						<c:url var="blistEnd" value="documentApproval.ap">
							<c:param name="currentPage" value="${pi.currentPage + 1 }" />
						</c:url>
						<li class="pager_com pager_arr next"><a href="${blistEnd }">></a></li>
					</c:if>
				</ul>
			</div>

			<!-- ????????? ?????? ?????? -->


		</div>
	</section>
	<script>
    $(document).ready(function(){
       $(".category.btl.total").css({"background-color":"#3498DB", "box-shadow":"0px 0px 0px", "color":"white"});
       //$(".modal.repair").fadeIn();
      /*  $(".modal.order").fadeIn(); */
    })
      
       $(".tbl_tit").mouseenter(function(){
          $(this).css({"background":"lightgray", "cursor":"pointer"})
       }).mouseout(function(){
          $(this).css({"background":"white"})
       }).click(function(){
    	   var rptNo = $(this).children().eq(0).val();
    	   var type = $(this).children().eq(4).text();
    	   console.log(type);
    	   //$(".modal").fadeIn();
    	  if(type == "?????? ?????????") {
    		  $.ajax({
       		   url:"allApproveModal.ap",
       		   type:"get",
       		   data:{
       			   rptNo:rptNo,
       			   type:type
       		   },
       		 success:function(data) {
   			   var totalPrice = 0;
   			   console.log(data.list[0].RSTATUS);
   			   
   			  $.each(data.list, function(index, list) {
                    $('#tbl_modal_order .tempOrder').after("<tr class='repeatOrder'><td>"+list.ITYPE+"</td><td>" + list.CNAME + "</td><td>"+list.INAME+"</td><td>" + list.MFG +"</td><td>"+list.VOS + "</td><td>" + list.AMOUNT + "</td><td>"+list.VOS * list.AMOUNT+"</td></tr>");
                	
                    
   			  });
   			   
   			   
   			$("#tbl_modal_order tr:nth-child(4)").children().eq(3).text(data.list[0].REQDATE2);
   			    $("#tbl_modal_order tr:first-child").children().eq(1).text(data.list[0].DOCNO);
   			    if(data.list[0].RSTATUS == 'WAIT') {
   			    }else {
   			    	$("#tbl_modal_order tr").find(".head").text(data.list[0].SNAME);
   			    }
   			    	$("#tbl_modal_order tr:nth-child(2)").children().eq(2).text(data.list[0].MNAME);
   			 	
   			   $("#tbl_modal_order tr:nth-child(2)").children().eq(1).text(data.list[0].DNAME);
   			   $("#tbl_modal_order tr:nth-child(3)").children().eq(1).text(data.list[0].MNAME);
   			   $("#tbl_modal_order tr:nth-child(4)").children().eq(1).text(data.list[0].RDATE);
   			   $("#tbl_modal_order tr:nth-child(5)").children().eq(1).text(data.list[0].SNAME);
   			   $("#tbl_modal_order tr:nth-child(6)").children().eq(1).text(data.list[0].RTITLE);
   		 	     $("#tbl_modal_order #totalPrice").children().eq(1).text(data.list[0].TPRICE + "???");
   		 	    // console.log(list.PRSN)
   		 	    $("#tbl_modal_order #content_order").children().find(".txtArea").text(data.list[0].CONTENT);
   		 	     
   			   $(".modal_order").fadeIn();
   	
		   },
       		 error:function(data) {
  			   alert("?????????");
  			   
       		 }
    		  });
    		  
    	  }else if(type == "?????? ?????????") {
    		  $.ajax({
          		   url:"allApproveModal.ap",
          		   type:"get",
          		   data:{
          			   rptNo:rptNo,
          			   type:type
          		   },
          		   success:function(data) {
              			   var totalPrice = 0;
              			    $("#tbl_modal_repair tr:first-child").children().eq(1).text(data.list[0].DOCNO);
              			 	$("#tbl_modal_repair tr:nth-child(2)").children().eq(2).text(data.list[0].MNAME);
              			 	
              			 	if(data.list[0].RSTATUS == "APPR" || data.list[0].RSTATUS == "REJECT") {
              			 		$("#tbl_modal_repair tr").find(".head").text(data.list[0].SNAME);
              			 	}
              			 	
              			    //$("#tbl_modal tr:nth-child(2)").children().eq(2).text(list.SNAME);
              			   $("#tbl_modal_repair tr:nth-child(2)").children().eq(1).text(data.list[0].DNAME);
              			   $("#tbl_modal_repair tr:nth-child(3)").children().eq(1).text(data.list[0].MNAME);
              			   $("#tbl_modal_repair tr:nth-child(4)").children().eq(1).text(data.list[0].RDATE);
              			   $("#tbl_modal_repair tr:nth-child(5)").children().eq(1).text(data.list[0].SNAME);
              			   $("#tbl_modal_repair tr:nth-child(6)").children().eq(1).text(data.list[0].RTITLE);
              		 	      
              			 $.each(data.list, function(index, list) {
                             $('#tbl_modal_repair .repeatRepair').after("<tr class='repairTr'><td>"+list.RNUM+"</td><td>" + list.INO + "</td><td>"+list.INAME+"</td><td>" + list.CNAME +"</td><td>"+list.RPRICE + "</td><td>" + list.RSN + "</td></tr>");
                         	
                             
            			  });
              			   
              			   
              		 	     $("#tbl_modal_repair #totalPrice").text(data.list[0].TPRICE + "???");
              		 	     //console.log(list.PRSN)
              		 	    $("#tbl_modal_repair #content_repair").find(".txtArea").text(data.list[0].CONTENT);
              		 	     
              			   $(".modal_repair").fadeIn();
              	
          		   },
          		 error:function(data) {
     			   alert("?????????");
     			   
          		 }
       		  });
    	  }else {
    		  $.ajax({
         		   url:"allApproveModal.ap",
         		   type:"get",
         		   data:{
         			   rptNo:rptNo,
         			   type:type
         		   },
         		   success:function(data) {
             			   var totalPrice = 0;
             			   console.log(data.list[0].RSTATUS)
             			   
             			  $.each(data.list, function(index, list) {
                              $('#tbl_modal .temp').after("<tr class='repeat'><td>"+list.ITYPE+"</td><td>" + list.CNAME + "</td><td>"+list.INAME+"</td><td>" + list.MFG +"</td><td>"+list.VOS + "</td><td>" + list.AMOUNT + "</td><td>"+list.VOS * list.AMOUNT+"</td></tr>");
                          	
                              
             			  });
             			   
             			   
             			   
             			    $("#tbl_modal tr:first-child").children().eq(1).text(data.list[0].DOCNO);
             			    if(data.list[0].RSTATUS == 'WAIT') {
             			    	$("#tbl_modal tr:nth-child(2)").children().eq(2).text("");

             			    }else {
             			    	$("#tbl_modal tr:nth-child(2)").children().eq(2).text(data.list[0].SNAME);
             			    }
             			 	
             			    //$("#tbl_modal tr:nth-child(2)").children().eq(2).text(list.SNAME);
             			   $("#tbl_modal tr:nth-child(2)").children().eq(1).text(data.list[0].DNAME);
             			   $("#tbl_modal tr:nth-child(3)").children().eq(1).text(data.list[0].MNAME);
             			   $("#tbl_modal tr:nth-child(4)").children().eq(1).text(data.list[0].RDATE);
             			   $("#tbl_modal tr:nth-child(5)").children().eq(1).text(data.list[0].SNAME);
             			   $("#tbl_modal tr:nth-child(6)").children().eq(1).text(data.list[0].RTITLE);
             		 	     $("#tbl_modal tr").children("#totalPrice").text(data.list[0].TPRICE + "???");
             		 	    // console.log(list.PRSN)
             		 	    $("#tbl_modal #content").find(".txtArea").text(data.list[0].CONTENT);
             		 	     
             			   $(".modal").fadeIn();
             	
         		   },
         		 error:function(data) {
    			   alert("?????????");
    			   
         		 }
      		  });
    	  }
    	   
         
       });
    
    //1??? ???.
    
    
    
    
    	//2
       $(".category.btl").click(function(){
          $except = $(this);
           $(this).css({"box-shadow":"0px 0px 0px", "border":"1px solid lightgray", "background":"#3498DB", "color":"white"});
           $(".category.btl").not($except).css({"color":"#3498DB", "background":"white","border":"1px solid white", "box-shadow":"0px 4px 4px rgba(0, 0, 0, 0.25)"});
			
           var mno = $(".mno").val();
           console.log(mno)
           
           
            var cate = $(this).text();
           var scurrentPage = 1; 
           console.log(cate)

           
           
           
   	    $.ajax({
   		   url:"docuFilter.ap",
   		   type:"get",
   		   data:{
   			   cate:cate,
   			   scurrentPage:scurrentPage,
   			   mno:mno
   			   
   			   
   		   },
   		   success:function(data) {
   			   var reportList = data.reportList;
   			   console.log(data.reportList);
   			   
   			   $tableBody = $(".tbl");
   			   $pagingArea = $("#pager_wrap").html('');
   			   
   			   
   			   $tableBody.find("tr:not(:first)").remove();
   			   
   			   
   			  
   			 	var item = data.reportList;
					var slistCount = data.pi.listCount;
					var scurrentPage = data.pi.currentPage;
					var smaxPage = data.pi.maxPage;
					var sstartPage = data.pi.startPage;
					var sendPage = data.pi.endPage;
					
					console.log(slistCount);
					console.log(scurrentPage);
					console.log(smaxPage);
					console.log(slistCount);
					console.log(sstartPage);
					console.log(sendPage);
					
					
					
						
				 	for(var i = 0; i < reportList.length; i++) {
				 		var $sumTr = $("<tr class='tbl_tit'>");
				 		var $ctr1 = "<input type='hidden' value='" + reportList[i].RPT_NO + "'>";
				 		var $ctr2 = "<td>" + reportList[i].RNUM + "</td>";
				 		var $ctr3 = "<td>" + reportList[i].RPTDATE + "</td>";
				 		var $ctr4 = "<td>" + reportList[i].RPTITLE + "</td>";
				 		var $ctr5 = "<td>" + reportList[i].RPTYPE + "</td>";
				 		var $ctr6 = "<td>" + reportList[i].MNAME + "</td>";
				 		if(reportList[i].RPSTATUS == "??????" || reportList[i].RPSTATUS == "??????") {
				 			var $ctr7 = "<td>" + reportList[i].RNAME + "</td>";
				 		}else {
				 			var $ctr7 = "<td></td>";
				 		}
				 		var $ctr8 = "<td>" + reportList[i].RPSTATUS + "</td>";
				 		
				 		 $sumTr.append($ctr1);
				 		$sumTr.append($ctr2);
				 		$sumTr.append($ctr3);
				 		$sumTr.append($ctr4);
				 		$sumTr.append($ctr5);
				 		$sumTr.append($ctr6);
				 		$sumTr.append($ctr7);
				 		$sumTr.append($ctr8);
				 		$tableBody.append($sumTr); 
				 		
				 		
				 		
				 		
				 	//$tableBody.append($total );
				 	}
				 	var $pageDiv = new Array();
				 	var $button = new Array();
				 	var $input2 = new Array();
				 	var $input10 = new Array();
				 	
				 	if(scurrentPage <= 1){
						$pageDiv1 = $("<li class='pager_com pager_arr prev on'>");
						$button1 = $("<a href='javascirpt: void(0);'>").text('<');
						$pageDiv1.append($button1);
						$pagingArea.append($pageDiv1);
					}else {
						$pageDiv1 = $("<li class='pager_com pager_arr prev '>");
						$button1 = $("<a href='#' onclick='paging(this);'}>").text('<');
						$pageDiv1.append($button1);
						$pagingArea.append($pageDiv1);
					} 
					
					for(var p=sstartPage; p<=sendPage; p++){
						
						if(p==scurrentPage){
							$pageDiv[p] = $("<li class='pager_com pager_num on'>");
							$button[p] = $("<a href='javascript: void(0);'>").text(p);
							//$input10[p] = $("<input type='hidden' id='hide2'>").val(p);
						} else{
							$pageDiv[p] = $("<li class='pager_com pager_num'>").val(p);
							$button[p] = $("<a href='#' onclick='paging(this);' value='p'>").text(p);
							$input2[p] = $("<input type='hidden' id='hide'>").val(cate);
							$input10[p] = $("<input type='hidden' id='hide2'>").val(p);
						}
						$pageDiv[p].append($button[p]);
						$pageDiv[p].append($button[p]).append($input2[p]).append($input10[p]);
						$pagingArea.append($pageDiv[p]);
					} 
					
					
					if(scurrentPage < smaxPage){
						console.log(p);
						$pageDiv2 = $("<li class='pager_com pager_arr next on'>");
						$button2 = $("<a href='#' onclick='paging(this);' value='p'>").text('>');
						$input3 = $("<input type='hidden' id='lastPage'>").val(p+1);
						$pageDiv2.append($button2);
						$pageDiv2.append($input3);
						$pagingArea.append($pageDiv2);
					}else {
						$pageDiv2 = $("<li class='pager_com pager_arr next on'>");
						$button2 = $("<a href='javascript: void(0);''>").text('>');
						$input3 = $("<input type='hidden' id='lastPage'>").val(p);
						$pageDiv2.append($button2);
						$pageDiv2.append($input3);
						$pagingArea.append($pageDiv2);
					}
					
					//?????? ajax ??????
				$(".tbl_tit").mouseenter(function(){
          $(this).css({"background":"lightgray", "cursor":"pointer"})
       }).mouseout(function(){
          $(this).css({"background":"white"})
       }).click(function(){
    	   var rptNo = $(this).children().eq(0).val();
    	   var type = $(this).children().eq(4).text();
    	   console.log(type);	
		
					
					
		if(type == "?????? ?????????") {
		  $.ajax({
  		   url:"allApproveModal.ap",
  		   type:"get",
  		   data:{
  			   rptNo:rptNo,
  			   type:type
  		   },
  		 success:function(data) {
 			   var totalPrice = 0;
 			   console.log(data.list);
 			   
 			  $.each(data.list, function(index, list) {
                  $('#tbl_modal_order .tempOrder').after("<tr class='repeatOrder'><td>"+list.ITYPE+"</td><td>" + list.CNAME + "</td><td>"+list.INAME+"</td><td>" + list.MFG +"</td><td>"+list.VOS + "</td><td>" + list.AMOUNT + "</td><td>"+list.VOS * list.AMOUNT+"</td></tr>");
              	
                  
 			  });
 			   
 			   
 			 $("#tbl_modal_order tr:nth-child(4)").children().eq(3).text(data.list[0].REQDATE2);
 			    $("#tbl_modal_order tr:first-child").children().eq(1).text(data.list[0].DOCNO);
 			    if(data.list[0].RSTATUS == 'WAIT') {

 			    }else {
 			    	$("#tbl_modal_order tr").find(".head").text(data.list[0].SNAME);
 			    }
 			    	$("#tbl_modal_order tr:nth-child(2)").children().eq(2).text(data.list[0].MNAME);
 			 	
 			    //$("#tbl_modal tr:nth-child(2)").children().eq(2).text(list.SNAME);
 			   $("#tbl_modal_order tr:nth-child(2)").children().eq(1).text(data.list[0].DNAME);
 			   $("#tbl_modal_order tr:nth-child(3)").children().eq(1).text(data.list[0].MNAME);
 			   $("#tbl_modal_order tr:nth-child(4)").children().eq(1).text(data.list[0].RDATE);
 			   $("#tbl_modal_order tr:nth-child(5)").children().eq(1).text(data.list[0].SNAME);
 			   $("#tbl_modal_order tr:nth-child(6)").children().eq(1).text(data.list[0].RTITLE);
 		 	     $("#tbl_modal_order #totalPrice").children().eq(1).text(data.list[0].TPRICE + "???");
 		 	   $("#tbl_modal_order #content_order").children().find(".txtArea").text(data.list[0].CONTENT);
 		 	     
 			   $(".modal_order").fadeIn();
 			   
 			  if(data.list[0].RSTATUS == "APPR" || data.list[0].RSTATUS == "REJECT") {
 				 $("#printApprove").show();
				}else {
					
				} 
 			   
 	
		   },
  		 error:function(data) {
			   alert("?????????");
			   
  		 }
		  });
		  
	  }else if(type == "?????? ?????????") {
		  $.ajax({
     		   url:"allApproveModal.ap",
     		   type:"get",
     		   data:{
     			   rptNo:rptNo,
     			   type:type
     		   },
     		  success:function(data) {
     			 console.log(data.list.RSTATUS)
     			   var totalPrice = 0;
     			    $("#tbl_modal_repair tr:first-child").children().eq(1).text(data.list[0].DOCNO);
     			 	$("#tbl_modal_repair tr:nth-child(2)").children().eq(2).text(data.list[0].MNAME);
     			 	if(data.list[0].RSTATUS == "APPR" || data.list[0].RSTATUS == "REJECT") {
     			 	$("#tbl_modal_repair tr").find(".head").text(data.list[0].SNAME);
     			 	}
     			   $("#tbl_modal_repair tr:nth-child(2)").children().eq(1).text(data.list[0].DNAME);
     			   $("#tbl_modal_repair tr:nth-child(3)").children().eq(1).text(data.list[0].MNAME);
     			   $("#tbl_modal_repair tr:nth-child(4)").children().eq(1).text(data.list[0].RDATE);
     			   $("#tbl_modal_repair tr:nth-child(5)").children().eq(1).text(data.list[0].SNAME);
     			   $("#tbl_modal_repair tr:nth-child(6)").children().eq(1).text(data.list[0].RTITLE);
     		 	      
     			 $.each(data.list, function(index, list) {
                    $('#tbl_modal_repair .repeatRepair').after("<tr class='repairTr'><td>"+list.RNUM+"</td><td>" + list.INO + "</td><td>"+list.INAME+"</td><td>" + list.CNAME +"</td><td>"+list.RPRICE + "</td><td>" + list.RSN + "</td></tr>");
                	
                    
   			  });
     			   
     			   
     			  
     		 	     $("#tbl_modal_repair #totalPrice").text(data.list[0].TPRICE + "???");
     		 	   $("#tbl_modal_repair #content_repair").find(".txtArea").text(data.list[0].CONTENT);
     		 	     
     			   $(".modal_repair").fadeIn();
     	
 		   },
     		 error:function(data) {
			   alert("?????????");
			   
     		 }
  		  });
	  }else {
		  $.ajax({
    		   url:"allApproveModal.ap",
    		   type:"get",
    		   data:{
    			   rptNo:rptNo,
    			   type:type
    		   },
    		   success:function(data) {
     			   var totalPrice = 0;
     			   
     			  $.each(data.list, function(index, list) {
                      $('#tbl_modal .temp').after("<tr class='repeat'><td>"+list.ITYPE+"</td><td>" + list.CNAME + "</td><td>"+list.INAME+"</td><td>" + list.MFG +"</td><td>"+list.VOS + "</td><td>" + list.AMOUNT + "</td><td>"+list.VOS * list.AMOUNT+"</td></tr>");
                  	
                      
     			  });
     			   
     			   
     			   
     			    $("#tbl_modal tr:first-child").children().eq(1).text(data.list[0].DOCNO);
     			    if(data.list[0].RSTATUS == 'WAIT') {
     			    	$("#tbl_modal tr:nth-child(2)").children().eq(2).text("");

     			    }else {
     			    	$("#tbl_modal tr:nth-child(2)").children().eq(2).text(data.list[0].SNAME);
     			    }
     			 	
     			   $("#tbl_modal tr:nth-child(2)").children().eq(1).text(data.list[0].DNAME);
     			   $("#tbl_modal tr:nth-child(3)").children().eq(1).text(data.list[0].MNAME);
     			   $("#tbl_modal tr:nth-child(4)").children().eq(1).text(data.list[0].RDATE);
     			   $("#tbl_modal tr:nth-child(5)").children().eq(1).text(data.list[0].SNAME);
     			   $("#tbl_modal tr:nth-child(6)").children().eq(1).text(data.list[0].RTITLE);
     			  $("#tbl_modal #content").find(".txtArea").text(data.list[0].CONTENT);
     		 	     
     			   $(".modal").fadeIn();
     	
 		   },
    		   error:function(data) {
    			   alert("?????????");
    			   
        		 }
        	
    		   });
	  }
   	    });
					//??????ajax???
    		 
     
  },
  error:function(data) {
	   alert("?????????");
	   
	 }
   
       });
    });
    
    //2??? ???
    
    
    	
    	//3. ?????????
       function paging(val) {
    	   var mno = $(".mno").val();
    	   var cate = $("#hide").val();
    	   var scurrentPage = val.text;
    	   
    	   console.log(scurrentPage);
    	   console.log(cate);
    	   console.log(mno);
    	   
    	   
    	   if(scurrentPage == '>') {
    		   scurrentPage = $("#lastPage").val();
    	   }else if(scurrentPage == '<') {
    		   scurrentPage = $("#firstPage").val();
    	   }
    	   
    	   console.log(scurrentPage);
    	   var cu = $(this);
    	   
    	   
    	   $.ajax({
    		   url:"docuFilter.ap",
    		   type:"get",
    		   data:{
    			   cate:cate,
    			   scurrentPage:scurrentPage,
    			   mno:mno
    			   
    			   
    		   },
    		   success:function(data) {
    			   var reportList = data.reportList;
    			   
    			   $tableBody = $(".tbl");
    			   $pagingArea = $("#pager_wrap").html('');
    			   
    			   
    			   
    			   $tableBody.find("tr:not(:first)").html('');
    			   
    			   
    			  
    			 	var item = data.reportList;
					var slistCount = data.pi.listCount;
					var scurrentPage = data.pi.currentPage;
					var smaxPage = data.pi.maxPage;
					var sstartPage = data.pi.startPage;
					var sendPage = data.pi.endPage;
					
					
					
					
						
				 	for(var i = 0; i < reportList.length; i++) {
				 		var $sumTr = $("<tr class='tbl_tit'>");
				 		var $ctr1 = "<input type='hidden' value='" + reportList[i].RPT_NO + "'>";
				 		var $ctr2 = "<td>" + reportList[i].RNUM + "</td>";
				 		var $ctr3 = "<td>" + reportList[i].RPTDATE + "</td>";
				 		var $ctr4 = "<td>" + reportList[i].RPTITLE + "</td>";
				 		var $ctr5 = "<td>" + reportList[i].RPTYPE + "</td>";
				 		var $ctr6 = "<td>" + reportList[i].MNAME + "</td>";
				 		if(reportList[i].RPSTATUS == "??????" || reportList[i].RPSTATUS == "??????") {
				 			var $ctr7 = "<td>" + reportList[i].RNAME + "</td>";
				 		}else {
				 			var $ctr7 = "<td></td>";
				 		}
				 		var $ctr8 = "<td>" + reportList[i].RPSTATUS + "</td>";
				 		
				 		
				 	
				 		 $sumTr.append($ctr1);
				 		$sumTr.append($ctr2);
				 		$sumTr.append($ctr3);
				 		$sumTr.append($ctr4);
				 		$sumTr.append($ctr5);
				 		$sumTr.append($ctr6);
				 		$sumTr.append($ctr7);
				 		$sumTr.append($ctr8);
				 		$tableBody.append($sumTr); 
				 		
				 		 
				 		
				 		
				 	}
				 	var $pageDiv = new Array();
				 	var $button = new Array();
				 	var $input2 = new Array();
				 	var $input10 = new Array();
				 	
				 	if(scurrentPage <= 1){
						$pageDiv1 = $("<li class='pager_com pager_arr prev on'>");
						$button1 = $("<a href='javascirpt: void(0);'>").text('<');
						$input4 = $("<input type='hidden' id='firstPage'>").val(scurrentPage-1);
						$pageDiv1.append($button1);
						$pageDiv1.append($input4);
						$pagingArea.append($pageDiv1);
					}else {
						$pageDiv1 = $("<li class='pager_com pager_arr prev '>");
						$button1 = $("<a href='#' onclick='paging(this);'}>").text('<');
						$input4 = $("<input type='hidden' id='firstPage'>").val(scurrentPage-1);
						$pageDiv1.append($button1);
						$pageDiv1.append($input4);
						$pagingArea.append($pageDiv1);
					} 
					
					for(var p=sstartPage; p<=sendPage; p++){
						
						if(p==scurrentPage){
							$pageDiv[p] = $("<li class='pager_com pager_num on'>");
							$button[p] = $("<a href='javascript: void(0);'>").text(p);
							//$input10[p] = $("<input type='hidden' id='hide2'>").val(p);
						} else{
							$pageDiv[p] = $("<li class='pager_com pager_num'>").val(p);
							$button[p] = $("<a href='#' onclick='paging(this);' value='p'>").text(p);
							$input2[p] = $("<input type='hidden' id='hide'>").val(cate);
							$input10[p] = $("<input type='hidden' id='hide2'>").val(p);
						}
						$pageDiv[p].append($button[p]);
						$pageDiv[p].append($button[p]).append($input2[p]).append($input10[p]);
						$pagingArea.append($pageDiv[p]);
					} 
					
					
					if(scurrentPage < smaxPage){
						$pageDiv2 = $("<li class='pager_com pager_arr next on'>");
						$button2 = $("<a href='#' onclick='paging(this);' value='p'>").text('>');
						$input3 = $("<input type='hidden' id='lastPage'>").val(p);
						$pageDiv2.append($button2);
						$pageDiv2.append($input3);
						$pagingArea.append($pageDiv2);
					}else {
						$pageDiv2 = $("<li class='pager_com pager_arr next on'>");
						$button2 = $("<a href='javascript: void(0);''>").text('>');
						$input3 = $("<input type='hidden' id='lastPage'>").val(p);
						$pageDiv2.append($button2);
						$pageDiv2.append($input3);
						$pagingArea.append($pageDiv2);
					}
					
					$(".tbl_tit").mouseenter(function(){
				          $(this).css({"background":"lightgray", "cursor":"pointer"})
				       }).mouseout(function(){
				          $(this).css({"background":"white"})
				       }).click(function(){
				    	   var rptNo = $(this).children().eq(0).val();
				    	   var type = $(this).children().eq(4).text();
				    	   console.log(type);	
						
									
									
						if(type == "?????? ?????????") {
						  $.ajax({
				  		   url:"allApproveModal.ap",
				  		   type:"get",
				  		   data:{
				  			   rptNo:rptNo,
				  			   type:type
				  		   },
				  		 success:function(data) {
				   			   var totalPrice = 0;
				   			   
				   			  $.each(data.list, function(index, list) {
				                    $('#tbl_modal_order .tempOrder').after("<tr class='repeatOrder'><td>"+list.ITYPE+"</td><td>" + list.CNAME + "</td><td>"+list.INAME+"</td><td>" + list.MFG +"</td><td>"+list.VOS + "</td><td>" + list.AMOUNT + "</td><td>"+list.VOS * list.AMOUNT+"</td></tr>");
				                	
				                    
				   			  });
				   			   
				   			   
				   			$("#tbl_modal_order tr:nth-child(4)").children().eq(3).text(data.list[0].REQDATE2);
				   			    $("#tbl_modal_order tr:first-child").children().eq(1).text(data.list[0].DOCNO);
				   			    if(data.list[0].RSTATUS == 'WAIT') {

				   			    }else {
				   			    	$("#tbl_modal_order tr").find("head").text(data.list[0].SNAME);
				   			    }
				   			    	$("#tbl_modal_order tr:nth-child(2)").children().eq(2).text(data.list[0].MNAME);
				   			 	
				   			   $("#tbl_modal_order tr:nth-child(2)").children().eq(1).text(data.list[0].DNAME);
				   			   $("#tbl_modal_order tr:nth-child(3)").children().eq(1).text(data.list[0].MNAME);
				   			   $("#tbl_modal_order tr:nth-child(4)").children().eq(1).text(data.list[0].RDATE);
				   			   $("#tbl_modal_order tr:nth-child(5)").children().eq(1).text(data.list[0].SNAME);
				   			   $("#tbl_modal_order tr:nth-child(6)").children().eq(1).text(data.list[0].RTITLE);
				   		 	     $("#tbl_modal_order #totalPrice").children().eq(1).text(data.list[0].TPRICE + "???");
				   		 	    // console.log(list.PRSN)
				   		 	   $("#tbl_modal_order #content_order").children().find(".txtArea").text(data.list[0].CONTENT);
				   		 	     
				   		 	    /* $("#tbl_modal tr:nth-child(i)").children().eq(0).text(list.RNUM);
					       			   $("#tbl_modal tr:nth-child(i)").children().eq(1).text(list.LCATEGORY);
					       			   $("#tbl_modal tr:nth-child(i)").children().eq(2).text(list.INAME);
					       			   $("#tbl_modal tr:nth-child(i)").children().eq(3).text(list.AMOUNT);
					       			   $("#tbl_modal tr:nth-child(i)").children().eq(4).text(list.VOS);
					       			   $("#tbl_modal tr:nth-child(i)").children().eq(5).text(list.UP + "???");
				   			   //$("#tbl_modal tr:nth-child(2)").text("asdasd"); */
				   			   //$("#tbl_modal").children().eq(3).text("asdasd"); 
				   			   $(".modal_order").fadeIn();
				   	
						   },
				  		 error:function(data) {
							   alert("?????????");
							   
				  		 }
						  });
						  
					  }else if(type == "?????? ?????????") {
						  $.ajax({
				     		   url:"allApproveModal.ap",
				     		   type:"get",
				     		   data:{
				     			   rptNo:rptNo,
				     			   type:type
				     		   },
				     		  success:function(data) {
				     			 console.log(data.list.RSTATUS)
		              			   var totalPrice = 0;
		              			    $("#tbl_modal_repair tr:first-child").children().eq(1).text(data.list[0].DOCNO);
		              			 	$("#tbl_modal_repair tr:nth-child(2)").children().eq(2).text(data.list[0].MNAME);
		              			 	if(data.list[0].RSTATUS == "APPR" || data.list[0].RSTATUS == "REJECT") {
		              			 	$("#tbl_modal_repair tr").find(".head").text(data.list[0].SNAME);
		              			 	}
		              			   $("#tbl_modal_repair tr:nth-child(2)").children().eq(1).text(data.list[0].DNAME);
		              			   $("#tbl_modal_repair tr:nth-child(3)").children().eq(1).text(data.list[0].MNAME);
		              			   $("#tbl_modal_repair tr:nth-child(4)").children().eq(1).text(data.list[0].RDATE);
		              			   $("#tbl_modal_repair tr:nth-child(5)").children().eq(1).text(data.list[0].SNAME);
		              			   $("#tbl_modal_repair tr:nth-child(6)").children().eq(1).text(data.list[0].RTITLE);
		              		 	      
		              			 $.each(data.list, function(index, list) {
		                             $('#tbl_modal_repair .repeatRepair').after("<tr class='repairTr'><td>"+list.RNUM+"</td><td>" + list.INO + "</td><td>"+list.INAME+"</td><td>" + list.CNAME +"</td><td>"+list.RPRICE + "</td><td>" + list.RSN + "</td></tr>");
		                         	
		                             
		            			  });
		              			   
		              			   
		              		 	     $("#tbl_modal_repair #totalPrice").text(data.list[0].TPRICE + "???");
		              		 	  $("#tbl_modal_repair #content_repair").find(".txtArea").text(data.list[0].CONTENT);
		              		 	     
		              			   $(".modal_repair").fadeIn();
		              	
		          		   },
				     		 error:function(data) {
							   alert("?????????");
							   
				     		 }
				  		  });
					  }else {
						  $.ajax({
				    		   url:"allApproveModal.ap",
				    		   type:"get",
				    		   data:{
				    			   rptNo:rptNo,
				    			   type:type
				    		   },
				    		   success:function(data) {
		             			   var totalPrice = 0;
		             			   
		             			  $.each(data.list, function(index, list) {
		                              $('#tbl_modal .temp').after("<tr class='repeat'><td>"+list.ITYPE+"</td><td>" + list.CNAME + "</td><td>"+list.INAME+"</td><td>" + list.MFG +"</td><td>"+list.VOS + "</td><td>" + list.AMOUNT + "</td><td>"+list.VOS * list.AMOUNT+"</td></tr>");
		                          	
		                              
		             			  });
		             			   
		             			   
		             			   
		             			    $("#tbl_modal tr:first-child").children().eq(1).text(data.list[0].DOCNO);
		             			    if(data.list[0].RSTATUS == 'WAIT') {
		             			    	$("#tbl_modal tr:nth-child(2)").children().eq(2).text("");

		             			    }else {
		             			    	$("#tbl_modal tr:nth-child(2)").children().eq(2).text(data.list[0].SNAME);
		             			    }
		             			 	
		             			   $("#tbl_modal tr:nth-child(2)").children().eq(1).text(data.list[0].DNAME);
		             			   $("#tbl_modal tr:nth-child(3)").children().eq(1).text(data.list[0].MNAME);
		             			   $("#tbl_modal tr:nth-child(4)").children().eq(1).text(data.list[0].RDATE);
		             			   $("#tbl_modal tr:nth-child(5)").children().eq(1).text(data.list[0].SNAME);
		             			   $("#tbl_modal tr:nth-child(6)").children().eq(1).text(data.list[0].RTITLE);
		             		 	     //$("#tbl_modal #totalPrice").children().eq(1).text(totalPrice + "???");
		             		 	    // console.log(list.PRSN)
		             		 	   $("#tbl_modal #content").find(".txtArea").text(data.list[0].CONTENT);
		             		 	     
		             			   $(".modal").fadeIn();
		             	
		         		   },
				    		   error:function(data) {
				    			   alert("?????????");
				    			   
				        		 }
				        	
				    		   });
					  }
				   	    });
					
					
					
					
    			   },
    		   
    		   error:function(data) {
    			   alert("??????");
    		   }
           });
    	   
    	   
    	   function paging(val) {
        	   var cate = $("#hide").val();
        	   //console.log(val.text);
        	   var scurrentPage = val.text;
     		   //console.log("?? : " + scurrentPage);
        	   
        	   //console.log("cuurent : " + scurrentPage);
        	   
        	   //var val2 = val.split();
    			//console.log(val2);
        	   //console.log(String(val));
        	   
        	   var cu = $(this);
        	   //console.log(cu)
        	   
        	   
        	   $.ajax({
        		   url:"docuFilter.ap",
        		   type:"get",
        		   data:{
        			   cate:cate,
        			   scurrentPage:scurrentPage
        			   
        			   
        		   },
        		   success:function(data) {
        			   var reportList = data.reportList;
        			   
        			   $tableBody = $(".tbl");
        			   $pagingArea = $("#pager_wrap").html('');
        			   
        			   
        			   
        			   $tableBody.find("tr:not(:first)").html('');
        			   
        			   
        			  
        			 	var item = data.reportList;
    					var slistCount = data.pi.listCount;
    					var scurrentPage = data.pi.currentPage;
    					var smaxPage = data.pi.maxPage;
    					var sstartPage = data.pi.startPage;
    					var sendPage = data.pi.endPage;
    					
    					/* console.log(slistCount);
    					console.log(scurrentPage);
    					console.log(smaxPage);
    					console.log(slistCount);
    					console.log(sstartPage);
    					console.log(sendPage); */
    					
    					
    					
    						
    				 	for(var i = 0; i < reportList.length; i++) {
    				 		var $sumTr = $("<tr class='tbl_tit'>");
    				 		var $ctr1 = "<input type='hidden' value='" + reportList[i].RPT_NO + "'>";
    				 		var $ctr2 = "<td>" + reportList[i].RNUM + "</td>";
    				 		var $ctr3 = "<td>" + reportList[i].RPTDATE + "</td>";
    				 		var $ctr4 = "<td>" + reportList[i].RPTITLE + "</td>";
    				 		var $ctr5 = "<td>" + reportList[i].RPTYPE + "</td>";
    				 		var $ctr6 = "<td>" + reportList[i].MNAME + "</td>";
    				 		if(reportList[i].RPSTATUS == "??????") {
    				 			var $ctr7 = "<td>" + reportList[i].SNAME + "</td>";
    				 		}else {
    				 			var $ctr7 = "<td></td>";
    				 		}
    				 		var $ctr8 = "<td>" + reportList[i].RPSTATUS + "</td>";
    				 		//var sumTd  = $ctr1.append($ctr2);
    				 		
    				 		
    				 	
    				 		/* $tableBody .append($ctr1);
    				 		$tableBody .append($ctr2);
    				 		$tableBody .append($ctr3);
    				 		$tableBody .append($ctr4);
    				 		$tableBody .append($ctr5);
    				 		$tableBody .append($ctr6); */
    				 		 $sumTr.append($ctr1);
    				 		$sumTr.append($ctr2);
    				 		$sumTr.append($ctr3);
    				 		$sumTr.append($ctr4);
    				 		$sumTr.append($ctr5);
    				 		$sumTr.append($ctr6);
    				 		$sumTr.append($ctr7);
    				 		$sumTr.append($ctr8);
    				 		$tableBody.append($sumTr); 
    				 		
    				 		 
    				 		
    				 		
    				 	//$tableBody.append($total );
    				 	}
    					
    					//3. ????????? ??????
    				 	var $pageDiv = new Array();
    				 	var $button = new Array();
    				 	var $input2 = new Array();
    				 	var $input10 = new Array();
    				 	
    				 	if(scurrentPage <= 1){
    						$pageDiv1 = $("<li class='pager_com pager_arr prev on'>");
    						$button1 = $("<a href='javascirpt: void(0);'>").text('<');
    						$pageDiv1.append($button1);
    						$pagingArea.append($pageDiv1);
    					}else {
    						$pageDiv1 = $("<li class='pager_com pager_arr prev '>");
    						$button1 = $("<a href='#' onclick='paging(this);'}>").text('<');
    						$pageDiv1.append($button1);
    						$pagingArea.append($pageDiv1);
    					} 
    					
    					for(var p=sstartPage; p<=sendPage; p++){
    						
    						if(p==scurrentPage){
    							$pageDiv[p] = $("<li class='pager_com pager_num on'>");
    							$button[p] = $("<a href='javascript: void(0);'>").text(p);
    							//$input10[p] = $("<input type='hidden' id='hide2'>").val(p);
    						} else{
    							$pageDiv[p] = $("<li class='pager_com pager_num'>").val(p);
    							$button[p] = $("<a href='#' onclick='paging(this);' value='p'>").text(p);
    							$input2[p] = $("<input type='hidden' id='hide'>").val(cate);
    							$input10[p] = $("<input type='hidden' id='hide2'>").val(p);
    						}
    						$pageDiv[p].append($button[p]);
    						$pageDiv[p].append($button[p]).append($input2[p]).append($input10[p]);
    						$pagingArea.append($pageDiv[p]);
    					} 
    					
    					
    					if(scurrentPage != smaxPage){
    						$pageDiv2 = $("<li class='pager_com pager_arr next on'>");
    						$button2 = $("<a href='#' onclick='paging(this);' value='p'>").text('>');
    						$input3 = $("<input type='hidden' id='lastPage'>").val(smaxPage);
    						$pageDiv2.append($button2);
    						$pageDiv2.append($input3);
    						$pagingArea.append($pageDiv2);
    					}else {
    						$pageDiv2 = $("<li class='pager_com pager_arr next on'>");
    						$button2 = $("<a href='javascript: void(0);''>").text('>');
    						$input3 = $("<input type='hidden' id='lastPage'>").val(smaxPage);
    						$pageDiv2.append($button2);
    						$pageDiv2.append($input3);
    						$pagingArea.append($pageDiv2);
    					}
    					
    					$(".tbl_tit").mouseenter(function(){
    				          $(this).css({"background":"lightgray", "cursor":"pointer"})
    				       }).mouseout(function(){
    				          $(this).css({"background":"white"})
    				       }).click(function(){
    				    	   var rptNo = $(this).children().eq(0).val();
    				    	   var type = $(this).children().eq(4).text();
    				    	   console.log(type);	
    						
    									
    									
    						if(type == "?????? ?????????") {
    						  $.ajax({
    				  		   url:"allApproveModal.ap",
    				  		   type:"get",
    				  		   data:{
    				  			   rptNo:rptNo,
    				  			   type:type
    				  		   },
    				  		 success:function(data) {
    				   			   var totalPrice = 0;
    				   			   
    				   			  $.each(data.list, function(index, list) {
    				                    $('#tbl_modal_order .tempOrder').after("<tr class='repeatOrder'><td>"+list.ITYPE+"</td><td>" + list.CNAME + "</td><td>"+list.INAME+"</td><td>" + list.MFG +"</td><td>"+list.VOS + "</td><td>" + list.AMOUNT + "</td><td>"+list.VOS * list.AMOUNT+"</td></tr>");
    				                	
    				                    
    				   			  });
    				   			   
    				   			   
    				   			$("#tbl_modal_order tr:nth-child(4)").children().eq(3).text(data.list[0].REQDATE2);
    				   			    $("#tbl_modal_order tr:first-child").children().eq(1).text(data.list[0].DOCNO);
    				   			    if(data.list[0].RSTATUS == 'WAIT') {

    				   			    }else {
    				   			    	$("#tbl_modal_order tr").find(".head").text(data.list[0].SNAME);
    				   			    }
    				   			    	$("#tbl_modal_order tr:nth-child(2)").children().eq(2).text(data.list[0].MNAME);
    				   			 	
    				   			    //$("#tbl_modal tr:nth-child(2)").children().eq(2).text(list.SNAME);
    				   			   $("#tbl_modal_order tr:nth-child(2)").children().eq(1).text(data.list[0].DNAME);
    				   			   $("#tbl_modal_order tr:nth-child(3)").children().eq(1).text(data.list[0].MNAME);
    				   			   $("#tbl_modal_order tr:nth-child(4)").children().eq(1).text(data.list[0].RDATE);
    				   			   $("#tbl_modal_order tr:nth-child(5)").children().eq(1).text(data.list[0].SNAME);
    				   			   $("#tbl_modal_order tr:nth-child(6)").children().eq(1).text(data.list[0].RTITLE);
    				   		 	     $("#tbl_modal_order #totalPrice").children().eq(1).text(data.list[0].TPRICE + "???");
    				   		 	    // console.log(list.PRSN)
    				   		 	    $("#tbl_modal_order #content_order").children().find(".txtArea").text(data.list[0].CONTENT);
    				   		 	     
    				   			   $(".modal_order").fadeIn();
    				   	
    						   },
    				  		 error:function(data) {
    							   alert("?????????");
    							   
    				  		 }
    						  });
    						  
    					  }else if(type == "?????? ?????????") {
    						  $.ajax({
    				     		   url:"allApproveModal.ap",
    				     		   type:"get",
    				     		   data:{
    				     			   rptNo:rptNo,
    				     			   type:type
    				     		   },
    				     		  success:function(data) {
    				     			 console.log(data.list.RSTATUS)
    		              			   var totalPrice = 0;
    		              			    $("#tbl_modal_repair tr:first-child").children().eq(1).text(data.list[0].DOCNO);
    		              			 	$("#tbl_modal_repair tr:nth-child(2)").children().eq(2).text(data.list[0].MNAME);
    		              			 	if(data.list[0].RSTATUS == "APPR" || data.list[0].RSTATUS == "REJECT") {
    		              			 	$("#tbl_modal_repair tr").find(".head").text(data.list[0].SNAME);
    		              			 	}
    		              			    //$("#tbl_modal tr:nth-child(2)").children().eq(2).text(list.SNAME);
    		              			   $("#tbl_modal_repair tr:nth-child(2)").children().eq(1).text(data.list[0].DNAME);
    		              			   $("#tbl_modal_repair tr:nth-child(3)").children().eq(1).text(data.list[0].MNAME);
    		              			   $("#tbl_modal_repair tr:nth-child(4)").children().eq(1).text(data.list[0].RDATE);
    		              			   $("#tbl_modal_repair tr:nth-child(5)").children().eq(1).text(data.list[0].SNAME);
    		              			   $("#tbl_modal_repair tr:nth-child(6)").children().eq(1).text(data.list[0].RTITLE);
    		              		 	      
    		              			 $.each(data.list, function(index, list) {
    		                             $('#tbl_modal_repair .repeatRepair').after("<tr class='repairTr'><td>"+list.RNUM+"</td><td>" + list.INO + "</td><td>"+list.INAME+"</td><td>" + list.CNAME +"</td><td>"+list.RPRICE + "</td><td>" + list.RSN + "</td></tr>");
    		                         	
    		                             
    		            			  });
    		              		 	     $("#tbl_modal_repair #totalPrice").text(data.list[0].TPRICE + "???");
    		              		 	  $("#tbl_modal_repair #content_repair").find(".txtArea").text(data.list[0].CONTENT);
    		              		 	     
    		              			   $(".modal_repair").fadeIn();
    		              	
    		          		   },
    				     		 error:function(data) {
    							   alert("?????????");
    							   
    				     		 }
    				  		  });
    					  }else {
    						  $.ajax({
    				    		   url:"allApproveModal.ap",
    				    		   type:"get",
    				    		   data:{
    				    			   rptNo:rptNo,
    				    			   type:type
    				    		   },
    				    		   success:function(data) {
    		             			   var totalPrice = 0;
    		             			   
    		             			  $.each(data.list, function(index, list) {
    		                              $('#tbl_modal .temp').after("<tr class='repeat'><td>"+list.ITYPE+"</td><td>" + list.CNAME + "</td><td>"+list.INAME+"</td><td>" + list.MFG +"</td><td>"+list.VOS + "</td><td>" + list.AMOUNT + "</td><td>"+list.VOS * list.AMOUNT+"</td></tr>");
    		                          	
    		                              
    		             			  });
    		             			   
    		             			   
    		             			   
    		             			    $("#tbl_modal tr:first-child").children().eq(1).text(data.list[0].DOCNO);
    		             			    if(data.list[0].RSTATUS == 'WAIT') {
    		             			    	$("#tbl_modal tr:nth-child(2)").children().eq(2).text("");

    		             			    }else {
    		             			    	$("#tbl_modal tr:nth-child(2)").children().eq(2).text(data.list[0].SNAME);
    		             			    }
    		             			 	
    		             			   $("#tbl_modal tr:nth-child(2)").children().eq(1).text(data.list[0].DNAME);
    		             			   $("#tbl_modal tr:nth-child(3)").children().eq(1).text(data.list[0].MNAME);
    		             			   $("#tbl_modal tr:nth-child(4)").children().eq(1).text(data.list[0].RDATE);
    		             			   $("#tbl_modal tr:nth-child(5)").children().eq(1).text(data.list[0].SNAME);
    		             			   $("#tbl_modal tr:nth-child(6)").children().eq(1).text(data.list[0].RTITLE);
    		             			  $("#tbl_modal #content").find(".txtArea").text(data.list[0].CONTENT);
    		             		 	     
    		             			   $(".modal").fadeIn();
    		             	
    		         		   },
    				    		   error:function(data) {
    				    			   alert("?????????");
    				    			   
    				        		 }
    				        	
    				    		   });
    					  }
    				   	    });
    					
    					
    					
    					
        			   },
        		   
        		   error:function(data) {
        			   alert("??????");
        		   }
               }); 
    	   
    	   
       }
      }
      
   
      
      
      
   </script>

</body>
</html>