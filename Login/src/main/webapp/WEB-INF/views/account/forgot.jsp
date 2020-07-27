<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<div class="container-fluid">
  <div class="row no-gutter">
    <div class="d-none d-md-flex col-md-4 col-lg-6 bg-image"></div>
    <div class="col-md-8 col-lg-6">
      <div class="login d-flex align-items-center py-5">
        <div class="container">
          <div class="row">
            <div class="col-md-9 col-lg-8 mx-auto">
              <c:if test="${msg != null}">
              	  	<h3 class="label label-success mb-4" style="margin: 2rem 0 0 2rem">${msg}</h3>	
              </c:if>
              <h3 class="login-heading mb-4">Please enter your email.</h3>   
              <form:form action="/account/forgot" modelAttribute="form" name="form" onsubmit="return validateFormForgot()">
                <div class="form-label-group">
                  <form:input path="email" class="form-control" placeholder="Email address" />
                  <form:errors path="email"></form:errors>
                  <c:if test="${msgE != null}">
              	  	<h4 class="label label-danger mb-4" style="margin: 2rem 0 0 2rem">${msgE}</h4>	
             	  </c:if>
                </div>
                <button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" type="submit" data-toggle="modal" data-target="#checkFormModel">Send Mail</button>
                 <div class="row">
                  <div class="text-right col-md-6">
                  	  <a class="small" href="/account/login">Login here?</a>
                  </div>
                  <div class="text-left col-md-6">
                      <a class="small" href="/account/register">Register here?</a>
                  </div>
                </div>
              </form:form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Modal -->
<div class="modal" id="checkFormModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Warning</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		Please enter your email, password, birthday
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>






