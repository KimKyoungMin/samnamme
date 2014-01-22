<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
        

        <div class="right-container container">
            <form action="" method="post">
                <div class="account block2"> <!-- login (RIGHT-CONTAINER) -->
                    <h2 class="titular">SIGN IN TO YOUR ACCOUNT</h2>
                    <div class="input-container">
                        <input type="text" class="email text-input" placeholder="your Id" required>
                        <div class="input-icon envelope-icon-acount"><span class="fontawesome-envelope scnd-font-color"></span></div>
                    </div>
                    <div class="input-container">
                        <input type="password" class="password text-input" placeholder="Password" required>
                        <div class="input-icon password-icon"><span class="fontawesome-lock scnd-font-color"></span></div>
                    </div>
                    <input type="submit" class="sign-in button" value="SIGN IN">
                    <a href="#"><p class="scnd-font-color">Forgot Password?</p></a>
                </div>
            </form>
       </div>
