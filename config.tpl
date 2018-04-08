<?php
		
			DEFINE('SEGEMENT',2);
			DEFINE('INCLUDES','inc/');
			DEFINE('WEBPATH','http://localhost:1020/rentingSystem/');
			
            
            require_once(INCLUDES.'Sessions.tpl');
			session::start(6000,true,36000,true,true,'nocache',1,6,'TEMP');	
            
            
				
			DEFINE('DATABASE','db/');
            DEFINE('TEMP',' tmp/');
            DEFINE('IMAGES','imgs/');
            
			DEFINE('VIEW','view/');
			DEFINE('MODEL','model/');
			DEFINE('CONTROLLER','controller/');
            DEFINE('SMS','sms/');
            
            
            DEFINE('DEFAULTURL',VIEW.'dashboard');
			DEFINE('LOGINURL',WEBPATH.'login-Register');
			
			
			DEFINE('HOST','localhost');
			DEFINE('DBUSER','root');
			DEFINE('DBNAME','olx_replicate');
			DEFINE('DBPASS','');
            
            
            DEFINE('WAY2USER','YourSMSGateWaysUsername');
            DEFINE('WAY2PASS','YourSMSGateWaysPassword');
            DEFINE('SENDERID','QCKENT');
            DEFINE('SMS_MESSAGE','Your Post Has Been Added In QuickEntals..Thank You');
       DEFINE('OTP_MESSAGE',' is Your One Time Password(OTP).Please Enter the OTP to continue adding of Post on QuickEntals.Your OTP is valid for limited time');
            
            
            
            DEFINE('ADMIN_INCLUDES','ADMIN/inc/');
            DEFINE('ADMIN_VIEW','ADMIN/view/');
            DEFINE('ADMIN_MODEL','ADMIN/model/');
            DEFINE('ADMIN_CONTROLLER','ADMIN/controller/');
		

           class BUNDLE{
		
			public static function getLogin_Register_Essentials(){
			
				 require_once(DATABASE.'connect.php');
				 include(MODEL.'register_login.tpl');
				 include(CONTROLLER.'registerController.tpl');
                 include(CONTROLLER.'loginController.tpl');
		}
		
			public static function LoginCheck(){
			
				if(isset($_SESSION['AUTH']) || isset($_COOKIE['AUTHCOOKIE']))
					header('LOCATION:'.DEFAULTURL);
		}
		
			public static function isAuthorized($id){
				if(!isset($_SESSION['AUTH']) && 
					!isset($_COOKIE['AUTHCOOKIE']))
					header('LOCATION:'.LOGINURL.'?ID='.$id);
		}
		
			public static function authMessages($param){
				if($param=="1")
				return "You are not authorized to access this page!";
				if($param=="QTLMW55FEAA3856EE365ETL")
				return "Logged out!";
				if($param=="QLMWFX55FEAA3856EE365ETL")
				return "You cannot logout without Signing in!";
				if($param=="QLMWFXB39E09979ETLC3d8C3")
					return "Bad Request: IpAddress Change Detected";
				if($param=="QLMWFX55FEAAETL3856EE365")
					return "Bad Request : Browser Change Detected";
				if($param == "QTLMWE199D345326E5A448b41D9F5550")
					return "Session timed out";
                if($param == "QE2VmMThh")
					return "Your account was successfully activated!";
                if($param == "QTLMWFXTnJmR1Z1ZEE9PQLOFGJIUN")
					return "You Must Login First!";
                   
				else
				return "Invalid parameter passed!";
			
		}
		
        public static function filerInput($param){
		if(function_exists('mysqli_real_escape_string')){
				$param = trim($param);
				$param = strip_tags($param);
				$param = htmlentities($param);
				//$param = mysqli_real_escape_string($param);
						
		}else{
				$param = strip_tags($param);
				$param = trim($param);	
				$param = htmlentities($param);						
		}
	
		return $param;
	}
		
		
}

	























			


?>