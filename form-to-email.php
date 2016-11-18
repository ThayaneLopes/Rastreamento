<?php
if(!isset($_POST['submit']))
{
	echo "Erro, voce precisa enviar a mensagem!";
  exit;
}
//____________________________Teste_____________________________________







//_______________________________________________________________________

$name = $_POST['name'];
$visitor_email = $_POST['email'];
$message = $_POST['message'];

//Validate first
if(empty($name)||empty($visitor_email)) 
{
    echo "Nome, email e numero obrigatorios!";
    exit;
}

if(IsInjected($visitor_email))
{
    echo "Email invalido!";
    exit;
}

$email_from = 'barbaha@barbaha.pe.hu';
$email_subject = "$name entrou em contato pelo site";
$email_body = "Nome: $name;\n Email: $email; \n".
    "Conteúdo da mensagem: \n$message";//Teste 
    
$to1 = "barbaha.mariah@hotmail.com";
$headers = "From: $email_from \r\n";
$headers .= "Reply-To: $visitor_email \r\n";

mail($to1,$email_subject,$email_body,$headers);

function IsInjected($str)
{
  $injections = array('(\n+)',
              '(\r+)',
              '(\t+)',
              '(%0A+)',
              '(%0D+)',
              '(%08+)',
              '(%09+)'
              );
  $inject = join('|', $injections);
  $inject = "/$inject/i";
  if(preg_match($inject,$str))
    {
    return true;
  }
  else
    {
    return false;
  }
}
echo '<script language="javascript">';
echo 'alert("message successfully sent")';
echo 'window.location.href = "contato.html"';
echo '</script>';
exit;
   
?> 
