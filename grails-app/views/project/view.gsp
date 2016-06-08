<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Sample title</title>
	</head>
	<body>
		<h1>${p.name.toUpperCase()}</h1>
		<br>
		<table style="width:100%; border: 1px solid black">
			<tr><g:each var="col" in="${taskMap}"><th>${col[0].name}</th></g:each></tr>
			<tr><g:each var="col" in="${taskMap}"><td>${col[1]*.name}</td></g:each></tr>
		</table>
		<hr>
		<button><a href="/project/edit/${params.id}">Edit...</a></button>
		<button><a href="/project/delete/${params.id}">Delete</a></button>
	</body>
</html>
