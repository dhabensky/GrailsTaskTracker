<!DOCTYPE html>
<html>
<head>
  <title>HSE - Homepage</title>
  <meta name="layout" content="main" />
  <link rel="stylesheet" href="${resource(dir:'stylesheets',file:'bootstrap.min.css')}" />
        <link rel="stylesheet" href="${resource(dir:'stylesheets',file:'bootstrap-theme.min.css')}" />
        <link rel="stylesheet" href="${resource(dir:'stylesheets',file:'main.css')}" />
        <script src="${resource(dir:'javascripts',file:'jquery.min.js')}"></script>
		<script src="${resource(dir:'javascripts',file:'bootstrap.js')}"></script>
</head>
<body>
<div class = "container">
<g:if test="${session?.user}">
    
	<br>
	<a href="/project"><h3>To projects</h3></a>
	<br>
</g:if>
<g:else>
  <g:form class="simpleform" style="width:50%;" controller="user"  method="post" action="login">
      <div class="loginform thumbnail">
          <div class="form-header">
              <h1>Task Editor</h1>
              
              
          </div>
          
          
          <div class="form-content">
              
              <g:if test="${flash.message}">
                  <div class="message">${flash.message}</div>
              </g:if>
              <div class="input-group">
      
                <g:textField class="form-control" name="username" placeholder="Username" autocomplete="off" />
              </div>
              <div class="input-group">

                <g:passwordField class="form-control" name="password" placeholder="Password" autocomplete="off" />
              </div>
              
              <div style="position: relative;">
                <g:submitButton class="button" name="submitButton" value="SIGN IN" />
              </div>
              
              <p>
                
                Don't have an account?
                <g:link controller="user" action="register">Sign up now!</g:link>
              </p>
          </div>
          <div class="form-footer">
              <img src="http://img1.123freevectors.com/wp-content/uploads/great/line-art-wavy-background-free-vector-648.jpg">
          </div>
      
      
      
    </div>
  </g:form>
</g:else>
</div>
</body>
</html>
