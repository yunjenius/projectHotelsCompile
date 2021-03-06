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
	width:85.1%;
	height: 83px; 
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
	#searchZone{
	
	}
	#stockTb{
	width:1000px;
	height: 358px;
	border-collapse: collapse;
	border: 1px solid lightgray;
	}
	td,th{
		border: 1px solid lightgray;
		text-align: center;
	}
	th{
	background-color: #f7f7f7;
	color: #005B9E;
	}

	
	#hrDiv{
	border-bottom: 1px solid lightgray;
	width: 1000px;
	
	}
	
	  	
	.btns{
 	display: inline-block;
	}
	.tabClass{
	display: inline-block;
	width: 120px;
	height: 30px;
	border: 1px solid gray;
	border-radius: 10px 10px 0px 0px;
	border-bottom: none;
	font-weight: bold;
	margin-top: 20px;

	}
	#rclass{
	background-color: lightgray; 
	}
	#sbtn{
	color:white;
	background : #3498DB;
	border: 1px solid #3498DB;
	box-sizing: border-box;
	}
 
	<!-- -->
	
#myTab{
	line-height: 30px;
	}
	#mailText:hover{
	cursor: pointer;
	background-color: #3498DB;
	color: white;
	} 
	#mailtText{              
	color: #3498DB;
	}
	#mailSet:hover{
	cursor: pointer;
	}
	.tabb{
	display: inline-block;
	width: 80px;
	height: 31px;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 10px;
	}
	
	#filter{
	background: #FFFFFF;
	border: 1px solid #919191;
	box-sizing: border-box;
	}
#news{
	color:white;
	background : #3498DB;
	border: 1px solid #3498DB;
	width: 68px;
	height: 25px;
	font-weight: bold;
	border-radius: 2px;
	    margin-left: 933px;
    margin-top: 11px;
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
}
#mainMsg{ 
	font-size: 25px;
	font-weight: bold;
}

.pagingArea{
	text-align:center;
	margin-left:300px;
}
#pager_wrap {
	padding: 50px 0;  
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
#addCategorys{
	color:white;
	background : #3498DB;
	border: 1px solid #3498DB;
	width: 85px;
	height: 25px;
	font-weight: bold;
    box-sizing: border-box;
}
#addCategorys:hover{
cursor: pointer;
}
#searchForm{
    position: relative;
    left: 90px;
    bottom: 23px;
}
</style>
</head>
<body>
	

	<header>	
		<jsp:include page="../../common/menubar.jsp"/>
		<jsp:include page="../../common/productMenubar.jsp"/>
		
		<jsp:include page="../modal/mStockNowDetail.jsp"/>
		<jsp:include page="../modal/mStockNowAdd.jsp"/>
		<jsp:include page="../modal/mStockNowEnroll.jsp"/>
		
	</header>
	<section>
		
		<!-- <div class="tabClass" id="tclass" align="center">????????????
		</div>
		<div class="tabClass" id="rclass" align="center">????????????
		</div> -->
		
		<!-- ?????? -->
	<div>
		<div id="myTab">
			<div class="tabb" style="background-color: #3498DB; color: white;box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);" id="mailSet">????????????</div>
			<div class="tabb" style="margin-left: 10px;box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);" id="mailText">????????????</div>
			<div id="hrDiv" style="background-color: lightgray; color: lightgray"></div>
		</div>
	</div>
		<!--  -->
		<div id="hidden">
		</div>
	<div class="top-div">
			<div id="titlemsg"><label id="mainMsg">????????????</label></div>
		<div id="searchZone">
			<div class="btns"><button id="addCategorys">????????????</button></div>
	<form action="searchItem.sto" method="post" id="searchForm">
			<select style="margin-left:615px;   width:80px;height:25px;" id="filter" class="searchOption" >
				<option value="iname" selected="selected">?????????</option> 
			</select>
			<input type="text" name="searchValue"  class="searchCondition" style="height: 20px;width: 150px;"> 
			<button class="searchCondition" style="width: 50px; height: 25px; width: 56px;" id="sbtn" onclick="return search();">??????</button>
	</form>
		</div>
	</div><!-- top div end -->
		<div id="stockTb">
			<table style="border-collapse: collapse; width: 100%;">  
				<tr>  
					<th class="checkTb" style="width: 30px;"><input type="checkbox"  id="allCheck"></th>
					<th width="250px;">?????????</th>
					<th style="width: 100px">????????????</th>
					<th style="width: 100px">????????????</th>
				</tr>
				<c:forEach var="i" items="${stockList }">
				<tbody class="stockTbody">
					<tr>
						<td class="checkTb"><input type="checkbox"></td>
						<td style="color: #005B9E"><c:out value="${i.iName}"/></td>
						<td><c:out value="${i.cnt }"/></td>
						<td><c:out value="${i.type }"/></td>
					</tr>
				</tbody>
				</c:forEach>
			</table>
		</div>

			<div class="btns">
			<button id="news">??????</button>&nbsp;
			</div>
	
	<!-- ddddddddddddddddddddddddddd  -->
	
	
	<!-- ????????? ?????? -->
			<!-- ????????? ?????? ?????? -->
			<c:if test="${ empty check }">
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
		</c:if>
			
			
 		<c:if test="${ !empty check }">
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
							<c:param name="searchContent" value="${ sessionScope.searchContent }"/>
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
								<c:param name="searchContent" value="${ sessionScope.searchContent }"/>
								
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
							<c:param name="searchContent" value="${ sessionScope.searchContent }"/>
						</c:url>
						<li class="pager_com pager_arr next"><a href="${blistEnd }">&#x003E;</a></li>
					</c:if>
				</ul>
			</div>
		</c:if>
			<!-- ????????? ?????? ?????? -->
	
	</section>
	
	<script>
		//????????????
		
		$("#addCategorys").click(function(){
			console.log("??????????????????");
			console.log($(".modalDetailAdd").fadeIn());
			$("#mselect").attr('disabled',true);
			$("#sselect").attr('disabled',true); 
			console.log($("#lselect").val());
			//
			category();
		});
		</script>
		<script>
	
		//?????????
		$(function(){
			$("#stockTb").find("td:not(.checkTb)").mouseenter(function(){
				$(this).parent("tr").css({"background":"lightgray","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent("tr").css({"background":"white"});
			}).click(function(){
				
				var iName = $(this).parent().children("td").eq(1).text();
				
				$.ajax({
					url:"selectStockDetail.sto",
					type:"post",
					data:{iName:iName},
					success:function(data){
						console.log(data);
						console.log("//////////////");
						$("#stockTbb").empty();
						$("#stockTbb").append("<tbody id='detailBody'></tbody>")
						if(data.stockDetailList[0].type=="EQUIP"){
							$("#detailBody").append("<tr><th class='hide'><input type='checkbox' id='checkDetail'></th><th>????????????</th><th>?????????</th><th hidden='hidden'>????????????</th>"+
							"<th>????????????</th><th>?????????</th><th>??????</th><th>?????????</th><th>?????????</th><th>?????????</th><th>??????</th><th>????????????</th></tr>")
						}else{
							$("#detailBody").append("<tr><th class='hide'><input type='checkbox' id='checkDetail'></th><th>????????????</th><th>?????????</th><th>????????????</th>"+
						"<th>????????????</th><th>?????????</th><th>??????</th><th>?????????</th><th>?????????</th><th>?????????</th><th style='width:100px;'>??????</th><th>????????????</th></tr>")
						}	
						for(var i=0;i<data.stockDetailList.length;i++){
							var ino = data.stockDetailList[i].ino;
							console.log("../////");
							console.log(data);
									
							if(data.stockDetailList[0].type=="EQUIP"){
								
							$("#detailBody").append( 
									"<tr><td class='hide'><input type='checkbox' name='checkRow'></td><td>"+
									data.stockDetailList[i].ino+"</td><td>"+data.stockDetailList[i].iName+"</td><td hidden='hidden'>"+
									data.stockDetailList[i].amount+"</td><td>"+
									data.stockDetailList[i].vos+"</td><td>"+data.stockDetailList[i].vat+"</td><td>"+
									data.stockDetailList[i].up+"</td><td>"+data.stockDetailList[i].mfg+"</td><td id='xcnName"+ino+"'>"+
									data.stockDetailList[i].cnName+"<input type='text' value='"+data.stockDetailList[i].cnCode+"' hidden='hidden' id='cnCode"+data.stockDetailList[i].ino+"'></td><td id='xstrgName"+ino+"'>"+data.stockDetailList[i].strgName+"</td><td>"+
									data.stockDetailList[i].areaName+"</td><td id='xrmNum"+ino+"'>"+data.stockDetailList[i].rmNum+"</td><td hidden='hidden'>"+
									"<input type='text' id='zino"+ino+"' name='ino' value='"+data.stockDetailList[i].ino+"'>"+
									"<input type='text' id='ziName"+ino+"' name='iname' value='"+data.stockDetailList[i].iname+"'>"+
									"<input type='text' id='zamount"+ino+"' name='amount' value='"+data.stockDetailList[i].amount+"'>"+
									"<input type='text' id='zvos"+ino+"' name='vos' value='"+data.stockDetailList[i].vos+"'>"+
									"<input type='text' id='zvat"+ino+"' name='vat' value='"+data.stockDetailList[i].vat+"'>"+
									"<input type='text' id='zup"+ino+"' name='up' value='"+data.stockDetailList[i].up+"'>"+
									"<input type='text' id='zmfg"+ino+"' name='mfg' value='"+data.stockDetailList[i].mfg+"'>"+
									"<input type='text' id='zcnName"+ino+"' name='cnName' value='"+data.stockDetailList[i].cnName+"'>"+
									"<input type='text' id='zcnCode"+ino+"' name='cnCode' value='"+data.stockDetailList[i].cnCode+"'>"+
									"<input type='text' id='zareaName"+ino+"' name='areaName' value='"+data.stockDetailList[i].areaName+"'>"+
									"<input type='text' id='zareaNo"+ino+"' name='areaNo' value='"+data.stockDetailList[i].areaNo+"'>"+
									"<input type='text' id='zstrgNo"+ino+"' name='strgNo' value='"+data.stockDetailList[i].strgNo+"'>"+
									"<input type='text' id='zrmNo"+ino+"' name='rmNo' value='"+data.stockDetailList[i].rmNo+"'>"+"</td></tr>"
									
							);
							console.log("ffffff");
							console.log(data.stockDetailList[0].rmNo);
							console.log(data.stockDetailList[i].rmNo);
							
							}else{
								$("#detailBody").append( 
										"<tr><td class='hide'><input type='checkbox' name='checkRow'></td><td>"+
										data.stockDetailList[i].ino+"</td><td>"+data.stockDetailList[i].iName+"</td><td>"+
										data.stockDetailList[i].amount+"</td><td>"+
										data.stockDetailList[i].vos+"</td><td>"+data.stockDetailList[i].vat+"</td><td>"+
										data.stockDetailList[i].up+"</td><td>"+data.stockDetailList[i].mfg+"</td><td id='xcnName"+ino+"'>"+
										data.stockDetailList[i].cnName+"<input type='text' value='"+data.stockDetailList[i].cnCode+"' hidden='hidden' id='cnCode"+data.stockDetailList[i].ino+"'></td><td id='xstrgName"+ino+"'>"+data.stockDetailList[i].strgName+"</td><td>"+
										data.stockDetailList[i].areaName+"</td><td id='xrmNum"+ino+"'>"+data.stockDetailList[i].rmNum+"</td><td hidden='hidden'>"+
										"<input type='text' id='zino"+ino+"' name='ino' value='"+data.stockDetailList[i].ino+"'>"+
										"<input type='text' id='ziName"+ino+"' name='iname' value='"+data.stockDetailList[i].iname+"'>"+
										"<input type='text' id='zamount"+ino+"' name='amount' value='"+data.stockDetailList[i].amount+"'>"+
										"<input type='text' id='zvos"+ino+"' name='vos' value='"+data.stockDetailList[i].vos+"'>"+
										"<input type='text' id='zvat"+ino+"' name='vat' value='"+data.stockDetailList[i].vat+"'>"+
										"<input type='text' id='zup"+ino+"' name='up' value='"+data.stockDetailList[i].up+"'>"+
										"<input type='text' id='zmfg"+ino+"' name='mfg' value='"+data.stockDetailList[i].mfg+"'>"+
										"<input type='text' id='zcnName"+ino+"' name='cnName' value='"+data.stockDetailList[i].cnName+"'>"+
										"<input type='text' id='zcnCode"+ino+"' name='cnCode' value='"+data.stockDetailList[i].cnCode+"'>"+
										"<input type='text' id='zareaName"+ino+"' name='areaName' value='"+data.stockDetailList[i].areaName+"'>"+
										"<input type='text' id='zareaNo"+ino+"' name='areaNo' value='"+data.stockDetailList[i].areaNo+"'>"+
										"<input type='text' id='zstrgNo"+ino+"' name='strgNo' value='"+data.stockDetailList[i].strgNo+"'>"+
										"<input type='text' id='zrmNo"+ino+"' name='rmNo' value='"+data.stockDetailList[i].rmNo+"'>"+"</td></tr>"
										
								);
							}
						
							if(data.stockDetailList[i].rmNo=='0'){
								$("#xrmNo"+ino+"").text("-");
							}
							if(data.stockDetailList[i].strgName==""){
								data.stockDetailList[i].strgName="-";
							}
							if(data.stockDetailList[i].areaName==""){
								data.stockDetailList[i].areaName="-";
							}
							//???????????????????????????
							
							$("#checkDetail").change(function(){
					            if($(this).prop("checked")) {
					               $("#detailBody").find("input[type=checkbox]").prop("checked", true);
					            } else {
					            	console.log("?asdasdasd")
					               $("#detailBody").find("input[type=checkbox]").prop("checked", false);
					            }
					         });
							
					         $("#detailBody").find("input[type=checkbox]").change(function(){
					            if($(this).prop("checked") == false) {
					               $("#checkDetail").prop("checked", false);
					            }
					         });
					         
				
					         
						}
					
					},error:function(status){
						console.log(status)
					}
					
				});
				
				$(".modal").fadeIn();
			});
		});
		

		
		//???????????????
		$("#mailText").click(function(){
			location.href='selectRepair.sto';
		})
		
		
		//??????????????????
		$("#allCheck").change(function(){
            if($(this).prop("checked")) {
               $(".stockTbody").find("input[type=checkbox]").prop("checked", true);
            } else {
               $(".stockTbody").find("input[type=checkbox]").prop("checked", false);
            }
         });
		
         $(".stockTbody").find("input[type=checkbox]").change(function(){
            if($(this).prop("checked") == false) {
               $("#allCheck").prop("checked", false);
            }
         });
		
		
		////?????????????????? ajax
		function category(){
			
			$.ajax({
				url:"selectCategory.sto",
				type:"post",
				data:{
					mcategory:$("#mselect").val(),
					lcategory:$("#lselect").val()
					},
				success:function(data){
					console.log(data)
					
					//??????????????? ?????????
					if(data.categoryList[0].lCategory==""){
					}else{
						for(var i=0;i<data.categoryList.length;i++){
							$("#lselect").append("<option value='"+data.categoryList[i].lCategory+"'>"+data.categoryList[i].lCategory+"</option>")
						}
					}
					
					//??????????????? ?????????
					if(data.categoryList[0].mCategory==""){
					}else{
						$("#mselect").empty();
						$("#mselect").append("<option hidden='hidden'>?????????</option><option value='select'>????????????</option>")
						for(var i=0;i<data.categoryList.length;i++){
							$("#mselect").append("<option value='"+data.categoryList[i].mCategory+"'>"+data.categoryList[i].mCategory+"</option>")
						}
					}
					
				
					
				},error:function(status){
					console.log(status)
				}
				
			});
		};
		
		//???????????????????????? 
		$("#news").click(function(){
			$(".modalEnroll").fadeIn();
			//sCategory ajax
				$.ajax({
				url:"selectScategory.sto",
				type:"post",
				data:{},
				success:function(data){
					console.log(data);
					console.log(data.sCategoryList.sCategory);
					$("#sCategoryFilter").empty();
					$("#sCategoryFilter").append("<option hidden='hidden'>????????????</option>");
					
					for(var i=0;i<data.sCategoryList.length;i++){
						$("#sCategoryFilter").append("<option value='"+data.sCategoryList[i].typeNo+"'>"+data.sCategoryList[i].sCategory+"</option>");
					}
					
				},
				error:function(status){
					console.log(status)
				}
			})
			
		}); 
		
		
		//
		
		
		
	</script>
	<script>
		function search(){
			if($(".searchValue").val()==""){
				return false;
			}
			return true;
		}
		
		
	</script>
	
	
	
</body>
</html>
