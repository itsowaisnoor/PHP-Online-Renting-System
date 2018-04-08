<?php
  session_start();
  if(!isset($_SESSION['OTP']))
  {	
     $_SESSION['OTP']=time();
  }
  echo "<br/>Time=".$_SESSION['OTP'].'<br/>';
   echo "<br/>Time 1 min=".((int)$_SESSION['OTP']+60);
  echo '<br/>Current Time='.time();
 // echo $_SESSION['OTP']+120000;
  
  if(time()<((int)$_SESSION['OTP']+60))
  	echo "<br/>verified";
  else
  	echo "<br/>failed";
  //echo rand(1000,9999);

?>