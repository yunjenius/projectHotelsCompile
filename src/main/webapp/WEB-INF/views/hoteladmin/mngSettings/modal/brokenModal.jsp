<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.HashMap, java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	.modal_content {
		position: absolute;
		left: 50%;
		top: 45%;
		transform: translate(-50%, -50%);
		width: 1200px;
		height:600px;
		max-height: 600px;
		background-color: white;
	}
	
	.modal_content_real {
		width:1200px;
		height:550px;
		margin:0 auto;
	}
	
	.btn_close {
		padding-top:10px;
		position: absolute;
		top:-4%;
		left:96.5%;
		font-size:40px;
		float: right;
		color:darkgray;
	}
	
	.btn_close:hover {
	cursor: pointer;
	}
	.modalTitle{
		padding-top:5px;
		padding-left:5px;
		width:1195px;
		height:40px;
		background:royalblue;
		color:white;
	}
	.modalContentTitle{
		margin-left:5px;
		background:#E9F3FF;
		width:99%;
		height:40px;
		display: flex;
	}
	.modalContentTitle h3{
		margin-top:0;
		padding-top:6px;
		padding-left:10px;
	}
	.brokenDateArea{
		padding-top:5px;
		display: flex;
	}
	.floorArea{
		display:flex;
	}
	.floorTable{
		float:left;
		text-align:center;
		width:100px;
		font-size:30px;
	}
	.floorTable td{
		font-size:20px;
	}
	.floorTableArea{
		text-align:center;
		width:115px;
		height:400px;
		border:1px solid lightgray;
		margin-top:10px;
		margin-left:10px;
		overflow-x:hidden;
		overflow-y:scroll;
	}
	.floorTable th{
		background:#E9F3FF;
	}
	.floorTable tr{
		cursor:pointer;
	}
	.floorTable tr:hover{
		background:lightgray;
		
	}
	.floorRoomArea{
		margin-top:10px;
		margin-left:10px;
		float:right;
		width:1055px;
		height:400px;
		border:1px solid lightgray;
		overflow-x:hidden;
		overflow-y:scroll;
	}
	.floorRoomTable{
		width:1040px;
		border-collapse: collapse;
		text-align:center;
	}
	.floorRoomTable th{
		background-color: #f7f7f7;
		color: #005B9E;
		border: 1px solid lightgray;
		height:30px;
	}
	.floorRoomTable tr{
		border: 1px solid lightgray;
		height:30px;
	}
	.brokenMemo{
		width:1200px;
		hegith:40px;
	}
	.brokenMemoContent{
		margin-left:5px;
		margin-top:10px;		
		background:#E9F3FF;
		width:1180px;
		height:40px;
		padding-top:10px;
		padding-left:10px;
		display: inline-flex;
	}
	.brokenMemoContent h3{
		margin:0 auto;
	}
	.brokenMemoContent input{
		margin-bottom:10px;
		width:800px;
	}
	.addBroken{
		background:#3498DB;
		margin-bottom:10px;
		margin-left:10px;
		margin-right:10px;
		color:white;
		border:0;
		cursor:pointer;
	}
	.addBroken:hover{
		background:#E9F3FF;
		color:black;
		border:1px solid #3498DB;
	}
</style>
</head>
<body>
	<div class="modal">
		<div class="modal_content">
			<div class="modalTitle">
				<h2 style="margin:0 auto;">??????????????????</h2>
				<a class="btn_close">??</a>
			</div>
			<div class="modal_content_real">
				<div class="modalContentTitle">
					<h3>????????????</h3>
					<div class="brokenDateArea">
						<table>
							<tr>
								<td width="50%"></td>
								<td><input type="text" id="modalBrokenStart" name="modalBrokenStart" class="modalBrokenStart"></td>
							</tr>
						</table>
						~
						<table>
							<tr>
								<td width="50%"></td>
								<td><input type="text" id="modalBrokenEnd" name="modalBrokenEnd" class="modalBrokenEnd"></td>
							</tr>
						</table>
					</div>
				</div>
				
				<div class="floorArea">
					<div class="floorTableArea">
						<table class="floorTable">
							<tr class="floorTableThArea">
								<th>???</th>
							</tr>
						</table>
					</div>
					<div class="floorRoomArea">
						<table class="floorRoomTable" border="1">
							<tr class="thAreaBrokenModal">
								<th width="10%"><input type="checkbox"></th>
								<th width="20%">????????????</th>
								<th width="20%">????????????</th>
								<th width="20%">????????????</th>
								<th width="30%">??????</th>
							</tr>
						</table>
					</div>
				</div>
				<div class="brokenMemo">
					<div class="brokenMemoContent">
						<h3>????????????</h3>
						<input type="text" name="brokenResponse" class="brokenResponse">
						<input type="hidden" name="staffMno" value="${ sessionScope.loginUser.mno }">
						<button class="addBroken" type="submit" onclick="return addBrokenRoom();">????????????</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$(".btn_close").click(function() {
				$(".modal").fadeOut();
			});
		});
	//datepicker
		$(function() {

			
			date = new Date();
		
			checkIn = $("#modalBrokenStart").datepicker({
				autoClose : true,
				//????????? ????????? ?????????
				onSelect : function(date) {
					endNum = date;
					//????????? datepicker??? ??????????????? ?????? ????????? ????????? ??????
					$("#modalBrokenEnd").datepicker({
						minDate : new Date(endNum),
					});
				}
			}).data('datepicker');
		
			checkOut = $("#modalBrokenEnd").datepicker({
				autoClose : true,
				//????????? ????????? ?????????
				onSelect : function(date) {
					startNum = date;
					$('#modalBrokenStart').datepicker({
						//????????? datepicker??? ??????????????? ?????? ????????? ????????? ??????
						maxDate : new Date(startNum),
					});
				}
			}).data('datepicker');
			
		});
		
		function openBrokenModal(){
			$(".modal").fadeIn();		
		}
</script>
</body>
</html>