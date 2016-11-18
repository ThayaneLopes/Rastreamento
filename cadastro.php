<?php 
	$form = new PDO
	("mysql:host=localhost;dbname=Elsez");

	try{

		$x = $form->prepare("insert into usuario(nome,email,senha,nascimento, login) values (?,?,?,?,?)");

		$nome = $_POST['nome'];
		$email = $_POST['email'];
		$senha = $_POST['senha'];
		$nascimento = $_POST['nascimento'];
		$login = $_POST['login'];

		$x->bindParam(1,$nome);
		$x->bindParam(2,$email);
		$x->bindParam(3,$senha);
		$x->bindParam(4,$nascimento);
		$x->bindParam(5,$login);

		$x->execute();
		echo "Cadastro Realizado com sucesso!";
		header("Location:login.html");

	}catch(PDOException $e){
	echo "Codigo do erro: ".$e->getCode()." - ".$e->getMessage();
	}





 ?>