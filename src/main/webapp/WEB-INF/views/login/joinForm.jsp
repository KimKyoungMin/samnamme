<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script type="text/javascript">
	//id check -> 숫자와 영어만 받도록 함(한글은 없애버림)
	function idcheck() {
		var regVal = /[^a-z0-9]/g;
		var checkVal = document.myform.userid.value;
		document.myform.userid.value = checkVal.replace(regVal, "");
	}
	//연락처에 쓸 숫자만 입력가능하게끔 하는 정규식 적용
	function telcheck(j){ 
		var regVal = /[^0-9]/g;
		var checkVal = document.myform.utel.value;
		document.myform.utel.value = checkVal.replace(regVal, "");
	}
	
</script>
<br><br>
            
        <div class="right-container container">
             <form action="" name = "myform" id ="myform" method="post"> 
                <div class="account2 block2" > <!-- Join (RIGHT-CONTAINER) -->
                    <h2 class="titular">MEMBER JOIN</h2>
                    <div class="input-container" >
                        <input type="text" class="email text-input" name="userid" placeholder="your Id impassible hangle" required autofocus maxlength="50" onKeyup="idcheck()">
                        <div class="input-icon envelope-icon-acount"><span style="padding-left: 20px" class="fontawesome-home scnd-font-color"></span></div>
                    </div>
                    <div class="input-container">
                        <input type="password" class="password text-input" name="upwd" placeholder="Password" required maxlength="600">
                        <div class="input-icon password-icon"><span style="padding-left: 20px" class="fontawesome-lock scnd-font-color"></span></div>
                    </div>
                    <div class="input-container">
                        <input type="text" class="password text-input" name="uname" placeholder="name" maxlength="50">
                        <div class="input-icon password-icon"><span style="padding-left: 20px" class="fontawesome-user scnd-font-color"></span></div>
                    </div>
                    <div class="input-container">
                        <input type="text" class="password text-input" name="utel" placeholder="phone number you can do input number only" maxlength="20" onKeyup='telcheck()'>
                        <div class="input-icon password-icon"><span style="padding-left: 20px" class="fontawesome-phone scnd-font-color"></span></div>
                    </div>
                    <div class="input-container">
                        <input type="text" class="password text-input" name="uemail" placeholder="E-mail" maxlength="50">
                        <div class="input-icon password-icon"><span style="padding-left: 20px" class="fontawesome-envelope scnd-font-color"></span></div>
                    </div>
                    <input type="submit" class="subscribe button" value="OK">
                </div>
           </form>
       </div>

