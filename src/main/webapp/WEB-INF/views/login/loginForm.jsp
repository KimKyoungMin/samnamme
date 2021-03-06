<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<br><br>

        <div class="right-container container">
        <c:if test="${param.error!=null }">
           <div>
                    로그인 실패 <br>
              <c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null }">
                         이유 : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message }"></c:out>               
              </c:if>    
           </div> 
        </c:if>
            <c:url value="/j_spring_security_check" var="loginURL"></c:url>
            <form action="${loginURL }" method="post">
                <div class="account block2"> <!-- login (RIGHT-CONTAINER) -->
                    <h2 class="titular">SIGN IN TO YOUR ACCOUNT</h2>
                    <div class="input-container">
                        <input type="text" class="email text-input" name="j_username" placeholder="your Id" required autofocus value="">
                        <div class="input-icon envelope-icon-acount"><span style="padding-left: 20px" class="fontawesome-envelope scnd-font-color"></span></div>
                    </div>
                    <div class="input-container">
                        <input type="password" class="password text-input" name="j_password" placeholder="Password" required value="">
                        <div class="input-icon password-icon"><span style="padding-left: 20px" class="fontawesome-lock scnd-font-color"></span></div>
                    </div>
                    <input type="submit" class="sign-in button" value="SIGN IN">
                    <a href="join.htm"><p class="scnd-font-color">New Member Click here</p></a>
                </div>
            </form>
       </div>
