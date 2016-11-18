<?php 
$connect = mysql_connect('localhost');
$db = mysql_select_db('elsez');

$id = $_POST["id"];

$query = "delete from usuario where id='$id'";  

$res= mysql_query($query, $connect)or die(mysql_error());

if($res){  
	echo "Dado removido com sucesso.";
	header("location:index.html");
}else{  
	echo "Falha ao tentar remover dado.";
}

?>