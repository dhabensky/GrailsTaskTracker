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
        <link rel="stylesheet" href="${resource(dir:'stylesheets',file:'datepicker.css')}" />
        <link rel="stylesheet" href="${resource(dir:'stylesheets',file:'main.css')}" />
        <script src="${resource(dir:'javascripts',file:'jquery.min.js')}"></script>
		<script src="${resource(dir:'javascripts',file:'bootstrap.js')}"></script>
        <script src="${resource(dir:'javascripts',file:'bootstrap-datepicker.js')}"></script>
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
                                    <div id="${t.id}"class="task thumbnail">
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
        
        
        <div class="modal fade" id="createTaskModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <g:form class="simpleform" style="width:100%;" controller="user"  method="post" action="login">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                          <h3 class="modal-title">Create task</h3>
                        </div>
                        <div class="modal-body">

                                <div class="input-group">
                                    <span> Title </span>
                                    <g:textField class="form-control" name="title"  autocomplete="off" />
                                </div>

                                <div class="input-group">
                                    <span> Description </span>
                                    <g:textArea rows="5" class="form-control" name="description" autocomplete="off" />
                                </div>


                                <div class="input-group date" data-provide="datepicker-inline">

                                    <span> Deadline date </span>
                                    <g:textField class="form-control datepicker" name="deadline" autocomplete="off" />
                                </div>

                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
                          <button id="submitCrTask" type="button" class="btn btn-primary">Сохранить изменения</button>
                        </div>
                    </g:form>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->


        <div class="modal fade" id="editTaskModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <g:form class="simpleform" style="width:100%;" controller="user"  method="post" action="login">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                          <h3 class="modal-title">Edit task</h3>
                        </div>
                        <div class="modal-body">

                                <div class="input-group">
                                    <span> Title </span>
                                    <g:textField class="form-control" name="title"  autocomplete="off" />
                                </div>

                                <div class="input-group">
                                    <span> Description </span>
                                    <g:textArea rows="5" class="form-control" name="description" autocomplete="off" />
                                </div>


                                

                                <div class="input-group date" data-provide="datepicker-inline">

                                    <span> Deadline date </span>
                                    <g:textField class="form-control datepicker" name="deadline" autocomplete="off" />
                                </div>

                                <div class="input-group">
                                    <span> Column </span>
                                    <div class="container-fluid">
                                    <div class="row">

                                        <g:radioGroup name="myGroup" values="[1,2,3]" value="1" >
                                            <div class="col-xs-4 column-picker">
                                                   ${it.radio}
                                            </div>
                                        </g:radioGroup>
                                    </div>
                                </div>
                                </div>

                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
                          <button id="submitCrTask" type="button" class="btn btn-primary">Сохранить изменения</button>
                        </div>
                    </g:form>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->


        
        <script>
            $('.datepicker').datepicker();

            $( ".add-task-button" ).click(function() {
                var columnID = $(this).attr('id');
                
                $('#createTaskModal').modal({
                  });
                  
                	
                $( "#submitCrTask").unbind( "click" );  
                  
                $('#submitCrTask').click(function() {
                    console.log(columnID);
                    $('#myModal').modal('hide');

                })
                
            });

            $('.task').click(function() {
                $('#editTaskModal').modal({
                  });


            });
        </script>
        
		
	</body>
</html>
