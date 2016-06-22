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
                                    <div id="${t.id}" class="task thumbnail">
                                        <p>${t.name}</p>
                                    </div>

                                </g:each>
                                
                            </div>
                            

                            <g:if test = '${col[0].name.toUpperCase()=="TODO"}'>
                                <hr>
                                <div id="${col[0].id}" class="add-task-button">
                                    <span>Add a new task</span>
                                </div>
                            </g:if>


                        </div>
                    </div>
                </g:each>
            </div>
        </div>
        
        
        <div class="modal fade" id="createTaskModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <g:form class="simpleform" style="width:100%;" controller="task"  method="post" action="_new">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                          <h3 class="modal-title">Create task</h3>
                        </div>
                        <div class="modal-body">
                                <g:hiddenField name="project_id" value="${p.id}" />

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

                                <g:hiddenField name="column_id" value="${taskMap[0][0].id}" />

                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
                          <g:submitButton id="submitCrTask" class="btn btn-primary" onSubmit="return confirm" name="submitButton" value="Сохранить изменения" />
                        </div>
                    </g:form>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->


        <div class="modal fade" id="editTaskModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    
                        <div class=" modal-header">
                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                          <h3 class=" modal-title">Edit task</h3>


                          <g:form  class="edit-header-modal" style="width:100%;" controller="task"  method="post" action="_close">
                            <div id="edit-header-modal">
                              <g:hiddenField name="id" value="0" />
                              <g:hiddenField name="project_id" value="${p.id}" />
                            </div>
                              <div style="display: inline-block">
                                <g:submitButton id="closeTask" class="btn btn-danger" name="submitButton" value="Close task" />
                              </div>
                           </g:form>


                        </div>
                        <g:form class="simpleform" style="width:100%;" onSubmit="return checkdate()" controller="task"  method="post" action="_save">
                        <div id="edit-modal" class="modal-body">

                                <g:hiddenField name="id" value="0" />

                                <g:hiddenField name="project_id" value="${p.id}" />


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

                                        <g:radioGroup name="column_id" labels="[taskMap[0][0].name.toUpperCase(), taskMap[1][0].name.toUpperCase(), taskMap[2][0].name.toUpperCase()]" 
                                        values="[taskMap[0][0].id, taskMap[1][0].id, taskMap[2][0].id]" value="taskMap[0][0].id" >

                                            <div class="col-xs-4 column-picker">

                                                   ${it.radio}<br>
                                                   <span style="width: 100%; text-align:center; font-weight: bold">${it.label}<span>
                                                   
                                            </div>
                                        </g:radioGroup>
                                    </div>
                                </div>
                                </div>

                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
                          <g:submitButton id="submitEdTask"  class="btn btn-primary" name="submitButton" value="Сохранить изменения" />
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
                    var id = $(this).attr('id');
                    $.ajax({
                        url: "/task/view",
                        type:"post",

                        //dataType: 'json',
                        data:{ id: id},
                        success: function(data) {
                            console.log(data); //<-----this logs the data in browser's console
                            var task = jQuery.parseJSON( data );
                            $('#editTaskModal').modal();
                            $('#edit-header-modal').find("input#id").val(id);
                            $('#edit-modal').find("input[name = id]").val(id);
                            $('#edit-modal').find("input#title").val(task.name + "");
                            $('#edit-modal').find("textarea#description").val(task.description + "");
                            $('#edit-modal').find("input#deadline").val(task.deadline + "");
                            $('#edit-modal').find("input[name = column_id][value=" + task.column_id + "]").attr('checked', true);
                        },
                        error: function(xhr){
                            alert(xhr.responseText); //<----when no data alert the err msg
                        }
                    });
                    
                    $('#editTaskModal').modal({
                     });
                    
                    $( "#submitEdTask").unbind( "click" );  
                  
                    $('#submitEdTask').click(function() {
                        $('#myModal').modal('hide');

                    })
            });

            var checkdate = function() {
                var date = $('#edit-modal').find("input#deadline").val();
                var arr = date.split("/");
                console.log(arr);
                if (arr.size() != 3) return false;
                $.each(arr, function( index, value ) {
                    console.log(value);
                    if(value.match(/^\d+$/)){
                        return false;
                    }
                });
                console.log(arr);
                return true;
            }
        </script>
        
		
	</body>
</html>
