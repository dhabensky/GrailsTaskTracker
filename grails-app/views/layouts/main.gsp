<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'syrose.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <link rel="stylesheet" href="${resource(dir:'stylesheets',file:'bootstrap.min.css')}" />
        <link rel="stylesheet" href="${resource(dir:'stylesheets',file:'bootstrap-theme.min.css')}" />
        <link rel="stylesheet" href="${resource(dir:'stylesheets',file:'main.css')}" />
        <script src="${resource(dir:'javascripts',file:'jquery.min.js')}"></script>
		<script src="${resource(dir:'javascripts',file:'bootstrap.js')}"></script>
  <g:layoutHead />
</head>
<body>
    <div id="wrapper">


        <!-- username | logout link -->
        <g:if test="${session?.user}">
            <g:render template="/common/navbar" />  
        </g:if>
        <!-- END #nav -->
  
  
        <div id="content">
            
             <g:layoutBody />
        </div>
        <!-- END #content -->
    </div>
    <!-- END #wrapper -->
</body>
</html>