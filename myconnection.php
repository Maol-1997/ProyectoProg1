<?php
$servidor = "localhost";
$usuario = "root";
$clave = "";
$base = "transporte";
$conexion = new PDO("mysql:host=$servidor;dbname=$base",$usuario,$clave);
?>