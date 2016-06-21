<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${resource(dir:'stylesheets',file:'bootstrap.min.css')}" />
        <link rel="stylesheet" href="${resource(dir:'stylesheets',file:'bootstrap-theme.min.css')}" />
        <link rel="stylesheet" href="${resource(dir:'stylesheets',file:'main.css')}" />
        <script src="${resource(dir:'javascripts',file:'jquery.min.js')}"></script>
		<script src="${resource(dir:'javascripts',file:'bootstrap.js')}"></script>
		<title>TaskEditor</title>
	</head>
	<body>
        <g:render template="/common/navbar" />

        <div class="container">
		<h2>Available Projects:</h2>
		<ul>
			<g:each var="p" in="${projects}">
				<li>
					<a href="/project/view/${p.id}">${p.name}</a>
				</li>
			</g:each>
			<hr>
			<button><a href="/project/create">Create new...</a></button>
		</ul>
        </div>
	</body>
</html>
