<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelsCompile</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
.writeApprove {
	width: 1000px;
	margin-left: auto;
	margin-right: auto;
}

.empty {
	width: 100%;
	height: 50px;
	background: #F7F7F7;
	margin-top: 20px;
}

#category {
	border-radius:3px;
	height: 40px;
	margin-top:5px;
	margin-left:7px;
}

.selectCategory {
	margin-top: 20px;
}

.tblArea {
	width: 100%;
}

#tbl_modal {
	padding-top: 10px;
	border: 2px solid black;
	border-collapse: collapse;
	text-align: center;
	width: 100%;
}

#tbl_modal td {
	padding:6px;
	height: 30px;
	border: 1px solid black;
}

#tbl_modal td:last-child {
	border-right: 0px;
}

#tbl_modal td:fisrt-child {
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

.sub {
	float: right;
	border-radius: 3px;
	background: #FFFDFD;
	height: 30px;
	border: 1px solid black;
}

#docuTxt {
	height: 30px;
	border-radius: 4px;
	border: 1px solid lightgray;
}

.btnArea {
	
}
</style>
<!--  <script
	src="https://cdn.jsdelivr.net/npm/jquery@3.3.1/dist/jquery.min.js"></script> -->
<!-- <link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/fomantic-ui@2.8.3/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/fomantic-ui@2.8.3/dist/semantic.min.js"></script>  -->

</head>
<body>
	<header>
		<jsp:include page="../../common/menubar.jsp" />
	</header>
	<%-- <c:set var="contextPath"
		value="${pageContext.servletContext.contextPath }" scope="application" /> --%>
	<section>
		<div class="writeApprove">


			<div class="empty">
			<div class="selectCategory">
				<select id="category">
					<option selected>?????? ?????????</option>
					<option>?????? ?????????</option>
					<option>?????? ?????????</option>
				</select>
			</div>
</div>

			<h2 align="center">?????? ?????????</h2>
			<br>

			<div class="totalDiv">
				<form action="" method="">
					<div class="btnArea">
						<button type="submit" class="sub">????????????</button>
					</div>
					<div class="tblArea">

						<table id="tbl_modal">
							<colgroup>
								<col width="10%">
								<col width="12%">
								<col width="25%">
								<col width="27%">
								<col width="13%">
								<col width="13%">

							</colgroup>
							<tr>
								<td>????????????</td>
								<td colspan="2"><input type="text" name="" id="docuTxt"></td>
								<td>?????????</td>
								<td colspan="2">????????????</td>
							</tr>
							<tr>
								<td>????????????</td>
								<td colspan="2"><input type="text" name="" id="docuTxt"></td>
								<td rowspan="2"></td>
								<td rowspan="2" colspan="2"></td>
							</tr>
							<tr>
								<td>?????????</td>
								<td colspan="2">?????????</td>

							</tr>
							<tr>
								<td>?????????</td>
								<td colspan="2">SYSDATE</td>
								<td rowspan="2" colspan="3"></td>

							</tr>
							<tr>
								<td>?????????</td>
								<td colspan="2">SYSDATE</td>



							</tr>
							<tr>
								<td>??????</td>
								<td colspan="5">?????? ?????????</td>
							</tr>
							<tr style="background: lightgray;">
								<td>NO</td>
								<td>??????</td>
								<td>?????????</td>
								<td>??????</td>
								<td>????????????</td>
								<td>??????</td>
							</tr>
							<tr>
								<td>1</td>
								<td>??????</td>
								<td>LG 36?????? TV</td>
								<td>2</td>
								<td>1000000</td>
								<td>2000000</td>
							</tr>
							<tr>
								<td colspan="2">??? ??????</td>
								<td colspan="4"><a style="float: right;">2000000 ???</a></td>
							</tr>
							<tr>
								<td colspan="6" rowspan="6">
									<div class="txtArea">
										<a>????????? ?????? ?????? ????????? ????????? ?????? ????????????.</a> <br> <br> <br>
										<br> <a>-??? ???-</a><br> <br> <br> <a>SYSDATE</a>&nbsp;
										<a>OOOO</a> <a>???????????? ??????</a>&nbsp; <a>????????? ???</a> <a>????????? ???????????????
											????????? <br>????????? ???????????? ????????? ????????????.
										</a>

									</div>
								</td>
							</tr>

						</table>
					</div>

				</form>
			</div>
		</div>
	</section>
	<script>
		$(function() {
			$("#plusBtn")
					.click(
							function() {

								var cnt = $("#gg tr").last().children().text();
								cnt *= 1;
								cnt += 1;
								console.log(cnt);

								var plusTable = "<tr>";
								plusTable += "<td>" + cnt + "</td>"
								plusTable += "<td> <div class='ui input'> <input class='txt2' type='text'> </div> </td>"
								plusTable += "<td> <div class='ui input'> <input class='txt3' type='text'> </div> </td>"
								plusTable += "<td> <div class='ui input'> <input class='txt2' type='text'> </div> </td>"
								plusTable += "<td> <div class='ui input'> <input class='txt2' type='text'> </div> </td>"
								plusTable += "<td> <div class='ui input'> <input class='txt2' type='text'> </div> </td>"
								plusTable += "</tr>"
								var n = $("#gg");

								n.append(plusTable);

							})
			$("#category").change(function() {
				var str = $(this).val();

				console.log(str);

				if (str == "?????? ?????????") {
					location.href = "writeFixApprove.ap";
				} else if (str == "?????? ?????????") {
					location.href = "writeOrderApprove.ap";
				}

			})

		});
	</script>


</body>
</html>