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
		<form action="/project/_save">
			Name:<input type="text" name="name" value="${p.name}"> <br>
			<br>
			Status:<input type="text" name="status" value="${p.status}"> <br>
			<br>
			<button>submit</button>
			<input type="hidden" name="id" value="${p.id}"/>
		</form>
		<h1></h1>
	</body>
</html>