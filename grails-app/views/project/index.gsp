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
		<h2>Available Projects:</h2>
		<ul>
			<g:each var="p" in="${projects}">
				<li>
					<a href="/project/view/${p.id}">${p.name} [${p.status}]</a>
				</li>
			</g:each>
			<hr>
			<button><a href="/project/create">Create new...</a></button>
		</ul>
	</body>
</html>
