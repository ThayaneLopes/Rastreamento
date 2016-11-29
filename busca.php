<?php 

/*$host = 'localhost'; 
$user = 'root'; 
$pass = '@luno1fpe';
$con = mysql_connect($host,$user,$pass); 
$db = 'Elsez';*/
$connect = mysql_connect('localhost','root',"@luno1fpe");
$db = mysql_select_db('elsez');

$busca = $_POST['busca'];
mysql_select_db($connect) or print mysql_error();
$sql = mysql_query("select * from usuario where nome like '%$busca%' or login like '%$busca%'");
$count = mysql_num_rows($sql);

if ($count == 0) {
	echo "Nenhum resultado! ". '<br>';
} else {
	if ($count == 1) {
		echo "1 resultado encontrado!". '<br>';
	}
}
if ($count > 1) {
	echo "$count resultados encontrados!". '<br>';
}
while ($dados = mysql_fetch_array($sql)) {
	echo "Nome: ".$dados['nome']." e login " .$dados['login'] . '<br>';
}
?>