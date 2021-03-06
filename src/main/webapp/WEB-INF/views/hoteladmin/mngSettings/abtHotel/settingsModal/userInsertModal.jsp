<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODAL</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.modal {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.5);
	z-index: 2;
}
.titleBarplus {
	padding-top: 10px;
	padding-bottom: 10px;
	color: white;
	background-color: royalblue;
}

.titleBarplus h1 {
	margin-top: 0;
	margin-bottom: 0;
	margin-left: 10px;
}
.modal_content {
	position: absolute;
	left: 50%;
	top: 45%;
	transform: translate(-50%, -50%);
	width: 800px;
	height: auto;
	max-height: 1000px;
	border: 0px solid white;
	background-color: white;
	/* overflow-y: auto; */
}

.modal_content_real {
	width: 780px;
	height: 350px;
	margin: 0 auto;
	overflow: auto;
}

.btn_close {
	position: absolute;
	top: -2%;
	left: 96.5%;
	font-size: 40px;
	float: right;
}

.btn_close:hover {
	cursor: pointer;
}

.modal_content_real {
	margin-top: 20px;
}

.tit_Area {
	background: #060E33;
	color: white;
	height: 50px;
	margin-top: -20px;
}

#tbl_modal {
	width: 50% px;
	margin-left: 60px;
}

#tbl_modal td {
	padding: 10px;
}

input[type=text] {
	border-radius: 3px;
	border: 1px solid lightgray;
	height: 25px;
}
input[type=tel] {
	border-radius: 3px;
	border: 1px solid lightgray;
	height: 25px;
}
input[type=email] {
	border-radius: 3px;
	border: 1px solid lightgray;
	height: 25px;
}

.emptyDiv {
	width: 500px;
	height: 50px;
}

#idBtn {
	border-radius: 2px;
	border: 1px solid #060E33;
	background: white;
	height: 30px;
	width: 70px;
}

.secTable {
	width: 280px;
	height: 200px;
	float: right;
	margin-right: 50px;
	margin-top: -305px;
}

#secTbl {
	margin-left:5px;
	width:270px;
	border-top:1px solid lightgray;
	border-bottom:1px solid lightgray;
	text-align:center;
}

#secTbl td:not (:last-child) {
}
#secTbl td:first-child {
	border-left:1px solid lightgray;
}
.autoBtn1 {
	width:60px;
	height:18px;
	position:relative;
	border-radius:5px;
	border:1px solid black;
	
}
.autoBtn2  {
	width:60px;
	height:18px;
	border-radius:5px;
	border:1px solid black;
	color:black;
	background:white;
}
input[type=checkbox] {
	background:white;
}
#submt {
	border-radius:2px;
	border:1px solid #3498DB;
	background:#3498DB;
	color:white;
	width:70px;
	height:30px;
	margin-top:30px;
	margin-left:70px;
}
div.autoBtn1 {
	position:relative;
	display:inline-block;
}
div.autoBtn1 span.tooltiptext {
	visibility:hidden;
	width:180px;
	background:black;
	color:white;
	text-align:center;
	border-radius:6px;
	position:absolute;
	z-index: 1;
	transform:translate(-50%, -50%);
	bottom:100%;
	left:50%;
}
div.autoBtn1 span.tooltiptext::after {
	cursor:pointer;
	content:"";
	position:absolute;
	top:90%;
	left:50%;
	cursor:pointer;
	
}
div.autoBtn1:hover span.tooltiptext {
	visibility:visible;
	cursor:pointer;
}

div.autoBtn2 {
	position:relative;
	display:inline-block;
}
div.autoBtn2 span.tooltiptext2 {
	visibility:hidden;
	width:180px;
	background:black;
	color:white;
	text-align:center;
	border-radius:6px;
	position:absolute;
	z-index: 1;
	transform:translate(-50%, -50%);
	bottom:100%;
	left:50%;
}
div.autoBtn2 span.tooltiptext2::after {
	content:"";
	position:absolute;
	top:90%;
	left:50%;
	cursor:pointer;
}
div.autoBtn2:hover span.tooltiptext2 {
	visibility:visible;
	cursor:pointer;
}
.submitBtn{
	background:#3498DB;
	color:white;
	font-weight: bold;
}
.submitBtn:hover{
	background:#060E33;
	color:white;
	font-weight: bold;
	cursor:pointer;
}
</style>
</head>
<body>
	<div class="modal">
		<div class="modal_content">
			<a class="btn_close" style="color: white;">??</a>
			<div class="titleBarplus">
				<h1 style="text-align: left;">????????? ??????</h1>
			</div>
			<div class="modal_content_real">

				<div class="modalTbl">
				<form action="insertMember.me" method="post">
						<table id="tbl_modal">
							<tr>
								<td>????????? ID</td>
								<td><input type="text" class="userId" name="userId"></td>
								<td><button type="button" onclick="idCheck();" id="idBtn">????????????</button></td>
							</tr>
							<tr>
								<td>????????????</td>
								<td colspan="2"><input type="text" class="userNames" name="userName" style="width: 250px;"></td>
							</tr>
							<tr>
								<td>??????</td>
								<td colspan="2"><input type="tel" name="phone" class="phone" style="width: 250px;"></td>
							</tr>
							<tr>
								<td>?????????</td>
								<td colspan="2"><input type="email" name="email" class="email" style="width: 250px;"></td>
							</tr>
							<tr>
								<td>??????</td>
								<td>
									<select name="deptNo" class="deptNo">
										<option value="">== ?????? ==</option>
										<option value="2">?????????</option>
										<option value="3">??????/?????????</option>
										<option value="4">?????????</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>??????</td>
								<td>
								<input type="radio" name="status" class="use" id="yes" value="Y"><label for="yes">???</label>
								<input type="radio" name="status" class="use" id="no" value="N"><label for="no">?????????</label></td>
							</tr>
						</table>
						<input type="hidden" class="userPwd" name="userPwd" value="0000" style="width: 250px;">
						<div class="secTable">
							<h4 style="margin-left:10px;">????????? ??????</h4>
							<table id="secTbl">
								<colgroup>
									<col width="30%">
									<col width="35%">
									<col width="35%">
								</colgroup>
								<tr style="background:#F3F3F3;">
									<td></td>
									<td colspan="2" >?????????</td>
								</tr>
								<tr>
									<td><input type="radio" id="deptMember" name="authNo" value="AUTH1" class="authority"></td>
									<td style="float:right"><label for="deptMember" style="border:0;">?????????</label></td>
									<td><div class="autoBtn1"><p style="margin:0;font-size:10px;">????????????</p><span class="tooltiptext">??????????????????<br>????????? ?????? ?????? ??????</span></div></td>
								</tr>
								<tr>
									<td><input type="radio" id="deptHeader" name="authNo" value="AUTH2" class="authority2"></td>
									<td style="float:right"><label for="deptHeader" style="border:0;">?????????</label></td>
									<td><div class="autoBtn2"><p style="margin:0;font-size:10px;">????????????</p><span class="tooltiptext2">??????????????????<br>????????? ?????? ?????? ??????</span></div></td>
								</tr>
							</table>
							<button type="submit" class="submitBtn" style="margin-top:15px; margin-left:5px; width:100px;height:30px; border:0;" onclick="return insertMember();">????????? ??????</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>

<script>


	$(document).ready(function() {
		
		window.idCheckResult = false;
		
		$(".btn_close").click(function() {
			$(".modal").fadeOut();
		});
	});
	
	function idCheck() {

		var userId = $(".userId").val();

		if($(".userId").val() == ""){
			
			alert("???????????? ??????????????????.");
			
		}else{
			$.ajax({
				url : "idCheck.me",
				type : "post",
				data : {
					userId : userId
				},
				success : function(data) {
					console.log(data);
	
					if (data === "success") {
						alert("????????? ??????????????????.");
					} else {
						alert("??????????????? ????????? ?????????.");
						idCheckResult = true;
					}
				},
				error : function(data) {
	
				}
	
			});
		}
	}
	function insertMember() {

		if (idCheckResult == false) {
			alert("????????? ??????????????? ????????????");
			return false;
		}

		if ( $(".userNames").val() == "" ) {
			alert("????????? ??????????????????");
			console.log($(".userNames").val());
			$(".userNames").focus();
			return false;
		}
		var regExpName = /^[???-???]{2,}/;
		if (!regExpName.test($(".userNames").val())) {
			alert("????????? ?????? ??????????????????");
			$(".userName").focus();
			$(".userName").select();
			return false;
		}

		if ($(".phone").val() == "") {
			alert("??????????????? ??????????????????.");
			$(".phone").focus();
			return false;
		}
		var regExpName = /^[0-9]{9,}/;
		if (!regExpName.test($(".phone").val())) {
			alert("??????????????? ?????? ??????????????????.");
			$(".phone").focus();
			$(".phone").select();
			return false;
		}
		if ($(".email").val() == "") {
			alert("???????????? ??????????????????");
			$(".email").focus();
			return false;
		}
		var regExpEmail = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
		if (!regExpEmail.test($(".email").val())) {
			alert("???????????? ?????? ??????????????????");
			$(".email").focus();
			$(".email").select();
			return false;
		}
		if ($(".dept").val() == "") {
			alert("????????? ??????????????????");
			return false;
		}
		if($(".use").prop("checked") == false){
			alert("??????????????? ??????????????????.");
			return false;
		}

		if($(".authority").prop("checked") == false && $(".authority2").prop("checked") == false){
			alert("????????? ??????????????????.");
			return false;
		}
		
		if(confirm("????????? ????????? ??????????????????? ")){
			return true;
		}
	}

</script>
</body>
</html>