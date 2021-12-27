<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

// dsub_no 만 가져오면 끝입니다.

int dsub_no = Integer.parseInt(request.getParameter("dno"));

System.out.println("dsub_no 는 : " + dsub_no + "입니다. ");

%>