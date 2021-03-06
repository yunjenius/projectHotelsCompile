<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
	#reno{
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
	margin-left: 70%;
	} 
	#purDivv{
	height: 425.7px;
	border: 1px solid lightgray;
	width: 1100px;
	margin-top: 2px;
	}
	#line{
		width: 120px;
		border-bottom: 1px solid black;
	}
.pagingArea{
	text-align:center;
	margin-left:300px;
}
#pager_wrap {
	padding: 38px 0;
	text-align: center;
	margin-top: -45px;
	    margin-right: 206px;
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
a{
	color:black;
	text-decoration:none;
}
#acTbody2 td input[type=text]{
width: 150px;
}
.label:hover{
cursor: pointer;
}
</style>
</head>
<body>
	
<header>	
	<jsp:include page="../../common/menubar.jsp"/>
	<jsp:include page="../../common/productMenubar.jsp"/>
	 <jsp:include page="../modal/mAccountDetail.jsp"/> 
	 <jsp:include page="../modal/mAccountDetailEnroll.jsp"/> 
	 <jsp:include page="../modal/mAccountEnroll.jsp"/> 
</header>
	<section id="sbody">

		<div class="top-div">
		<div id="titlemsg"><h1>???????????????</h1></div>
		<div id=line></div>
		<div id="searchZone" style="width: 1000px;"> 
		<div style="width: 1146px;">
			<select class="searchCondition"  id="purSearch" style="margin-left:70.5% ; height: 26px;">
				<option value="default" hidden="hidden">????????????</option>
				<option value="acName">????????????</option>
				<option value="acStock">????????????</option>
			</select>
		<input type="text" name="serachCondition" class="searchCondition" style=";height: 20px;width: 150px; border: 1px solid gray">
		<button class="searchCondition" id="searchBtn" style="width: 56px;">??????</button>
		</div>
		
		</div>
		</div><!-- top div end -->
		
	<div id="purDivv">
	<table id="Table">
			<tr>
				<th><input type="checkBox" id="allCheck"></th>
				<th>???????????????</th>
				<th>????????????</th>
				<th>????????????</th>
				<th>?????????</th>
				<th>????????????</th>
				<th>????????????</th>
				<th style="width:40px;">????????????</th>
				<th style="width:80px;">????????????</th> 
				<th style="width:300px;">??????</th>
			</tr>
			<c:forEach var="i" items="${accountList}">
			<tbody class="accTbody">
			<tr>
				<td class="checkTd"><input type="checkBox" name="checkRow"></td>
				<td><c:out value="${i.cnCode }"/></td>
				<td><c:out value="${i.cnName }"/></td>
				<td><c:out value="${i.ownerName}"/></td>
				<td><c:out value="${i.cnManager}"/></td>
				<td><c:out value="${i.cnPhone }"/></td>
				<td><c:out value="${i.cnItem }"/></td>
				<td><c:out value="${i.cnStatus }"/></td>
				<td class="checkCn"><label style="color:#005B9E;" class="label">
				<c:if test="${i.account==null}">?????????</c:if>
				<c:if test="${i.account!=null}">??????</c:if>
				</label></td>
				<td><c:out value="${i.cnAdd }" /></td>
			</tr>  
			</tbody>
			</c:forEach>
		</table>

	</div><!-- purDivv end -->
	<div class="btns"><button id="reno" style="width: 125px;font-weight: bold;">????????????/?????????</button>&nbsp;<button id="print">??????</button></div>

<!-- ????????? ?????? -->
			<!-- ????????? ?????? ?????? -->
			<div id="pager_wrap" align="center">
				<ul class="pager_cnt clearfix add">
					<c:if test="${pi.currentPage <= 1 }">
						<li class="pager_com pager_arr prev on"><a
							href="javascirpt: void(0);">&#x003C;</a></li>
					</c:if>
					<c:if test="${pi.currentPage > 1 }">
						<c:url var="blistBack" value="selectAccount.ac">
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

							<c:url var="blistCheck" value="selectAccount.ac">
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
						<c:url var="blistEnd" value="selectAccount.ac">
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
		$("#Table").find("td:not(.checkTd)").mouseenter(function(){
			$(this).parent("tr").css({"background":"lightgray"});
		}).mouseout(function(){
			$(this).parent("tr").css({"background":"white"});
		}).click(function(){
			var cnCode = $(this).parent().children("td").eq(1).text();
			if( $(this).parent().children("td").eq(7).text()=='N'){
				return false;
			}
			$(".modal").fadeIn();
			console.log("cnCOde : " + cnCode)
			$("#cnCodee").val(cnCode);
			////????????????ajax/////
				$.ajax({
					url:"selectDetail.ac",
					type:"post",
					data:{cnCode:cnCode},
					success:function(data){
						console.log(data);
						$("#acTbody").empty();
						if(data.accDetailList !=''){
						for(var i=0;i<data.accDetailList.length;i++){
							console.log("aaa"+cnCode);
						$("#acTbody").append("<tr><td hidden='hidden'><input type='text' id='cnCoder' value='"+cnCode+"' name='cnCode'></td><td>"+data.accDetailList[i].bankName+
								"</td><td>"+data.accDetailList[i].account+"</td><td>"+data.accDetailList[i].accName+
								"</td><td>"+data.accDetailList[i].accMemo+"</td></tr>");
						}
						//$("#cnCoder").val(cnCode);
						$("#newac2").show();
						$("#newac").hide();
						
						
					}else{
						$("#acTbody").append("<tr><td hidden='hidden'><input type='text' id='cnCoder' value='"+cnCode+"' name='cnCode'></td></tr>")
						$("#newac2").hide();
						$("#newac").show();
					//	$("#cnCoder").val(cnCode);
					}
						
						
						
					},
					error:function(status){
						console.log(status);
					}
					
					
				})
			//////////
		});
	});
	
	$("#mState").click(function(){
		$(".modalState").fadeIn();
	});
	
	///
	function makeid()
{
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

    for( var i=0; i < 8; i++ )
        text += possible.charAt(Math.floor(Math.random() * possible.length));

    return text;
}
	//
	
	$("#print").click(function(){
		$("#cnCode").val(makeid());
		$(".modalEnroll").fadeIn();
	});
	
	
	///??????????????????!!//
	$("#newac").click(function(){
		$(".modalz").fadeIn();
		$("#sendCnCode").val($("#cnCoder").val());
		console.log($("#cnCoder").val()+"fkfkfkfk")
	})
	//??????????????????????????? ????????????//
	$("#newac2").click(function(){
		$("#acTbody2").empty();
		$("#newac2").hide();
		$(".btnss2").show();
		$("#acTbody").hide();
		$("#acTbody2").show();
		var cnCodez = $("#cnCoder").val();
		console.log(cnCodez);
	
		$("#acTbody2").append("<tr><td hidden='hidden'><input type='text' id='cnCodex'></td><td>"+
				"<select id='bankName' name='bankName'>"+
				"<option value='????????????'>????????????</option>"+
				"<option value='????????????'>????????????</option>"+
				"<option value='????????????'>????????????</option>"+
				"<option value='??????'>??????</option>"+
				"<option value='??????'>??????</option>"+
				"<option value='????????????'>????????????</option>"+
				"<option value='????????????'>????????????</option>"+
				"<option value='????????????'>????????????</option>"+
				"<option value='????????????'>????????????</option>"+
				"<option value='????????????'>????????????</option>"+
				"<option value='????????????'>????????????</option>"+
				"<option value='????????????'>????????????</option>"+
				"<option value='????????????'>????????????</option>"+
				"<option value='????????????'>????????????</option>"+
				"<option value='???????????????'>???????????????</option>"+
				"<option value='??????'>??????</option>"+
				"<option value='?????????'>?????????</option>"+
				"<option value='????????????'>????????????</option>"+
				"<option value='????????????'>????????????</option>"+
			"</select>"+
		"</td><td><input type='text' id='account' name='account'></td><td><input type='text' id='accName' name='accName'></td><td><input type='text' id='accMemo' name='accMemo'></td></tr>")
		//??????????????????ajax
		/* $.ajax({
			url:"updateDetail.ac",
			type:"post",
			data:{
				cnCode:cnCodez,
				bankName:$("#bankName").val(),
				account:$("#account").val(),
				accName:$("#accName").val(),
				accMemo:$("#accMemo").val()
			},
			success:function(data){
				console.log(data);
			},
			error:function(status){
				console.log(status);
			}
		}); */
		////////////
	})
	
	//////????????????????????? ????????????
	$("#cancel").click(function(){
		$("#acTbody").show();
		$("#acTbody2").hide();
		$("#newac2").show();
		$(".btnss2").hide();
	});
	//
	
	$("#ok").click(function(){
		
		$("#updateDetail").submit();
		console.log("////////////////////");
		console.log($("#cnCodee").val())
		console.log($("#cnCoder").val())
		$("#cnCodex").val($("#cnCoder").val());
		
	})
	
	//??????????????????
		$("#allCheck").change(function(){
            if($(this).prop("checked")) {
               $(".accTbody").find("input[type=checkbox]").prop("checked", true);
            } else {
               $(".accTbody").find("input[type=checkbox]").prop("checked", false);
            }
         });
		
         $(".accTbody").find("input[type=checkbox]").change(function(){
            if($(this).prop("checked") == false) {
               $("#allCheck").prop("checked", false);
            }
         });
		
         $("#reno").click(function(){
        	 var checkRow = "";
        	 var status = "";
			  $( "input[name='checkRow']:checked" ).each(function(){
			    checkRow = checkRow + $(this).parent().parent().children("td").eq(1).text()+"," ;
			   status =status +  $(this).parent().parent().children("td").eq(7).text()+"," ;
			  });
			  
			  checkRow = checkRow.substring(0,checkRow.lastIndexOf(",")); //?????? ?????? ?????????
			  status = status.substring(0,status.lastIndexOf(",")); //?????? ?????? ?????????
			  
				console.log(checkRow); 
			    console.log(status);
			  /////////////
			  $.ajax({
				  url:"updateAcc.ac",
				  type:"post",
				  data:{
					   checkRow:checkRow,
					   check:status
					   },
				  success:function(data){
					  console.log(data);
					  alert("?????????????????????.")
					  location.reload(true);
				  },
				  error:function(status){
					  console.log(status);
				  }
			  })
			  ///////////////
         });
         
	</script>
	
	
</body>
</html>