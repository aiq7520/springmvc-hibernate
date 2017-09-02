<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link   type="text/css" rel="stylesheet" href="css/01.css"/>
<link   type="text/css" rel="stylesheet" href="css/set_8.css"/>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	var index = "${i}"; 
	function dlist(){
		var dlist; 
		$.ajax({
			   type: "POST",
			   async:false,
			   url: "${pageContext.request.contextPath}/dlist.do",
			   success: function(msg){
				   dlist= msg;
				   }
			   });
		return dlist;
	}
	var dlist = dlist();
	console.log(dlist)
	//初始化页面数据
	function initDatas(i){
		if(i==-1)index--;
		if(i==1)index++;
		index = index<0?0:index;
		$.ajax({
			   type: "POST",
			   url: "${pageContext.request.contextPath}/list.do?i="+index,
			   success: function(msg){
			    	var emps = msg;
		    		$("tbody").html("");
			    	$.each(emps, function(index,emp){
			    			var str ="<tr>";
			    				str+="<td>"+emp['id']+"</td>"
			    				str+="<td>"+emp['department']['name']+"</td>"
			    				str+="<td>"+emp['name']+"</td>"
			    				str+="<td>"+emp['age']+"</td>"
			    				str+="<td>"+emp['salary']+"</td>";
			    				str+="<td  width='50px'>  <a class='tweet-touch' onclick='editEmp(this)'></a></td>";
			    				str+="<td width='50px' >  <a class='linkedin-touch' onclick='deleteEmp("+emp['id']+");'></a></td>";
			    				str+="</tr>"
			    			$("tbody").append(str);
			    			$("td").hover(function () {$(this).addClass("over").siblings().addClass("bover");},
			    					function () {$(this).removeClass("over").siblings().removeClass("bover");}
			    			);
			    		});
			    	}
			   });
	}
	
	function deleteEmp(id){
		$.ajax({
			   type: "POST",
			   url: "${pageContext.request.contextPath}/"+id+"/deleteEmp.do",
			   success: function(msg){
				   initDatas();
				   $('#msg').text(msg).fadeTo(2000, 0.70,"linear",function(){$(this).hide()});//显示删除信息
			   }
			   })
	}
	
	function editEmp(tag){//编辑
		 $("#empform :input").each(function(i,n) {//将之前所有的input变为text 遍历input
			 var val = $(n).val();
			if(val=='')
			$(n).parent().html("<a class='tweet-touch' onclick='editEmp(this)'></a>");
			else
			$(n).parent().html(val);
		 });
		 //<select name='department.id'><option value='' ></option></select>
		// var dlist = window.dlist();//获取部门
		 var departmentSelect = "<select name='department.id'>"
		 console.log(dlist)
		 $.each(dlist,function(i,d){
			 console.log(dlist[i])
			 console.log(d)
			 departmentSelect+="<option value='"+d['id']+"' >"+d['name']+"</option>";
		 });
		 departmentSelect+="</select>";
		 $(tag).after("<input  class ='sunmit save-touch' type='submit' value=''>");
		  $(tag).parent().siblings("td").each(function(i,n) {// 获取当前行的其他单元格
			  if(i==0)$(this).append("<input type='hidden' name='id'  value='"+$(this).text()+"'>");
		  	  if(i==1)$(this).html(departmentSelect);
			  if(i==2)$(this).html("<input type='text' name='name'  value='"+$(this).text()+"'>");
			  if(i==3)$(this).html("<input type='text' name='age' value='"+$(this).text()+"'>");
			  if(i==4)$(this).html("<input type='text' name='salary' value='"+$(this).text()+"'>");
		 })
		 $(tag).hide();
	}
	$(function(){
		if("${message}")$('#msg').text("${message}").fadeTo(2000, 0.70,"linear",function(){$(this).hide()});//显示删除信息
		initDatas();
	}) 
	function newEmps(button){
			 $("#selectdanme").html("");
			 $.each(dlist,function(i,d){
				$("#selectdanme").append("<option value='"+d['id']+"' >"+d['name']+"</option>");
			 });
			$("#newemps").show();
			$(button).hide();
	}
	function hideNewEpmsFrom(){
		$(".set_8_button").show();
		$("#newemps").hide();
	}
</script>
<style type="text/css">
span{color:highlight;font-weight:bold;}
.pre{float: left;margin-left:50px }
.next{float: right;margin-right:50px}
#foold{margin: 20px 5%}
</style>
</head>
<body class="background-2">
	<h2>员工信息表</h2>
	<div id="msg"></div>
<form id="empform"  method="post" action="${pageContext.request.contextPath}/save.do">
	<table>
		<thead>
			<tr>
				<th>id</th>
				<th >dname</th>
				<th>name</th>
				<th>age</th>
				<th>salary</th>
				<th>edit</th>
				<th>delete</th>
			</tr>
		</thead>
		<tbody class="social-touch">
		</tbody>
		<tfoot>
		</tfoot>
	</table>
</form>
<div id="foold" >
		<form action="${pageContext.request.contextPath}/save.do" style="display: none"
		 class="social-touch" method="post" id='newemps'>
			<font> dname:</font><select name='department.id' id='selectdanme'></select>
			<font>name:</font><input name='name' value=''>
			<font>age:</font><input name='age' value=''>
			<font>salary:</font><input name='salary'>
			<input  class ='sunmit save-touch' type='submit' value=''>
			<a class=' linkedin-touch' onclick='hideNewEpmsFrom();'></a>
		</form>
	<span class="lines"></span>
	<div class="set_button set_8_button outline" onclick="newEmps(this);">new emp<span class="lines"></span></div>
	<span class="pre" onclick="initDatas(-1)">pre</span>
	<span class="next" onclick="initDatas(1)" >next</span>
</div>
</body>
</html>