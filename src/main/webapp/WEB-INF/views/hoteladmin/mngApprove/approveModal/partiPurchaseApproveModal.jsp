<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODAL</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.modal_parti {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.5);
	z-index: 2;
}

.modal_content {
	position: absolute;
	left: 50%;
	top: 45%;
	transform: translate(-50%, -50%);
	width: 1000px;
	height: 705px;
	background-color: white;
	margin-top:50px;
}

.modal_content_real {
	width: 870px;
	height: 100%;
	margin: 0 auto;
	margin-top:20px;
	overflow-y:scroll;
	max-height:550px;
}

.btn_close {
	position: absolute;
	top: -4%;
	left: 96.5%;
	font-size: 40px;
	float: right;
	color: darkgray;
}

.btn_close:hover {
	cursor: pointer;
}

.modalTbl {
	height: 600px;
	max-height: 500px;
	height:100%;
}

.tbl_modal {
	padding-top: 10px;
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
	width: 100%;
	height:auto;
}

.tbl_modal.parti td {
	height: 30px;
	border: 1px solid black;
}

.tbl_modal.parti td:last-child {
	border-right: 0px;
}

.tbl_modal.parti td:fisrt-child {
	border-left: 0px;
}

.txtArea {
	margin-left: auto;
	margin-right: auto;
	border: 1px solid lightgray;
	width: 700px;
	height: 400px;
	text-align: center;
}

.approveBtn {
	
	margin-left:720px;
	margin-bottom: 20px;
	margin-top:20px;
	position:relative;
	bottom:-5px;
}
.approveBtn button {
	height:30px;
	width:100px;
	border-radius:5px;
	background:#E5E5E5;
	border:0px;
}
.btn_close_plus {
   position: absolute;
   top: -1%;
   left: 95.5%;
   font-size: 40px;
   float: right;
   color: white;
}

.btn_close_plus:hover {
   cursor: pointer;
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
#reject {
	background:tomato;
	color:white;
}
#confirm {
	background:forestgreen;
	color:white;
}
.docuNum {
	border:0px;
}


</style>
</head>
<body>
	<div class="modal_parti">
		<div class="modal_content">
			<div class="titleBarplus">
				<h1 style="text-align: left;">?????? ?????????</h1>
			</div>
			<a class="btn_close_plus">??</a>

			
			
			
			<!-- ?????? ??????/?????? ?????? -->
			<div class="approveBtn">
				<button onclick="reject();" id="reject">??????</button>
				<button onclick="submit();" id="confirm">??????</button>
			</div>
			<!-- ?????? ?????? end -->
			
			
			<!-- content ?????? -->
			<div class="modal_content_real">
				<div class="modalTbl">
					<table class="tbl_modal parti">
						<colgroup>
							<col width="10%">
							<col width="15%">
							<col width="20%">
							<col width="15%">
							<col width="15%">
							<col width="15%">
							<col width="10%">
						</colgroup>
						<tr>
							<td>????????????</td>
							<td colspan="2"><input type="text" class="docuNum"></td>
							<td colspan="2">?????????</td>
							<td colspan="2">????????????</td>
						</tr>
						<tr>
							<td>????????????</td>
							<td colspan="2"></td>
							<td rowspan="2" colspan="2" class="boss"></td>
							<td rowspan="2" colspan="2" class="head"></td>
						</tr>
						<tr>
							<td>?????????</td>
							<td colspan="2"></td>

						</tr>
						<tr>
							<td>?????????</td>
							<td colspan="2"></td>
							<td rowspan="2" colspan="4"></td>

						</tr>
						<tr>
							<td>?????????</td>
							<td colspan="2"></td>



						</tr>
						<tr>
							<td>??????</td>
							<td colspan="6">?????? ?????????</td>
						</tr>
						<tr style="background: lightgray;" class="temp">
							<td>??????</td>
							<td>?????????</td>
							<td>?????????</td>
							<td>?????????</td>
							<td>????????????</td>
							<td>??????</td>
							<td>??????</td>
						</tr>
						<tr>
							
						</tr>
						<tr>
							<td colspan="2">??? ??????</td>
							<td colspan="5" id="totalPrice" style="text-align:right;"></td>
						</tr>
						<tr id="content">
							<td colspan="7" rowspan="6">
								<div class="txtArea">
									

								</div>
							</td>
						</tr>

					</table>


				</div>
			</div>
			<!-- content end -->
		</div>
	</div>
	<br>
	<br>
	<br>

	<script>
		$(document).ready(function() {
				$(".btn_close_plus").click(function(){
					$(".repeat").children().remove();
					
					$(".boss").text("");
					$(".head").text("");
					
					
					$(".modal_parti").fadeOut();
				})
			
			
		});
		
		
	</script>
</body>
</html>