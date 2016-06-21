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
		<title>${p.name}</title>
	</head>
	<body>
        


        <g:render template="/common/navbar" /></div>    



        
        <div class="container">
            <div class="project-header">
                <span class='title'>${p.name}</span>
                <span><a href="/project/edit/${params.id}">edit</a></span>
                <span><a href="/project/delete/${params.id}">delete</a></span>
            </div>
            <div class="row">
                <g:each var="col" in="${taskMap}">
                    <div class="col-xs-4">
                        <div class="thumbnail task-column">
                            <div class="column-header">
                                ${col[0].name.toUpperCase()}
                            </div>
                            <hr>
                            <div class="tasks">
                                <g:each var="t" in="${col[1]}">
                                    <div class="task thumbnail">
                                        <p>${t.name}</p>
                                    </div>
                                </g:each>
                                
                            </div>
                            <hr>
                            <div id="${col[0].id}" class="add-task-button">
                                <span>Add a new task</span>
                            </div>
                        </div>
                    </div>
                </g:each>
            </div>
        </div>
        
        
        <script>
            $( ".add-task-button" ).click(function() {
                
                alert( $(this).attr("id"));
            });
        </script>
        
		
	</body>
</html>
