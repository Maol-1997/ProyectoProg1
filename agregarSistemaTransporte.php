<?php
include("myconnection.php");
$data = json_decode(file_get_contents("php://input"),true);

$sql = "INSERT INTO `transporte`.`sistema_transporte` (`nombre`, `pais_procedencia`) VALUES ('".$data["nombre"]."', '".$data["pais_procedencia"]."');";
$ejecucionSQL = $conexion->prepare($sql);
$ejecucionSQL->execute();