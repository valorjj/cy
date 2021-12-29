<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
	body {
   margin-top: 100px;
   font-family: 'Trebuchet MS', serif;
   line-height: 1.6;
   height: 500px;
}

ul.tabs {
   margin: 0px;
   padding: 0px;
   list-style: none;
}

ul.tabs li {
   background: #00a8be;
   color: #222;
   padding: 10px 15px;
   cursor: pointer;
}

ul.tabs li.current {
   background: #00a8be;
   color: #ededed;
}

.tab-content {
   display: none;
   background: #ededed;
   padding: 10px;
   height: 500px;
}

.tab-content.current {
   display: inherit;
}
	
	</style>
</head>
<body>
<%@ include file="../../common/header.jsp"%>
</body>
</html>