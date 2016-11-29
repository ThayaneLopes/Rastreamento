<?php 
session_start();
$login = $_SESSION['login'];
$senha = $_SESSION['senha'];
$id = $_SESSION['id'];


date_default_timezone_set('America/Recife');
$dataHora = date('Y/m/d H:i:s', time());
$timezone = date_default_timezone_get();

$connect = mysql_connect('localhost','root',"@luno1fpe");
$db = mysql_select_db('elsez');
$sql = "update usuario SET logout='$dataHora' WHERE id='$id'";

$resultado = mysql_query($sql) or die (mysql_error());
 
//echo $dataHora;
session_destroy();
 header("location:login.html");
?>
