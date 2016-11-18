<?php
session_start();

$login = $_SESSION['login'];
$senha = $_SESSION['senha'];
$id = $_SESSION['id'];

if(!isset($_SESSION["login"]) || !isset($_SESSION["id"])){
    header("Location: login.html");

exit;
}

?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Excluir conta</title>
	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="button">
        <h1>
	        <a href="index.html">Home</a>			
		</h1>
    </div>
	<form action="excluindo.php" method="POST">
		<h1>Tem certeza que deseja excluir</h1> <br>
		<input type="hidden" id="id" name="id" value="<?php echo $id; ?>">
		<input type="submit" value="Sim" >
		<button><a href="index.html">Não</a></button>
	</form>	

</body>
</html>