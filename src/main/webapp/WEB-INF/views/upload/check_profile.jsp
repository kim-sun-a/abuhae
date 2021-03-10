<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
    <title>UploadTest</title>
    <style type="text/css">
    	img {
	width: 30px;
	height: 30px;
	border-radius: 50%;
}
    </style>
</head>

<body>
    <h1>upload test</h1>
    
    <h2>원본 이미지</h2>
    <img src="${item.fileUrl}" width="240" />
    
</body>

</html>