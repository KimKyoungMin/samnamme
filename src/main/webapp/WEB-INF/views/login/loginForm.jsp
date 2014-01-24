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
         
            <form action="/j_spring_security_check" method="post">
                <div class="account block2"> <!-- login (RIGHT-CONTAINER) -->
                    <h2 class="titular">SIGN IN TO YOUR ACCOUNT</h2>
                    <div class="input-container">
                        <input type="text" class="email text-input" name="j_username" placeholder="your Id" required autofocus>
                        <div class="input-icon envelope-icon-acount"><span class="fontawesome-envelope scnd-font-color"></span></div>
                    </div>
                    <div class="input-container">
                        <input type="password" class="password text-input" name="j_password" placeholder="Password" required>
                        <div class="input-icon password-icon"><span class="fontawesome-lock scnd-font-color"></span></div>
                    </div>
                    <input type="submit" class="sign-in button" value="SIGN IN">
                    <a href="#"><p class="scnd-font-color">Forgot Password?</p></a>
                </div>
            </form>
       </div>
