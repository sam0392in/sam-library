
<!DOCTYPE html>

<!-- SiteMinder Encoding=UTF-8; -->
<html>
<head>
<title>SSO Login Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<noscript><link rel="stylesheet" href="css/mobile.css" type="text/css" /></noscript>
<div id="htmlconverter" style="display:none;"></div>
<script src="js/environment.js"></script>
<script type="text/javascript" src="js/ArcotAdapterIntegration.js"></script>
<script>

		var app = {
			loadScript:function(u){app.createEl('script',{src:u,type:'text/javascript'});},
			loadStyle:function(u){app.createEl('link',{href:u,rel:'stylesheet',type:'text/css'});},
			createEl:function(t,c){var e=document.createElement(t);for(var a in c) {e.setAttribute(a, c[a]);}document.getElementsByTagName("head")[0].appendChild(e);}
		};

		var frmId = 'Default';

		config.is.Managed = self!== top && (/safari/i).test(navigator.userAgent);

		if (config.is.Blackberry) {
			app.loadStyle('css/mobile.css');
		} else if (config.is.iOS || config.is.Android) {
			frmId = 'HTML5';
			app.createEl('meta', {name: 'viewport', content: 'width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0;'});
			app.loadStyle('css/html5.css');
		} else if (config.is.Desktop) {
			app.loadStyle('css/screen.css');
		}

	</script>
<script language="javascript" type="text/javascript">

function html_entity_decode(str)

{
	try
	{
		var tarea=document.createElement('textarea');
		tarea.innerHTML = str; return tarea.value;
		tarea.parentNode.removeChild(tarea);

	}

	catch(e)

	{
		//for IE add <div id="htmlconverter" style="display:none;"></div> to the page
		document.getElementById("htmlconverter").innerHTML = '<textarea id="innerConverter">' + str + '</textarea>';
		var content = document.getElementById("innerConverter").value;
		document.getElementById("htmlconverter").innerHTML = "";

		return content;

	}

}

function initPage()
{
	// When the user is not known to SiteMinder, it redirects back to
	// this page but with realmoid and type not set. Upon entering user
	// name again the browser displays an internal error. 
	//
	// Check for missing params and redirect to another errror page.
	if( '' == "" && '06-000b93ee-fb5d-129c-978e-1f0ea95350b4' == "" )
	{
		window.location="shimunknownuser.fcc";
	}
}

function submitForm()
{
	//alert(document.Login.PASSWORD.value)
	var info = {};
	//info["Password"] = document.Login.PASSWORD.value;
	
	// document.Login.PASSWORD.value = info.toJSONString();
	var strval = document.Login.PASSWORD.value;
	
	info["Password"] = hexEncode(strval);
	document.Login.PASSWORD.value = JSON.stringify(info);
	//alert(document.Login.PASSWORD.value)
	
	// document.Login.submit();
}

function submitFormMobile1()
{
	//alert(document.frmHTML5.PASSWORD.value)
	var info = {};
	//info["Password"] = document.frmHTML5.PASSWORD.value;
	
	// document.Login.PASSWORD.value = info.toJSONString();
	var strval = document.frmHTML5.PASSWORD.value;
	
	info["Password"] = hexEncode(strval);
	document.frmHTML5.PASSWORD.value = JSON.stringify(info);
	//alert(document.frmHTML5.PASSWORD.value)
	
//	document.frmHTML5.submit();
}

function submitFormMobile()
{
	//alert(document.frmHTML5.PASSWORD.value)
	var info = {};
	//info["Password"] = document.frmHTML5.PASSWORD.value;
	
	// document.Login.PASSWORD.value = info.toJSONString();
	var strval = document.frmHTML5.PASSWORD.value;
	
	info["Password"] = hexEncode(strval);
	document.frmHTML5.PASSWORD.value = JSON.stringify(info);
	//alert(document.frmHTML5.PASSWORD.value)
	
	document.frmHTML5.submit();
}

function DisplayMessage()
{
	var usrmsg = '';
	if (usrmsg !== null && usrmsg !== "")
	{
		var decodedHTMLStr = html_entity_decode('');
		var j = eval('(' + decodedHTMLStr + ')');
		if(j !== "" )
		{
			if( j.msg !== "" ){
				// no need to show error code
				// one can use switch to display user corresponding error msg
				// else display a standard message
				switch(j.code){
					case 706021001:
						document.write("<b>" + "Unable to create Token" + "</b><p></br>");
					break;
					case 706021002:
						document.write("<b>" + "Unable to retrieve Token" + "</b><p></br>");
					break;
					case 706021003:
						document.write("<b>" + "Unable to update Token" + "</b><p></br>");
					break;
					case 706021004:
						document.write("<b>" + "Unable to delete Token" + "</b><p></br>");
					break;
					case 706021005:
						document.write("<b>" + "Configured auth landling url does not match auth url in token. Contact Administrator." + "</b><p></br>");
					break;
					case 706021006:
						document.write("<b>" + "Unrecognized Shim Action. Contact Administrator." + "</b><p></br>");
					break;
					case 706021007:
						document.write("<b>" + "Initialization failed for the section. Contact Administrator." + "</b><p></br>");
					break;
					case 706021008:
						document.write("<b>" + "Password service not configured properly. Contact Administrator." + "</b><p></br>");
					break;
					case 706051102:
						document.write("<b>" + "Password field not present. Please retry." + "</b><p></br>");
					break;
					case 706051103:
						document.write("<b>" + "Invalid password format. Please retry." + "</b><p></br>");
					break;
					case 706051104:
						document.write("<b>" + "Token userID does not match disambiguated userID. Please retry." + "</b><p></br>");
					break;
					case 706051105:
						document.write("<b>" + "Backing scheme failure. Please retry." + "</b><p></br>");
					break;
					case 706051106:
						document.write("<b>" + "Risk Engine Post Eval denied transaction" + "</b><p></br>");
					break;
					case 706051107:
						document.write("<b>" + "Password reset failed. Please retry." + "</b><p></br>");
					break;
					case 706053201:
						document.write("<b>" + "User is disabled by administrator. Contact administrator." + "</b><p></br>");
					break;
					case 706053202:
						document.write("<b>" + "Max login attempts exceeded." + "</b><p></br>");
					break;
					case 706053203:
						document.write("<b>" + "User is inactive." + "</b><p></br>");
					break;
					case 706053204:
						document.write("<b>" + "Password expired." + "</b><p></br>");
					break;
					case 706053205:
						document.write("<b>" + "User is disabled in the directory." + "</b><p></br>");
					break;
					default :
						if(j.msg == "ShowStdErrMsg"){
							document.write("<b>" + "Invalid credential. Please retry.." + "</b><p></br>");
						}
						else
						{
							document.write("<b>" + j.msg + "</b><p></br>");
						}
				}//switch
			} // if( j.msg !== "" )
		} // if(j !== "" )
	}
}


</script>
</head>


<body onLoad="initPage()">
	<div class="sso-desktop">
        
		<div class="container" align="center">
			<div class="headerbox">
				<div class="headertitle">
					<h2>SSO Login
						<script>
							document.write(' ' + config.server.region);
							if (config.server.env !== "PROD") {
								document.write('<font color="red"> - ' + config.server.env + '</font>');
							}
						</script>
					</h2>
				</div><!--<div-headertitle> -->
			</div><!--<div-headerbox> -->
			
			<div class="infobox">
				<div class="infotitle">
					<span><a href="./sso/about_blue.htm"><img src="images/signon_logo_transparent.gif" width="118" height="22" alt="Single Sign-On" /></a></span>
				</div><!--<div-infotitle> -->
				<div class="infobody">
				<form NAME="Login" METHOD="POST"> 
					<div class="infocenter">		

								
									<INPUT TYPE=HIDDEN NAME="SMENC" VALUE="UTF-8">
									<INPUT type=HIDDEN name="SMLOCALE" value="US-EN">
										<table class="center" border="0">
											<tr><td colspan="3" align="center"><font color="red"><script>DisplayMessage();</script></font></td></tr>
											<tr>
												<td align="right"><b>Standard ID:</b></td>
												<td align="left"><input type="text" name="USER" id="USER" tabindex="1" class="logininput" /></td>
											</tr>
											<tr>
												<td align="right"><b>Password:</b></td>
												<td align="left"><input type="password" name="PASSWORD" id="PASSWORD" tabindex="2" class="logininput" /></td>
												<td align="left"><a href="https://mytechub.jpmorganchase.com/#/passwordresets/sso/prod" target="_self">Reset/Forgot Password</a></td>
											</tr>
											
											<tr>
												<td colspan="3">
													<input type=hidden name=target value="HTTPS://me.jpmorganchase.com/">
													<input type=hidden name=smauthreason value="0">
													<input type=hidden name=smagentname value="zK108OjYqC1yuhfexYm0wGsnbiWeVYdXtqEcNV5YvsIy1JsAR3+sdb7kZQSwkj8/">
													<input type=hidden name=type value="33554433">
													<input type=hidden name=realmoid value="06-000b93ee-fb5d-129c-978e-1f0ea95350b4">
												</td>
											</tr>
											<tr>
												<td align="right"></td>
												<td colspan="2" align="left"><input type="submit" class="submitbutton" name="cont" value="Login" onClick="submitForm();" /></td>
											</tr>
										</table>  					
								
													
					</div><!--<div-infocenter> -->
				</form>	 				
				</div><!--<div-infobody> -->
				<div class="infofooter">
					<div><a href="javascript:window.open('./sso/help2.htm','helpWindow','width=640,height=380,scrollbars=yes');void(0);">Single Sign-On Help</a></div>
				</div><!--<div-infofooter> -->
			</div><!--<div-infobox> -->
		</div><!--<div-container> -->
		<div class="tipbox">
				<span><b>Tip:</b> You are able to use the same Standard ID and password on all sites that bear the Single Sign-On logo.</span>
		</div>
		<div class="alerttext">
				<span>DO NOT BOOKMARK THIS PAGE. DO NOT ADD TO FAVORITES.</span>
		</div>
	  	
	  	</div> <!--<div-ssodesktop> -->
	<!--HTML5 FORM-->
	<table class="sso-html5" style="height:100%; width:100%; position:absolute; top:0; left:0;">
		<tr>
			<td style="height: 43px;">
				<div class="sso-toolbar sso-toolbar-top" style="height:43px;">
					<span class="sso-help-icon" onclick="document.location='sso/help2.htm';"></span>
					<div class="sso-toolbar-title">Single Sign-On
						<script>
							if (config.server.env !== "PROD") {
								document.write('<span class="sso-toolbar-env"> - ' + config.server.env + '</span>');
							}
						</script>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<form id="frmHTML5" name="frmHTML5" style="width: 100%;" method="post" autocomplete="OFF">

					<input type="hidden" name="SMENC" value="ISO-8859-1" />
					<input type="hidden" name="SMLOCALE" value="US-EN" />
					<input type="hidden" name="location" id="location" />
					<input type="hidden" name="target" value="HTTPS://me.jpmorganchase.com/" id="txtTargetHTML5" />
					<input type="hidden" name="smauthreason" value="0" />
					<input type="hidden" name="smagentname" value="zK108OjYqC1yuhfexYm0wGsnbiWeVYdXtqEcNV5YvsIy1JsAR3+sdb7kZQSwkj8/" />
					<input type="hidden" name="type" value="33554433">
					<input type="hidden" name="realmoid" value="06-000b93ee-fb5d-129c-978e-1f0ea95350b4">
					<input type="hidden" name="postpreservationdata" value="" />

					<div class="sso-body">
						<div class="sso-fieldset">
							<div class="sso-field">
								<div class="sso-field-label"><span>Standard ID</span></div>
								<div class="sso-field-container"><input class="sso-input-text" type="text" name="USER" id="txtUserHTML5"></div>
							</div>
							<div class="sso-field">
								<div class="sso-field-label"><span>Password</span></div>
								<div class="sso-field-container"><input class="sso-input-password" type="password" name="PASSWORD" id="txtPassHTML5" autocapitalize="off"></div>
							</div>
						</div>
					        <div class="sso-box-center"> 
                                                        <div class=" sso-button" onclick="submitFormMobile();"><span class="sso-button-label">Login</span>
							</div> 
                                                         <input type="submit" value="Login" tabindex="3" onclick="submitFormMobile1();">  
                                                </div> 
					</div>
				</form>
			</td>
		</tr>
		<tr>
			<td style="height: 17px;">
				<div class="sso-toolbar sso-toolbar-bottom" style="height: 17px;">
					<div class="sso-corporate-logo"></div>
				</div>
			</td>
		</tr>
	</table>

</body>
</html>
