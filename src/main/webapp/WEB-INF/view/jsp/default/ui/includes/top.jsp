<!DOCTYPE html>

<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="en">
<head>
  <meta charset="UTF-8" />
  
  <title>Single Session Cas</title>
  
  <spring:theme code="standard.custom.css.file" var="customCssFile" />
  <link rel="icon" href="<c:url value="/favicon.ico" />" type="image/x-icon" />
  <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <link href="<%= request.getContextPath() %>/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
  <link href="<%= request.getContextPath() %>/css/main.css" rel="stylesheet" type="text/css" />
  
  <!--[if lt IE 9]>
    <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.6.1/html5shiv.js" type="text/javascript"></script>
  <![endif]-->
</head>
<body id="cas" class="bg-black">
 
