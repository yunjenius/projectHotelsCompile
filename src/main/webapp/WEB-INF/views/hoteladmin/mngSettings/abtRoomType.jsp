<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.rightAreaRoom{
		width:1300px;
		height:900px;
		float:right;
	}
	.roomBtn{
		margin-top:20px; 
		border:0;
		width:180px;
		height:40px;
		font-weight: bold;
		box-shadow: 0 0.25rem 1rem rgba(0,0,0,0.2);
	}
	.roomBtn:hover{
		cursor:pointer;
	}
	.roomTypeBtn{
		background:#3498DB;
		color:white;
	}
	.roomDetailBtn{
		background:white;
		color:#3498DB;
	}
	.roomTitleArea{
		padding-bottom:20px;
		border-bottom-color: lightgray;
		border-bottom-style: solid;
		border-bottom-width: 1px;
	}
	.roomTableArea{
		margin-top:30px;
	}
	.textArea{
		float:left;
	}
	.addRoomType{
		float:right;
		border:0;
		width:100px;
		cursor:pointer;
		background:#DDEBFF;
	}
	.addRoomType:hover{
		background:#AAEBFF;
	}
	.roomTable{
		width:1300px;
		hegith:400px;
		text-align: center;
	}
	.roomTable th{
		height:30px;
		background-color:rgba(85, 115, 255, 0.24);
		color:black;
	}
	.roomTable input{
		border:0;
	}
	.tableAreaRoom{
		margin-top:30px;
		width:1300px;
		height:400px;
		border:1px solid black;
		overflow-y:scroll;
		overflow-x:hidden;
	}
	.saveBtn{
		width:180px;
		height:50px;
		font-size: 25px;
		background:#060E33;
		border-radius:5px;
		border:0;
		color:#EAC064;
	}
	.saveBtn:hover{
		cursor:pointer;
		background:gray;
		color:black;
	}
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
<div class="mainArea">
	<jsp:include page="../common/settingMenubar.jsp"/>
	<div class="rightAreaRoom">
		<div class="roomTitleArea">
			<div class="btnGroup">
				<button class="roomBtn roomTypeBtn">객실 타입 설정</button>
				<button class="roomBtn roomDetailBtn">객실 상세 정보</button>
			</div>
		</div>
		<div class="roomTableArea">
			<label class="textArea">객실타입은 수정 및 삭제가 불가능 합니다. 비활성화 후 신규로 생성할 수 있습니다.</label>
			<button class="addRoomType" onclick="addRoomType();">+ 추가</button>
			<br>
			<div class="tableAreaRoom">
				<table border="1" class="roomTable" style="border-collapse: collapse;">
					<tr class="thArea">
						<th width="5%"><input type="checkbox"></th>
						<th width="20%">객실 타입</th>
						<th width="20%">객실 수</th>
						<th width="15%">기준 인원</th>
						<th width="15%">최대 인원</th>
						<th width="15%">정상가</th>
					</tr>
				</table>
			</div>
			<div align="center" style="margin-top:10px;">
				<button class="saveBtn">저장</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
function addRoomType(){
	$("tbody:last").append("<tr><td><input type='checkbox'></td><td><input type='text'></td><td></td><td><input type='number' min='1' value='1' max='20' style='text-align:center;'></td><td><input type='number' min='1' value='1' max='20' style='text-align:center;'></td><td><input type='text' style='width:100px;height:30px;'></td></tr>");
};
</script>
</body>
</html>