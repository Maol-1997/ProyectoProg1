<?php
include("myconnection.php");
$data = json_decode(file_get_contents("php://input"),true);

$sql = "INSERT INTO `transporte`.`chofer` (`apellido`, `nombre`, `documento`, `email`, `vehiculo_id`, `sistema_id`) VALUES ('" . $data["apellido"] . "', '" . $data["nombre"] . "', '" . $data["documento"] . "', '" . $data["email"] . "', '" . $data["vehiculo_id"] . "', '" . $data["sistema_id"] . "');";
$ejecucionSQL = $conexion->prepare($sql);
$ejecucionSQL->execute();