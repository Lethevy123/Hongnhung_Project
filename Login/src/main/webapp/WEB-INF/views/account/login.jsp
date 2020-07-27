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
              <h3 class="login-heading mb-4">Sign into your account</h3>
              <form:form action="/account/login" method="POST" onsubmit="return validateFormLogin()">
                <div class="form-label-group">
                  <input name="email" value="${ueml}" type="email" id="email" class="form-control" placeholder="Email address" >
                  <form:errors path="email"></form:errors>
              	  	<h4 id="msgE" class="label label-danger mb-4" style="margin: 2rem 0 0 2rem">${msgE}</h4>	
                </div>
                <div class="form-label-group">
                  <input name="pw" value="${upw}" type="password" id="password" class="form-control" placeholder="Password" >
              	  	<h4 id="msgP" class="label label-danger mb-4" style="margin: 2rem 0 0 2rem">${msgP}</h4>	
                </div>
                <div class="custom-control custom-checkbox mb-3">
                  <input name="rm" type="checkbox" class="custom-control-input" id="customCheck1" >
                  <label class="custom-control-label" for="customCheck1">Remember password</label>
                </div>
                <button name="btnLogin" id="btnLogin" class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" type="submit">Login</button>
                <div class="row">
                  <div class="text-right col-md-6">
                  	  <a class="small" href="/account/forgot">Forgot password?</a>
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





