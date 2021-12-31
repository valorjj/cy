<%@page import="dao.user.UserDao"%>
<%@page import="dto.LogInSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
LogInSession logInSession = (LogInSession) session.getAttribute("logIn");
String id = logInSession.getUser_id();

String newname	= request.getParameter("newname");
String newpassword	= request.getParameter("newpassword");
String newphone	= request.getParameter("newphone");

System.out.println(  newname  );
System.out.println(  id  );

	
if( newname !=null ){
	boolean result = UserDao.getUserDao().userUpdate( "user_name", newname , id);
		if( result ){ out.print("1"); }
		else{ out.print("0"); } 
}

if( newpassword !=null ){
	boolean result = UserDao.getUserDao().userUpdate( "user_password", newpassword , id);
		if( result ){ out.print("1"); }
		else{ out.print("0"); } 

}


if( newphone !=null ){
	boolean result = UserDao.getUserDao().userUpdate( "user_phone", newphone , id);
		if( result ){ out.print("1"); }
		else{ out.print("0"); } 

}

	
%>