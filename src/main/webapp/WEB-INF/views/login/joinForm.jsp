<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

            
        <div class="right-container container">
             <form action="" method="post"> 
                <div class="account2 block2"> <!-- Join (RIGHT-CONTAINER) -->
                    <h2 class="titular">MEMBER JOIN</h2>
                    <div class="input-container">
                        <input type="text" class="email text-input" name="userid" placeholder="your Id" required autofocus>
                        <div class="input-icon envelope-icon-acount"><span class="fontawesome-envelope scnd-font-color"></span></div>
                    </div>
                    <div class="input-container">
                        <input type="password" class="password text-input" name="upwd" placeholder="Password" required>
                        <div class="input-icon password-icon"><span class="fontawesome-lock scnd-font-color"></span></div>
                    </div>
                    <div class="input-container">
                        <input type="text" placeholder="name" class="password text-input" name="uname">
                    </div>
                    <div class="input-container">
                        <input type="text" class="password text-input" name="utel" placeholder="phone number">
                    </div>
                    <div class="input-container">
                        <input type="text" class="password text-input" name="uemail" placeholder="E-mail">
                    </div>
                    <input type="submit" class="subscribe button" value="OK">
                </div>
           </form>
       </div>

