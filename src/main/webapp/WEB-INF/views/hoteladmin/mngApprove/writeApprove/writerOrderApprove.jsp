<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
	
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>HotelsCompile</title>
<link href="${ contextPath }/resources/css/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="${ contextPath }/resources/js/datepicker.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<!-- Korean language -->
<script src="${ contextPath }/resources/js/datepicker.kr.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>



.tbl_wrap .tbl {
   
    border-collapse: collapse;
    width:1100px;
    text-align: center;
    height:250px;
    margin-top:10px;
    margin-left:auto;
   margin-right:auto;
}



.tbl_wrap .tbl td, th {
     border: 1px solid lightgray;
      text-align: center;
}
.tbl_wrap .tbl th{
   background-color: #f7f7f7;
   color: #005B9E;
   }
.tbl_wrap .tbl td {
   padding:10px;
}
#txtLong, #txtLong_price {
   border-radius:3px;
   border:1px solid lightgray;
   height:30px;
   width:600px;
}
#txt {
   border-radius:3px;
   border:1px solid lightgray;
   height:24px;
   width:200px;
}
select {
   width:200px;
   height:24px;
   border-radius:3px;
}
textarea {
   width:600px;
   height:200px;
}

.tbl2_wrap {
   margin-top:-0px;
   width:1100px;
   margin-left:auto;
   margin-right:auto;
}
.tbl2_wrap .payTbl {
   
    border-collapse: collapse;
    width:1100px;
    text-align: center;
    height:40px;
    margin-top:14px;
    margin-left:auto;
    margin-right:auto;
}



.tbl2_wrap .payTbl td, th {
     border: 1px solid lightgray;
      text-align: center;
}
.tbl2_wrap .payTbl th{
   background-color: #f7f7f7;
   color: #005B9E;
   }
.tbl2_wrap .payTbl td {
   padding:10px;
}
.noTxt {
   width:120px;
}
.anoTxt, .anoTxt_amount, .anoTxt_vos, .anoTxt_price, .anoTxt_name {
   border-radius:3px;
   height:22px;
   border:1px solid lightgray;
   width:110px;
}
.vos, .totalPrice {
   border-radius:3px;
   height:22px;
   border:1px solid lightgray;
   width:110px;
   text-align:center;
}
.anoTxt_cate {
   border-radius:3px;
   height:22px;
   border:1px solid lightgray;
   width:110px;
}

#plusBtn2 {
   width:80px;
   height:30px;
   border-radius:2px;
   border:1px solid #3498DB;
   background:#3498DB;
   color:white;
   float:right;
}
.tbl2_wrap .payTbl .Area {
   width:1100px;
   margin-left:auto;
   margin-right:auto;
}
 #submit {
   border:1px solid #3498DB;
   background:#3498DB;
   color:white;
   height:35px;
   width:70px;
   border-radius:2px;
}
#pre {
   border:1px solid lightgray;
   background:lightgray;
   color:white;
   height:35px;
   width:70px;
   border-radius:2px;
}
.resultBtnPur {
   float:right;
   
}
.inArea {
   width:1100px;
   height:auto;
   margin-left:auto;
   margin-right:auto;
   margin-top:45px;
}
#selectVos {
   border-radius:2px;
   border:1px solid lightgray;
   background:white;
}
#btn {
   width:60px;
   height:35px;
   border-radius:2px;
   border:1px solid lightgray;
}
#docuNo {
   border-radius:2px;
   height:30px;
   text-align:center;
   border:1px solid lightgray;
}
.docuNumber {
	height:35px;
	border-radius:2px;
}
.orderTxt {
	width:120px;
	height:auto;
	border:0px;
	text-align:center;
	
}

</style>
</head>
<body>
<header>
			<jsp:include page="../../common/menubar.jsp" />
	
</header>

	<section>
	
	<div class="tbl_wrap purchase">
		<div class="inArea">
		<form action="insertOrder.ap" method="get">
	<div class="resultBtnPur">
				<button id="submit" type="button" onclick="insertPur();">????????????</button>
			</div>
	
	<table class="tbl">
				<colgroup>
					<col width="20%">
					<col width="30%">
					<col width="20%">
					<col width="30%">
					
				</colgroup>

				<tr>
					<th colspan="4">?????? ?????????</th>
					
					
				</tr>
				<tr class="tbl_tit">
					<td>????????????</td>
					<td style="text-align:center;"><input type="text" name="docno" id="docuNo" readonly></td>
					<td>?????? ?????????</td>
					<td>
						<input type="text" id="insertDate" placeholder="???????????? ????????? ??????????????????" style="width:200px; text-align:center; border-radius:2px; border:1px solid lightgray; height:25px;" autocomplete="off" >
						<input type="hidden" id="orderDate" name="orderDate" value="">
					</td>
					
					
				</tr>
				<tr class="tbl_tit">
					<td>????????????</td>
					<td>?????????</td>
					<td>?????????</td>
					<td><c:out value="${sessionScope.loginUser.userName }"/><input type="hidden" value="${sessionScope.loginUser.mno }" name="mname"></td>
					
				</tr>
				
				<tr class="tbl_tit">
					<td>?????????</td>
					<td><input type="text" id="txt" placeholder="SYSDATE" name="rptDate" style="text-align:center;" readonly></td>
					<td >?????????</td>
					<td colspan="">
					<c:forEach var="b" items="${list }">
					<input type="hidden" id="snameTxt" value="${b.STF_ID }" name="sname"><c:out value="${b.NAME}"/>(<c:out value="${b.STF_ID }"/>)</p>
					 </c:forEach>
					</td>
					
				</tr>
				<tr>
					<td>??????</td>
					<td colspan="3"><input type="text" id="txtLong" name="title" style="text-align:center;" autocomplete="off" ></td>
				</tr>
				<tr>
					<td>??????</td>
					<td colspan="3">
						<textarea style="resize:none; text-align:center;" id="content" name="content"></textarea>
					</td>
				</tr>
				
			</table><br><br>
			
			<div class="tbl2_wrap">
				<select class="docuNumber" name="docuNos">
				
					<option selected disabled hidden>??????????????? ??????????????????</option>
					<c:forEach var="b" items="${listDocu }">
						<option><c:out value="${b. DOC_NO}"/></option>
					</c:forEach>
				</select>
			<table class="payTbl purchase">
				<colgroup>
					<col width="5%">
	               <col width="15%">
	               <col width="20%">
	               <col width="15%">
	               <col width="15%">
	               <col width="15%">
	               <col width="15%">
					
				</colgroup>
				<tr class="tempOrder">
					<th>??????</th>
					<th>?????????</th>
					<th>?????????</th>
					<th>?????????</th>
					<th>????????????</th>
					<th>??????</th>
					<th>??????</th>
				</tr>
				
				
			</table>
			<table class="payTbl Area" >
			<colgroup>
				<col width="10%">
               <col width="15%">
               <col width="30%">
               <col width="15%">
               <col width="15%">
               <col width="15%">
					
				</colgroup>
				<tr>
					<td colspan="2" id="total">?????????</td>
					<td colspan="5"><input type="text" id="txtLong_price" style="text-align:center;" name="totPrice" autocomplete="off" ></td>
				</tr>
			</table>
			</div>
			</form>
			</div>
</div>
<div style="height:200px;">
	
</div>
</section>
<script>
   
   
   var cntTable = "";
   var date = "";
   
   $(document).ready(function(){
      //var docuNum = 
      var now = new Date();
       var year = now.getFullYear();
       var month = now.getMonth() + 1;    //1?????? 0?????? ??????????????? +1??? ???.

       if((month + "").length < 2){        //2????????? ????????? 0??? ?????????.
           month = "0" + month;
       }
        // ""??? ?????? year + month (??????+??????) ???.. ex) 2018 + 12 = 2030??? ?????????.
       var today = ""+year + month; 
      var random = Math.floor(Math.random() * 100000) + 1;
      var docuNum = today.concat(random);
      //var docuNum = 
      
      
      
      //$(".tbl tr").children().find(".txt_docu").val(docuNum);
      //$(".txt_docu").text(docuNum);
            
      startDate();
      $(".tbl tr:nth-child(2)").children().eq(1).find("#docuNo").val(docuNum);
      //$(this).itemPur(cntTable);
      
      var plus = 1;
      
      $("#btn").click(function(){
         var tblCount = $(".payTbl.purchase tr").length;
         var lprice = (tblCount-1);
         
         var totalCount = "";
         var totalPrice = "";
         for(var i = 0; i < lprice; i++) {
            if(i == 0) {
               totalPrice = $(".payTbl.purchase tr").eq(i+1).children().find('.totalPrice').val()*1;
            }else {
               totalPrice += $(".payTbl.purchase tr").eq(i+1).children().find('.totalPrice').val()*1;
            }
            
         }
            
         $(".payTbl.Area tr").children().find("#txtLong_price").val(totalPrice);
         
         
         
         
         
      
      
      }) 
         
         $("#plusBtn2").click(function() {
      
            
      function preWatch() {
         
      }
         

         
      
   })
   

   date = new Date;
	checkIn = $("#insertDate").datepicker({
		autoClose : true,
		//????????? ????????? ?????????
		onSelect : function(date) {
			endNum = date;
		}
	}).data('datepicker');
	
   
   
   
   
   });
   
		
		
   //onload???   
   
   var dnum = 0;
   //???????????? ?????????
   $(document).on("change", ".docuNumber", function(){
	   $(".payTbl.purchase tr:not(:first-child)").remove();
	  dnum = $(this).val(); 
	  var totPrice = 0;
	  console.log(totPrice);
	  //console.log(va);
	  
	  //ajax??????
	  $.ajax({
		  url:"selectOrderInfo.ap",
		  type:"get",
		  data:{
			dnum:dnum	  
		  },
		  success:function(data){
			  console.log(data.list);
			  
			  $.each(data.list, function(index, list){
				  console.log(list.INAME);
				  var priceBefore = list.VOS * list.AMOUNT;
				  var price = priceBefore*1;
				  console.log(list.VOS);
				  $(".payTbl.purchase").find(".tempOrder").after("<tr class='repeatOrder'><td><input class='orderTxt' type='text' value='"+ list.ITYPE + "' name='type'></td><td><input class='orderTxt' type='text' value='" + list.CNAME + "' name='cname'></td><td><input class='orderTxt' type='text' value='" + list.MFG + "' name='mfg'></td><td><input class='orderTxt' type='text' value='" + list.INAME + "' name='iname'><input type='hidden' value='" + list.INO +"' name='ino'></td><td><input class='orderTxt' type='text' value='" + list.VOS +"' name='vos'></td><td><input class='orderTxt' type='text' value='" + list.AMOUNT + "' name='amount'></td><td><input class='orderTxt' type='text' value='" + price + "' name='price'><input type='hidden' name='rsn' value='" + list.PRSN +"'></td></tr>");
			 	  if(index == 0) {
			 		  totPrice = price;
			 	  }else {
			 		  totPrice += price;
			 	  }
			  
			  });
			  $(".payTbl.Area").find("#txtLong_price").val(totPrice);
			  
			  
		  		
			  
			  
		  
		  },
		  error:function(data){
			  
		  }
	  });
	  //ajax???
	  
   });
   
   
   
   
   
   //???????????? ?????????
     var dateString = ""; 
   function startDate() {
      //console.log("??????");
      var date;
       date = setInterval(function () { 
             
            dateString = "";
               var newDate = new Date(); 

               //String.slice(-2) : ???????????? ????????? 2????????? ????????????. (????????? ?????????) 
               dateString += newDate.getFullYear() + "/"; 
               dateString += ("0" + (newDate.getMonth() + 1)).slice(-2) + "/"; //?????? 0?????? ??????????????? +1??? ????????? ??????. 
               dateString += ("0" + newDate.getDate()).slice(-2) + " "; 
               dateString += ("0" + newDate.getHours()).slice(-2) + ":"; 
               dateString += ("0" + newDate.getMinutes()).slice(-2) + ":"; 
               dateString += ("0" + newDate.getSeconds()).slice(-2);
               //document.write(dateString); ????????? ?????? ?????? ??? ??????. 
              //console.log(dateString);
           }, 1000);
       
      
   }
   
   
   
      /* insert?????? */
      function insertPur() {
          clearInterval(startDate());
          console.log(dateString);
          var idate = $("#insertDate").val();
         
          $("#orderDate").val(idate);
          
         $(".tbl tr:nth-child(4)").children().eq(1).find("#txt").val(dateString);
         
         
         $("#submit").attr("type","submit");
         
         var cnt = $(".payTbl.purchase tr:not(:first)").length;
         if($("#txtLong").val() == "" || $("#content").val() == "" || $("#noTxt").val() == "" ||
               $("#anoTxt_cate").val() == "" || $("#anoTxt_name").val() == "" || $("#anoTxt_amount").val() == "" || 
               $("#anoTxt_vos").val() == "" || $("#anoTxt_price").val() == "" || $(".payTbl.purchase tr:not(:first) td").find('input').val() == "") {
            alert("????????? ???????????????!");
         }
         var p = $(".payTbl.purchase tr:not(:first)").find('input').val();
      
      
             
             
             
         
      }
      
      
   
   
   var iname = "";
   var madeComName = "";
   //?????? 
   
      
   
         
      
      
      
</script>



</body>
</html>