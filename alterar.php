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
	<title>Página de Alteração</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="button">
        <h1>
            <a href="index.html">Home</a>           
        </h1>
    </div>
    
    <form action="alterando.php" method="POST">
    	<h1>Atenção!!!</h1><label><h1>preencha os dois campos</h1></label>
        <input type="hidden" id="id" name="id" value="<?php echo $id; ?>">
    	Senha: <input type="password" name="nsenha" id="nlogin"> <br>
    	E-mail: <input type="email" name="nemail" id="nlogin"> <br>
    	<input type="submit" value="Enviar alterações" id="alterar"> <input type="reset" value="Limpar">
        <h5>Se deseja excluir sua conta <a class="subl" href="excluir.php">Clique aqui</a></h5>
    </form>
</body>
</html>
