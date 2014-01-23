<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<div class="right-container container">
             <form action="" method="post"> 
                <div class="account2 block2"> 
                    <h2 class="titular">Notice</h2>
                    <div class="input-container">
                        Writer <input type="text" class="email text-input" required autofocus>
                        <div class="input-icon envelope-icon-acount"></div>
                    </div>
                    <div class="input-container">
                        Name <input type="text" class="password text-input">
                    </div>
                    <div class="input-container">
                        Content <textarea name="content">
                    </div>
                    <div class="input-container">
                        image <input type="file" name="file">
                    </div>
                    <input type="submit" class="subscribe button" value="OK">
                </div>
           </form>
       </div>
