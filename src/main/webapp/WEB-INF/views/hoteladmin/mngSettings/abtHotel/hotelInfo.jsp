<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
 .Area1{
		font-weight: bold;
	}
	.menubar{
		height:1250px;
	}
	.contentArea{
		width:1600px;
		height:900px;
	}
	.titleArea{
		width:1250px;
		height:50px;
		border-bottom-width: 1px;
		border-bottom-color: darkgray;
		border-bottom-style: solid;
		margin-top:-18px;
	}
	
	  .rightAreaKijoon{
		float:right;
		width:1327px;
		height:900px;
		margin-left:10px;
		margin-top:125px;
	}  
	input{
		border-radius:5px 5px 5px 5px;
		border:1px solid lightgray;
		width:200px;
		height:25px;
	}
	select{
		border-radius:5px 5px 5px 5px;
		border:1px solid lightgray;
		width:200px;
		height:30px;
	}
	.basicInfoArea{
		width:1300px;
		height: auto;
		margin-left:70px;
	}
	.basicInfoArea table tr td:nth-child(2){
		padding-right:160px;
	}
	.basicInfoArea tr td{
		padding-right:58px;
		padding-bottom:10px;
	}
	.basicInfoArea label{
		font-weight: bold;
	}
	.systemInfoArea{
		width:1300px;
		height: auto;
		margin-left:70px;
	}
	.systemInfoArea tr td{
		padding-bottom:10px;
	}
	.systemInfoArea label{
		font-weight: bold;
	}
	.systemInfoArea input{
		text-align:center;
	}
 	.secondBox{
		padding-left:51px;
	}  

	.hotelNotice{
		width:840px;
	
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

	.basicInfoArea{
	}
	body{
		overflow-x:hidden;
	}
	.offSeason table{
		width:890px;
	}
	.offSeason td:nth-child(1), .offSeason td:nth-child(3){
		padding-right:0;
	}
	.peakSeason table{
		width:890px;
	}
	.peakSeason td:nth-child(1), .peakSeason td:nth-child(3){
		padding-right:0;
	}
	.offSeason td input{
		text-align:center;
	}
	input[type=text], input[type=tel], input[type=email] {
		text-align:center;
	}
	.downTbl tr td{
		padding-right: 58px;
	    padding-bottom: 10px;
}

.upTbl {
	width:1130px;
	
}
.upTbl tr td{
	padding-right: 58px;
	padding-bottom: 10px;
	
}
	
</style> 
 
</head>
<body>
	<header>
		    <jsp:include page="../../common/menubar.jsp" />
			<jsp:include page="../../common/settingMenubar.jsp" />
	</header>
<form action="goRoomTypePage.set" method="post">
	<div class="contentArea">
		<div class="rightAreaKijoon">
			<div class="titleArea">
				<h1 class="titleAreaSub">?? ?????? ?????? ??????</h1>
			</div>
			<div>
				<h3 style="margin-left:30px; color:#060E33;">?????? ??????</h3>
			</div>
			<div class="basicInfoArea"><!-- ???????????? ?????? -->
				<table class="upTbl">
				<c:forEach var="b" items="${list }">
					<tr>
						<td>
							<label>* ?????????</label>
						</td>
						<td class="secondBox" style="width:200px;">
							<input type="text" name="hname" id="hnameInput" class="inputBox" value="${b.HNAME }" readonly>
						</td>
						<td>
							<label>* ?????????</label>
						</td>
						<td>
							<input type="text" name="owner" id="ownerInput" class="inputBox" value="${b.OWNER}" readonly>
						</td>
					</tr>
					<tr>
						<td>
							<label>* ?????????</label>
						</td>
						<td class="secondBox">
							<input type="email" name="hemail" id="hemailInput" class="inputBox" value="${b.EMAIL }" readonly>
						</td>
						<td>
							<label>* ?????????</label>
						</td>
						<td>
							<input type="tel" name="hphone" id="hphoneInput" class="inputBox" value="${b.PHONE}" readonly>
						</td>
					</tr>
					<tr>
						<td>
							<label>????????? ???</label>
						</td>
						<td class="secondBox">
							<input type="text" name="bizName" id="bizNameInput" class="inputBox" value="${b.BIZ_NAME}" readonly>
						</td>
						<td>
							<label>????????? ??????</label>
						</td>
						<td>
							<input type="text" name="bizNo" id="bizNoInput" class="inputBox" value="${b.BIZ_NO}" readonly>
						</td>
					</tr>
					<tr>
						<td>
							<label>?????? ??????</label>
						</td>
						<td class="secondBox">
							<input type="tel" name="htel" id="htelInput" class="inputBox" value="${b.HTEL}" readonly>
						</td>
					</tr>
					</c:forEach>
				</table>
			</div><!-- ???????????? ?????? ??? -->
			<div>
				<h3 style="margin-left:30px; color:#060E33;">????????? ??????</h3>
			</div>
			<div class="systemInfoArea"><!-- systemInfoArea -->
				<table class="downTbl">
				<c:forEach var="b" items="${list }">
					<tr>
						<td style="width:156px;">
							<label>* ????????????</label>
						</td>
						<td style="width:310px;">
							<select class="checkInTime" name="chkIn">
							
								<option value="${b. CHKIN}" selected disabled hidden>${b. CHKIN}</option>
							</select>
						</td>
						<td style="width:130px;">
							<label>* ????????????</label>
						</td>
						<td>
							<select class="checkOutTime" name="chkOut">
								<option value="${b.CHKOUT }" selected disabled hidden>${b.CHKOUT }</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<label>* ????????????</label>
						</td>
						<td>
							<select class="rentedRoom" name="lentUnit">
								<option value="${b.LENT_UNIT }" selected disabled hidden>${b.LENT_UNIT }</option>
							</select>
						</td>
						<td>
							<label>* ?????????(%)</label>
						</td>
						<td>
							<input type="text" name="svcRate" id="svcRateInput" class="inputBox" value="${b.SVC_RATE }" readonly>
						</td>
					</tr>
					<tr>
						<td>
							<label>* ?????? ?????? ??????</label>
						</td>
						<td>
							<input type="text" name="calTime" id="calTimeInput" class="inputBox" value="${b.CAL_TIME }" readonly>
						</td>
						<td>
							<label>* ????????? ??????</label>
						</td>
						<td>
							<select class="vatSelect" name="vatType">
								<option value="${b.VAT_TYPE }" selected disabled hidden>${b.VAT_TYPE }</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<label>* ?????? ??????</label>
						</td>
						<td colspan="3">
							<input type="tel" name="rcontent" class="inputBox hotelNotice" value="${b.RCONTENT }" readonly>
						</td>
					</tr>
					<tr>
						<td>
							<label>* ?????? ??????</label>
						</td>
						<td colspan="3">
							????????? ???????????? 
							<select class="checkInScheduledTime" style="width:100px;" name="nsUnit">
								<option value="${b.NS_UNIT }" selected disabled hidden>${b.NS_UNIT }</option>
								
							</select>
							??? ?????? ???????????? ?????? ??????, <input type="text" style="width:100px;" name="nsRate" class="recInput" value="${b. NS_RATE}" readonly> % ??? ???????????? ???????????????.
						</td>
					</tr>
					
					<tr>
						<td>
							<label>* ?????? ??????</label>
						</td>
						<td colspan="3">
							<b>????????????</b><hr>
						</td>
					</tr>
					</c:forEach>
					<tr>
						<td></td>
						<td colspan="3">
							<div class="offSeason">
								<table>
								 <%-- <c:forEach var="a" items="${rfdOWList }" varStatus="status">  --%>
									<tr>
										<td><b>??????</b> 2 ??????</td>
										<td><input type="text" name="offSeasonWeek2" class="offSeasonWeek2" value="${rfdOWList[0].RFD_RATE }"> % ??????</td>
										<td><b>??????</b> 2 ??????</td>
										<td><input type="text" name="offSeasonWeekend2" class="offSeasonWeekend2" value="${rfdOWEList[0].RFD_RATE }"> % ??????</td>
									</tr>
									<tr>
										<td><b>??????</b> 1 ??????</td>
										<td><input type="text" name="offSeasonWeek1" class="offSeasonWeek1" value="${rfdOWList[1].RFD_RATE }"> % ??????</td>
										<td><b>??????</b> 1 ??????</td>
										<td><input type="text" name="offSeasonWeekend1" class="offSeasonWeekend1" value="${rfdOWEList[1].RFD_RATE }"> % ??????</td>
									</tr>
									<tr>
										<td><b>??????</b> ??????</td>
										<td><input type="text" name="offSeasonWeek0" class="offSeasonWeek0" value="${rfdOWList[2].RFD_RATE }"> % ??????</td>
										<td><b>??????</b> ??????</td>
										<td><input type="text" name="offSeasonWeekend0" class="offSeasonWeekend0" value="${rfdOWEList[2].RFD_RATE }"> % ??????</td>
									</tr>
									<%-- </c:forEach> --%>
								</table>
							</div>
						</td>
					</tr>
					<tr>
						<td>
						</td>
						<td colspan="3">
							<b>?????????</b><hr>
						</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="3">
							<div class="peakSeason">
								<table>
									<tr>
										<td><b>??????</b> 10 ??????</td>
										<td><input type="text" name="seasonWeek10" class="seasonWeek10" value="${noShowList[0].RFD_RATE }"> % ??????</td>
										<td><b>??????</b> 10 ??????</td>
										<td><input type="text" name="seasonWeekend10" class="seasonWeekend10" value="${rfdSWList[0].RFD_RATE}"> % ??????</td>
									</tr>
									<tr>
										<td><b>??????</b> 7 ??????</td>
										<td><input type="text" name="seasonWeek7" class="seasonWeek7" value="${noShowList[1].RFD_RATE }"> % ??????</td>
										<td><b>??????</b> 7 ??????</td>
										<td><input type="text" name="seasonWeekend7" class="seasonWeekend7" value="${rfdSWList[1].RFD_RATE}"> % ??????</td>
									</tr>
									<tr>
										<td><b>??????</b> 5 ??????</td>
										<td><input type="text" name="seasonWeek5" class="seasonWeek5" value="${noShowList[2].RFD_RATE }"> % ??????</td>
										<td><b>??????</b> 5 ??????</td>
										<td><input type="text" name="seasonWeekend5" class="seasonWeekend5" value="${rfdSWList[2].RFD_RATE}"> % ??????</td>
									</tr>
									<tr>
										<td><b>??????</b> 3 ??????</td>
										<td><input type="text" name="seasonWeek3" class="seasonWeek3" value="${noShowList[3].RFD_RATE }"> % ??????</td>
										<td><b>??????</b> 3 ??????</td>
										<td><input type="text" name="seasonWeekend3" class="seasonWeekend3" value="${rfdSWList[3].RFD_RATE}"> % ??????</td>
									</tr>
									<tr>
										<td><b>??????</b> 1 ??????</td>
										<td><input type="text" name="seasonWeek1" class="seasonWeek1" value="${noShowList[4].RFD_RATE }"> % ??????</td>
										<td><b>??????</b> 1 ??????</td>
										<td><input type="text" name="seasonWeekend1" class="seasonWeekend1" value="${rfdSWList[4].RFD_RATE}"> % ??????</td>
									</tr>
									<tr>
										<td><b>??????</b> ??????</td>
										<td><input type="text" name="seasonWeek0" class="seasonWeek0" value="${noShowList[5].RFD_RATE }"> % ??????</td>
										<td><b>??????</b> ??????</td>
										<td><input type="text" name="seasonWeekend0" class="seasonWeekend0" value="${rfdSWList[5].RFD_RATE}"> % ??????</td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
						<b>???????????? ?????? ??????????????? : ?????? ??????</b>
						</td>
					</tr>
					
				</table>
				
			</div><!-- ????????? ?????? ?????? ??? -->
			<hr width="1250px" style="float: left;"><br>
		</div>
	</div>
	</form>
	
	<script>
		$(function() {
			$("#plBtn")
					.click(
							function() {

								var plusTable = "<tr>";
								plusTable += "<td style='padding-top: 20px;'>????????????</td>"
								plusTable += "<td colspan='3' style='padding-top: 20px;'> <div class='ui input title'> <input class='txt2' type='text'></div></td>"
								plusTable += "</tr>"
								var n = $(".tblInfo");

								n.append(plusTable);
							});

			$("#submitBtn").click(function() {
				window.confirm("?????? ???????????????.");
			});
		});
	</script>

</body>
</html>