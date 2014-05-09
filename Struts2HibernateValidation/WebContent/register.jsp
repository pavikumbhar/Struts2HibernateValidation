<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Struts2 Bootstrap-<s:text name="showcase.version"/>- Validation Examples</title>
    <meta charset="utf-8"/>
  
        <meta name="keywords" content="struts2, twitter, bootstrap, plugin, showcase" />
    <meta name="description" content="A Showcase for the Struts2 Bootstrap Plugin" />
    

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    
 
    <sj:head jqueryui="false"/>
   
    <sb:head includeScripts="true" includeScriptsValidation="false" includeStylesResponsive="true"/>
    </head>
    
      <style type="text/css">
        body {
            padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
        }
        
        
   @media (max-width: 767px) {
  .table-responsive {
    width: 100%;
    margin-bottom: 15px;
    overflow-x: scroll;
    overflow-y: hidden;
    -webkit-overflow-scrolling: touch;
    -ms-overflow-style: -ms-autohiding-scrollbar;
    border: 1px solid #ddd;
  }
  .table-responsive > .table {
    margin-bottom: 0;
  }
  .table-responsive > .table > thead > tr > th,
  .table-responsive > .table > tbody > tr > th,
  .table-responsive > .table > tfoot > tr > th,
  .table-responsive > .table > thead > tr > td,
  .table-responsive > .table > tbody > tr > td,
  .table-responsive > .table > tfoot > tr > td {
    white-space: nowrap;
  }
  .table-responsive > .table-bordered {
    border: 0;
  }
  .table-responsive > .table-bordered > thead > tr > th:first-child,
  .table-responsive > .table-bordered > tbody > tr > th:first-child,
  .table-responsive > .table-bordered > tfoot > tr > th:first-child,
  .table-responsive > .table-bordered > thead > tr > td:first-child,
  .table-responsive > .table-bordered > tbody > tr > td:first-child,
  .table-responsive > .table-bordered > tfoot > tr > td:first-child {
    border-left: 0;
  }
  .table-responsive > .table-bordered > thead > tr > th:last-child,
  .table-responsive > .table-bordered > tbody > tr > th:last-child,
  .table-responsive > .table-bordered > tfoot > tr > th:last-child,
  .table-responsive > .table-bordered > thead > tr > td:last-child,
  .table-responsive > .table-bordered > tbody > tr > td:last-child,
  .table-responsive > .table-bordered > tfoot > tr > td:last-child {
    border-right: 0;
  }
  .table-responsive > .table-bordered > tbody > tr:last-child > th,
  .table-responsive > .table-bordered > tfoot > tr:last-child > th,
  .table-responsive > .table-bordered > tbody > tr:last-child > td,
  .table-responsive > .table-bordered > tfoot > tr:last-child > td {
    border-bottom: 0;
  }
}
        
    </style>
</head>
<body>
<div class="navbar  navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
               <span class="sr-only">Menu</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
            </a>
            <a class="brand" href="#">Struts2 Bootstrap - <s:text name=""/></a>

            <div class="nav-collapse" >
                <ul class="nav">
                    <s:url var="index_url" action="index"/>
                    <li class="active"><s:a href="%{index_url}">Home</s:a></li>
                    <s:url var="about_url" action="about"/>
                    <li><s:a href="%{about_url}">About</s:a></li>
                    <li><a href="http://code.google.com/p/struts2-bootstrap/">Project</a></li>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="row-fluid">
        <div class="span3">
          
        </div>
       <div class="span7">

            <h1>Client Validation</h1>

            <p>Struts2 Bootstrap Plugin Example with Client Validation.</p>

            <s:actionerror theme="bootstrap"/>
            <s:actionmessage theme="bootstrap"/>
            <s:fielderror theme="bootstrap"/>

             
            <s:form id="validationForm" action="saveOrUpdate" theme="bootstrap" cssClass="well form-horizontal" label="A sample Registration Form">
                               
                 <s:hidden name="user.id" />
                 
                 <s:textfield key="user.name"
                             label="Username"
                            requiredLabel="true"
                            inputPrependIcon="user"
                            tooltip="Enter your Username here"
                             />
                            
                           
           
                <s:password 
                        label="Password"
                        key="user.password"
                        requiredLabel="true"
                        tooltip="Enter your Password here"/>
                        
                        <s:select list="{'Male','Female'}"
                                  headerKey=""
		                          key="user.gender" 
		                          headerValue="Select" 
		                          label="Gender"
		                          tooltip="Select your Gender"/>
		                          
		         <s:select list="{'India','USA','UK'}" 
		                   headerKey=""
		         		   key="user.country" 
		                   headerValue="Select" 
		                   label="Country"
		                   tooltip="Select your Country" />
		         
	            <s:textarea key="user.aboutYou" 
	                        cols="20"
                            rows="3"
                            tooltip="Select your Country"/> 
                            
                <s:checkbox key="user.mailingList"
               				label="Would you like to join our mailing list?" 
               				tooltip="Confirmed that you accept the Agreement"/>               
		                  
		                  
		                          
		

               
                <div class="form-actions">
                    <sj:submit cssClass="btn btn-success" formIds="validationForm" validate="true" validateFunction="bootstrapValidation " />
                     <s:reset cssClass="btn btn-inverse"  />
                </div>

            </s:form> 
            
     <s:if test="userList.size() > 0">
	<div class="table-responsive">
	<table class="table table-hover table-bordered " >
	<thead>
		<tr class="even">
			<th>Name</th>
			<th>Gender</th>
			<th>Country</th>
			<th>About You</th>
			<th>Mailing List</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		</thead>
		 <tbody>
		<s:iterator value="userList" status="userStatus">
			<tr
				class="<s:if test="#userStatus.odd == true ">success</s:if><s:else>warning</s:else>">
				<td><s:property value="name" /></td>
				<td><s:property value="gender" /></td>
				<td><s:property value="country" /></td>
				<td><s:property value="aboutYou" /></td>
				<td><s:property value="mailingList" /></td>
				
				<td><s:url id="editURL" action="editUser">
					<s:param name="id" value="%{id}"></s:param>
				</s:url> <s:a href="%{editURL}"><i class="icon-pencil"></i>Edit</s:a></td>
				<td><s:url id="deleteURL" action="deleteUser">
					<s:param name="id" value="%{id}"></s:param>
				</s:url> <s:a href="%{deleteURL}"><i class="icon-trash"></i>Delete</s:a></td>
			</tr>
			
		</s:iterator>
		</tbody>
	</table>
	</div>
</s:if> 
        </div>

    </div>

    <footer class="footer">
        <p class="pull-right"><a href="#">Back to top</a></p>
        

        <p>Created by <a href="http://twitter.com/pavi_kumbhar" target="_blank">pavi kumbhar</a>.</p>
    </footer>

</div>
<!-- /container -->

</body>
</html>
