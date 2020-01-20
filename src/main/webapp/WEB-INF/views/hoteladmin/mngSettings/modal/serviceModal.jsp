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
	
	.modal_content {
		position: absolute;
		left: 50%;
		top: 45%;
		transform: translate(-50%, -50%);
		width: 800px;
		height: 500px;
		max-height: 500px;
		background-color: white;
	}
	
	.modal_content_real {
		width: 800px;
		height: 450px;
		/* border:1px solid black; */
		margin: 0 auto;
		overflow: auto;
	}
	
	.btn_close {
		position: absolute;
		top: 0%;
		left: 95%;
		font-size: 40px;
		float: right;
		color: darkgray;
	}
	
	.btn_close:hover {
		cursor: pointer;
	}
	.titleArea{
		padding-top:15px;
		padding-left:15px;
		width:785px;
		height:40px;
		background:#060E33;
		color:white;
	}
	.addServiceArea{
		margin-top:40px;
		text-align:center;
	}
	.addServiceArea tr{
		height:50px;
	}
	.addServiceArea select{
		margin-top:4px;
		margin-left:10px;
		width:300px;
		height:30px;
	}
	.inputText{
		width:300px;
		height:30px;
		margin-left:10px;
		border-radius:5px;
		border:1px solid lightgray;
		
	}
	.saveServiceBtn{
		width:100px;
		height:30px;
		border:0;
	}
</style>
</head>
<body>
	<div class="modal">
		<div class="modal_content">
			<div class="titleArea">
				<h3 style="margin:0 auto;">서비스 추가</h3>
				<a class="btn_close">×</a>
			</div>
			<div class="modal_content_real">
				<table align="center" class="addServiceArea">
					<tr>
						<td>* 서비스 코드</td>
						<td><input type="text" class="inputText"></td>
					</tr>
					<tr>
						<td>* 서비스 명</td>
						<td><input type="text" class="inputText"></td>
					</tr>
					<tr>
						<td>* 판매 금액</td>
						<td><input type="text" class="inputText"></td>
					</tr>
					<tr>
						<td>추가 시간</td>
						<td><input type="text" class="inputText"></td>
					</tr>
					<tr>
						<td>* 매출 구분</td>
						<td>
							<select>
								<option value="">==선택==</option>
								<option value="">객실매출</option>
								<option value="">객실기타</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>사용</td>
						<td><input type="radio" id="used" name="using"><label for="used">사용</label><input type="radio" id="noUse" name="using"><label for="noUse">아니오</label></td>
					</tr>
					<tr>
						<td colspan="2"><button class="saveServiceBtn">저장</button></td>
					</tr>
				</table>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$(".btn_close").click(function() {
				$(".modal").fadeOut();
			});
		});
	</script>
</body>
</html>