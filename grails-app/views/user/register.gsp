<!DOCTYPE html>
<html>
<head>
  <title>HSE - User Registration</title>
  <meta name="layout" content="main" />
  <link rel="stylesheet" href="${resource(dir:'stylesheets',file:'bootstrap.min.css')}" />
        <link rel="stylesheet" href="${resource(dir:'stylesheets',file:'bootstrap-theme.min.css')}" />
        <link rel="stylesheet" href="${resource(dir:'stylesheets',file:'main.css')}" />
        <script src="${resource(dir:'javascripts',file:'jquery.min.js')}"></script>
		<script src="${resource(dir:'javascripts',file:'bootstrap.js')}"></script>
</head>
<body>
<div class = "container">
<g:form class="simpleform" style="width:500px;" controller="user" method="post" action="register">
  
  
  <div class="loginform registerform thumbnail">
        <div class="form-header">
            <h1>Task Editor</h1>
        </div>

        <div class="form-content">
            
               <h2>Регистрация</h2>
            
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <div class="input-group">
              <g:textField class="form-control ${hasErrors(bean:user,field:'username','errors')}" name="username" placeholder="Username" autocomplete="off" />
            </div>
            <div class="input-group">
              <g:passwordField class="form-control ${hasErrors(bean:user,field:'password','errors')}" name="password" placeholder="Password" autocomplete="off" />
            </div>
            <div class="input-group">
              <g:passwordField class="form-control ${hasErrors(bean:user,field:'password','errors')}" name="confirm" placeholder="Confirm" autocomplete="off" />
            </div>

            <div class="input-group">
              <g:textField class="form-control ${hasErrors(bean:user,field:'firstName','errors')}" name="firstName" placeholder="First name" autocomplete="off" />
            </div>

            <div class="input-group">
              <g:textField class="form-control ${hasErrors(bean:user,field:'lastName','errors')}" name="lastName" placeholder="Last name" autocomplete="off" />
            </div>

            <g:submitButton class="button" name="submitButton" value="CREATE ACCOUNT" />
            
            <p>
                Already have an account?
                <g:link controller="user" action="logout">Sign in now!</g:link>
              </p>

        </div>
        <div class="form-footer">
            <img src="http://img1.123freevectors.com/wp-content/uploads/great/line-art-wavy-background-free-vector-648.jpg">
        </div>

      
      
    </div>
</g:form>
</div>        
</body>
</html>