<%@page import="dao.user.UserDao"%>
<%@page import="dao.user.FriendDao"%>
<%@page import="dto.LogInSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 일촌으로 등록하는 컨트롤러
int user_no = Integer.parseInt(request.getParameter("user_no"));
int friend_no = Integer.parseInt(request.getParameter("friend_no"));
out.print(FriendDao.getFriendDao().updateFriend(friend_no, user_no));
%>