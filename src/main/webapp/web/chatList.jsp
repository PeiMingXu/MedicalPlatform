<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,com.xmut.pojo.*"
    pageEncoding="UTF-8" import="com.xmut.utils.Pagination"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="assets/css/font-awesome.min.css" />
  <link rel="stylesheet" href="assets/css/ace.min.css" />
  <link rel="stylesheet" href="css/style.css"/>
<title>用户管理</title>
</head>
<script language="javascript"> 

//选中全选按钮，下面的checkbox全部选中 
var selAll = document.getElementById("selAll"); 
function selectAll() 
{ 
  var obj = document.getElementsByName("checkAll"); 
  if(document.getElementById("selAll").checked == false) 
  { 
  for(var i=0; i<obj.length; i++) 
  { 
    obj[i].checked=false; 
  } 
  }else 
  { 
  for(var i=0; i<obj.length; i++) 
  {   
    obj[i].checked=true; 
  } 
document.getElementById("inverse1").checked=false;
  } 
  
} 

//当选中所有的时候，全选按钮会勾上 
function setSelectAll() 
{ 
var obj=document.getElementsByName("checkAll"); 
var count = obj.length; 
var selectCount = 0; 

for(var i = 0; i < count; i++) 
{ 
if(obj[i].checked == true) 
{ 
selectCount++; 
} 
} 
if(count == selectCount) 
{ 
document.all.selAll.checked = true; 

} 
else 
{ 
document.all.selAll.checked = false; 
} 
} 

//反选按钮 
function notSelectAll() { 
var checkboxs=document.getElementsByName("checkAll"); 
for (var i=0;i<checkboxs.length;i++) { 
  var e=checkboxs[i]; 
  e.checked=!e.checked; 
  setSelectAll(); 
} 
} 

</script>  
<body>

<div class="page-content">
<div class="gys_style">
 <div class="Manager_style">
    <div class="title_name">管理员录入</div>
    <!-- <button type="button" class="btn btn-primary"><a href="insertusers">物资信息录入</a></button> -->
    <button type="button" class="btn btn-primary" title="新建"
											onclick='window.location.href="insertUser"'>
											管理员信息录入
										</button>
   
    </div>
    <div class="search_style">
      <div class="title_names">条件查找</div>
 <!--  <ul class="search_content clearfix">
       <li><label class="lf">物资名称</label><input id="title" name="title" type="text"  class="text_add"/></li>
       
       
       <li style="width:90px;"><button id="btn_search" type="button" class="btn_search" onclick='location.href="findByName?title=getData().value"'>查询</button></li>
      </ul> --> 
      <form class="form-inline"  method="post" action="findByUserType"">
                               <div class="form-group">
							<label for="user_type">仓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;库&nbsp;</label> 
							<c:if test="${!empty allList}">
										<select id="users_type"
								name="type_id" class="form-control" style="margin-left:9px;width:300px;"/>
					
											<c:forEach items="${allList}" var="a" varStatus="st">
												
													<option value="${a.id}">${a.name}</option>
												
											</c:forEach>
										</select>
										</c:if>
							<!-- <input type="text"
								class="form-control" id="users_type"
								name="t_id" /> -->
						</div>
						&nbsp;&nbsp;
                               <button type="submit" class="btn btn-primary" >查找</button>
                              
                          </form> 
                          <br>
  <form class="form-inline"  method="post" action="findByUserName">
                               <div class="form-group">
							<label for="user_name">用户名称</label> <input type="text"
								class="form-control" id="user_name" style="margin-left:9px;width:300px;"
								name="title" />
						</div>
						&nbsp;&nbsp;
                               <button type="submit" class="btn btn-primary" >查找</button>
                              
                          </form> 
                   
    </div>
    
    <div class="Manager_style">
     <span class="title_name">用户信息</span>
<!-- <form  action="delusersAll" method="post"> -->
     <table class="table table-striped table-bordered table-hover">
      <thead>
       <!-- <tr align="center"><th><input type="checkbox" id="selAll" onclick="selectAll();" />全选 
<input type="checkbox" id="inverse1" onclick="notSelectAll();" />反选 <input type="submit" onclick="return confirm('确定进行删除记录操作?')" value="删除"/> </form></th> -->
							<td>序号</td>
							<td>用户ID</td>
							<td>用户名称</td>
							<td>用户账号</td>
							<td>角色</td>
							
							<td>手机</td>
							<td>管理库房</td>
							<td>注册时间</td>
							
							
							<td width="200">操作</td>
						</tr>
						<c:forEach items="${userList}" var="users">
							<c:set var="orderId"  value="${orderId=orderId+1}"/>
							<tr align="center">
							<%-- <td><input type="checkbox" name="checkAll" id="checkAll" onclick="setSelectAll();" value="${users.id}"/></td> --%>
								<td>${orderId}</td>
								<td>${users.id}</td>
								<td>${users.name}</td>
								<td>${users.username}</td>
								<td>${users.role}</td>
								<td>${users.phone}</td>
								<td>${users.wname}</td>
								<td><fmt:formatDate value="${users.register_time}"
										pattern="yyyy-MM-dd" /></td>

								<td>
<a href="userDetail?id=${users.id}"  class="btn btn-primary">详情</a>								 
<a href="updateUser?id=${users.id}"  class="btn btn-primary">修改</a>
<%-- <a href="deluser?id=${users.id}" onclick="return confirm('确定将编号为${users.id}记录删除?')"  class="btn btn-warning">删除</a></td> --%>
								
							</tr>
						</c:forEach>
      </thead>
      
     </table>
  <!--  </form> -->
    <div class="page_style"style="text-align: center">
   	 <c:if test="${page.flay}">
        <a href="?start=0" style="margin-left:5%">首页</a>
        <c:if test="${page.start-page.count >=0 }">
            <a href="?start=${page.start-page.count}" style="margin-left:5%">上一页</a>
        </c:if>
        <c:if test="${page.last - page.start >= 0 }">
            <a href="?start=${page.start+page.count}" style="margin-left:5%">下一页</a>
        </c:if>

        <a href="?start=${page.last}" style="margin-left:5%">末页</a>
        </c:if>
    </div>
   
 <%-- <div class="page_style">
  
  <a href="javascript:void(0)" onclick="form(${pageInfo.hasPreviousPage?pageInfo.prePage:pageInfo.pageNum}" class="icon-caret-left page_btn"></a>
 
  第${page.start}页
  每页${page.count}条
    <a href="javascript:void(0)" onclick="form(${pageInfo.hasNextPage?pageInfo.nextPage:pageInfo.pageNum})" class=" icon-caret-right page_btn"></a>
  
   </div> --%>
  </div> 
 </div>    
</div>


		<script type="text/javascript">
			window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>
<script src="assets/layer/layer.js" type="text/javascript"></script>
<script type="text/javascript">
function getData(){

	document.getElementById("title");

	

	}
function form(pageNum) {
	$("#pageNum").val(pageNum);
	$("#searchForm").submit();
}
$('.Product_Details').on('click', function(){
    layer.open({
        type: 1,
        title: '产品详情',
        maxmin: true,
        shadeClose: true, //点击遮罩关闭层
        area : ['720px' , '500px'],
        content: $('#Product_Details')
    });
}); 
$('.Attribute_btn').on('click', function(){
    layer.open({
        type: 1,
        title: '添加属性',
		shadeClose: true, //点击遮罩关闭层
        area : ['330px' , '180px'],
        content:$('#add_Attributes_style'),
		btn:['提交','取消'],
		yes: function(index, layero){	
		 if($("#shuxin").val()==""){
			  layer.alert('属性名称不能为空!',{
              title: '提示框',								
			  icon:0,			    
			 });
			return false;
               } 
	        else{			  
			  layer.alert('添加成功！',{
               title: '提示框',				
			   icon:1,		
			  }); 
			  layer.close(index);      
		  } 
		
		}
    });
});
$('#Add_Product_btn').on('click', function(){
    layer.open({
        type: 1,
        title: '添加/修噶产品',
		shadeClose: true, //点击遮罩关闭层
        area: ['600px' , ''],
        content: $('#Add_Product_style'),
		btn:['提交','取消'],
		yes: function(index, layero){		
		 if($("#name_text").val()==""){
			  layer.alert('产品名称不能为空!',{
              title: '提示框',								
			  icon:0,			    
			 });
			return false;
               } 
	        else{			  
			  layer.alert('添加成功！',{
               title: '提示框',				
			   icon:1,		
			  }); 
			  layer.close(index);      
		  } 
		}
    })
});
</script>
					


</body>
</html>