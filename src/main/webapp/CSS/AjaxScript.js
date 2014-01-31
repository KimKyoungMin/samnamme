function getXMlHttpRequest(){
	if(window.ActiveXObject){
		try{
			return new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e){
			try{
				return new ActiveXObject("Microsoft.XMLHTTP");
			}catch(e1){
				return null;
			}
		}
	}else if (window.XMLHttpRequest){
		  return new XMLHttpRequest();
	}else{
		return null;
	}
	return httpReq; //∞¥√º∏¶ ∏Æ≈œ
}

var httpReq = null;
function sendRequest(url, params, callback , method){
	alert(url + "\n" + params + "\n" +  method);
	httpReq = getXMlHttpRequest();
	////////////////////////////////////////////////////
	var httpMethod = method ? method :'GET';
	if(httpMethod != 'GET' && httpMethod != 'POST'){
		httpMethod = 'GET';
	}
	var httpParams = (params == null || params == '') ? null : params;
	var httpUrl = url;
	if(httpMethod == 'GET' && httpParams != null){
		httpUrl = httpUrl + "?" + httpParams; //process.jsp?name=aaa
	}
	//////////////////////////////////////////////////////
	httpReq.open(httpMethod,httpUrl,true);
	httpReq.onreadystatechange= callback;
	httpReq.send(httpMethod == 'POST' ? httpParams : null );
}
