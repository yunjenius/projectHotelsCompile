<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelsCompile</title>
<style type="text/css">
	body{
		overflow-x:hidden;
		overflow-y:hidden;
	}
	.menubar{
		height:900px;
	}
	.contentArea{
		width:1600px;
		height:900px;
	}
	.Area5{
		font-weight: bold;
	}
	.rightArea{
		float:right;
		width:1300px;
	}
	.titleArea{
 		width:1260px;
		height:50px;
		border-bottom-style:solid;
		border-bottom-width:1px;
		border-bottom-color:black;
		margin-right:0;
		margin-left:10px;
	}
	.title{
		display:inline-block;
		text-align: center;
		height:30px;
		margin-left:10px;
	}
	.titleContent{
		display:inline-block;
		text-align: center;
		height:30px;
	}
	.titleText{
		margin:0;
	}
	.titleContentText{
		margin-bottom:0px;
	}
	.tableArea{
		width:1100px;
		height:500px;
		border:1px solid black;
		overflow-x:hidden;
		overflow-y:scroll;
		margin-left:40px;
	}
	.serviceTable{
		width:1100px;
		border-collapse: collapse;
		text-align:center;
		border: 1px solid lightgray;
	}
	th{
		background-color: #f7f7f7;
		color: #005B9E;
		border: 1px solid lightgray;
		height:30px;
	}
	.serviceCode{
		width:150px; 
	}
	.serviceName{
		width:300px;
	}
	input{
		border:none;
		text-align:center;
	}
	.nextBtn{
		width:180px;
		height:50px;
		font-size: 25px;
		background:#060E33;
		border:0;
		color:#EAC064;
	}
	.nextBtn:hover{
		cursor:pointer;
		background:gray;
		color:black;
	}
	.backBtn{
		width:180px;
		height:50px;
		font-size: 25px;
		background:#060E33;
		border:0;
		color:#EAC064;
	}
	.backBtn:hover{
		cursor:pointer;
		background:gray;
		color:black;
	}
	.addServiceBtn{
		width:100px;
		height:30px;
		border-radius:5px;
		border:0;
		background-color: #3498DB;
   		color: white;
   		margin-bottom:10px;
   		cursor:pointer;
   		margin-left:40px;
	}
	select{
		border:0;
	}
</style>
</head>
<body>
	<div class="contentArea">
	<jsp:include page="hotelSettingMenubar.jsp"/>
		<div class="rightArea"><!-- ????????? ?????? -->
			<div class="titleArea">
				<div class="title">
					<h1 class="titleText">?? ????????? ??????</h1>
				</div>
				<div class="titleContent">
					<h6 class="titleContentText">????????? ???????????? ?????? ????????? ????????? ????????? ???????????? ???????????????.</h6>
				</div>
			</div>
			
			<!-- ??? -->
			<div class="contentArea2">
				<h3 style="margin-left:40px; ">????????? ??????</h3>
			</div>
			
			<button class="addServiceBtn" onclick="return addService();">+ ???????????????</button>
			<form action="goFormSettingPage.set" method="post">
			<div class="tableArea">
				<table class="serviceTable" border="1">
					<tr>
						<th width="15%">????????? ??????</th>
						<th width="30%">????????? ???</th>
						<th width="20%">?????? ??????</th>
						<th width="25%">??????</th>
						<th width="10%">??????</th>
					</tr>
					<tr>
						<td><input type="text" class="svcCode" name="svcCode" value="1HH"></td>
						<td><input type="text" class="svcName" name="svcName" value="???????????????"></td>
						<td>
							<select class="salesType" name="salesType">
								<option value="">????????????</option>
								<option value="ADDTIME" selected>????????????</option>
								<option value="ETC">??????</option>
							</select>
						</td>
						<td><input type="text" class="svcPrice" name="svcPrice" value=""></td>
						<td><button onclick="deleteService(this);">x</button></td>
					</tr>
					<tr>
						<td><input type="text" class="svcCode" name="svcCode" value="2HH"></td>
						<td><input type="text" class="svcName" name="svcName" value="???????????????"></td>
						<td>
							<select class="salesType" name="salesType">
								<option value="">????????????</option>
								<option value="ADDTIME" selected>????????????</option>
								<option value="ETC">??????</option>
							</select>
						</td>
						<td><input type="text" class="svcPrice" name="svcPrice" value=""></td>
						<td><button onclick="deleteService(this);">x</button></td>
					</tr>
					<tr>
						<td><input type="text" class="svcCode" name="svcCode" value="3HH"></td>
						<td><input type="text" class="svcName" name="svcName" value="???????????????"></td>
						<td>
							<select class="salesType" name="salesType">
								<option value="">????????????</option>
								<option value="ADDTIME" selected>????????????</option>
								<option value="ETC">??????</option>
							</select>
						</td>
						<td><input type="text" class="svcPrice" name="svcPrice" value=""></td>
						<td><button onclick="deleteService(this);">x</button></td>
					</tr>
					<tr>
						<td><input type="text" class="svcCode" name="svcCode" value="4HH"></td>
						<td><input type="text" class="svcName" name="svcName" value="???????????????"></td>
						<td>
							<select class="salesType" name="salesType">
								<option value="">????????????</option>
								<option value="ADDTIME" selected>????????????</option>
								<option value="ETC">??????</option>
							</select>
						</td>
						<td><input type="text" class="svcPrice" name="svcPrice" value=""></td>
						<td><button onclick="deleteService(this);">x</button></td>
					</tr>
					<tr>
						<td><input type="text" class="svcCode" name="svcCode" value="5HH"></td>
						<td><input type="text" class="svcName" name="svcName" value="??????????????????"></td>
						<td>
							<select class="salesType" name="salesType">
								<option value="">????????????</option>
								<option value="ADDTIME" selected>????????????</option>
								<option value="ETC">??????</option>
							</select>
						</td>
						<td><input type="text" class="svcPrice" name="svcPrice" value=""></td>
						<td><button onclick="deleteService(this);">x</button></td>
					</tr>
					<tr>
						<td><input type="text" class="svcCode" name="svcCode" value="6HH"></td>
						<td><input type="text" class="svcName" name="svcName" value="??????????????????"></td>
						<td>
							<select class="salesType" name="salesType">
								<option value="">????????????</option>
								<option value="ADDTIME" selected>????????????</option>
								<option value="ETC">??????</option>
							</select>
						</td>
						<td><input type="text" class="svcPrice" name="svcPrice" value=""></td>
						<td><button onclick="deleteService(this);">x</button></td>
					</tr>
				</table>
			</div>
			<br>
			<div align="right" style="margin-right:160px;"> 
				<button class="backBtn" onclick=""><b>??????</b></button>			
				<button class="nextBtn" onclick="return goHotelFormSetting();"><b>??????</b></button>			
			</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		function addService(){
			
			$("tbody:last").append("<tr><td><input type='text' class='svcCode' name='svcCode'></td><td><input type='text' class='svcName' name='svcName'></td><td><select class='salesType' name='salesType'><option value=''>????????????</option><option value='ADDTIME' selected>????????????</option><option value='ETC'>??????</option></select></td><td><input type='text' class='svcPrice' name='svcPrice' value=''></td><td><button onclick='deleteService(this);'>x</button></td></tr>");
			
		}
		function deleteService(obj){
			
			$(obj).parent().parent().remove();
			
		}
		function goHotelFormSetting(){
			
			var temp = 0;
			
			$(".svcCode").each(function(){
				if($(this).val() == ""){
					alert("????????? ????????? ??????????????????.")
					temp = 1;
					return false;
				}else{
					temp = 0;
				}
			});
			$(".svcName").each(function(){
				if($(this).val() == ""){
					alert("????????? ?????? ??????????????????.")
					temp = 1;
					return false;
				}else{
					temp = 0;
				}
			});
			$(".salesType").each(function(){
				if($(this).val() == ""){
					alert("????????? ????????? ??????????????????");
					temp = 1;
					return false;
				}else{
					temp = 0;
				}
			});
			$(".svcPrice").each(function(){
				if($(this).val() == ""){
					alert("????????? ????????? ??????????????????");
					temp = 1;
					return false;
				}else{
					temp = 0;
				}
			});
			
			var regExpPrice = /^[0-9]{1,}/;
			if (!regExpPrice.test($(".svcPrice").val())) {
				alert("????????? ??????????????????.");
				$(".svcPrice").focus();
				$(".svcPrice").select();
				return false;
			}
			
			
			if(temp == 0){
				return true;
			}else{
				return false;
			}
			
		}
	</script>
</body>
</html>