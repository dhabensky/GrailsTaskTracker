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
		<h1>New project</h1>
		<g:form controller="project" action="_new" onSubmit="return checkform()" class="dddd"> 
            <h2>Project name</h2>
            <g:textField id="title-form" class="form-control" name="name" required autocomplete="off" />
            <g:submitButton class="btn btn-primary"  name="submitButton" value="Создать проект" />
        </g:form>
        
        <script>
            var checkform = function(){
                console.log($("#title-form").val());
                if ($("#title-form").val().size() == 0) return false
                else return false
            }
        </script>
	</body>
</html>
