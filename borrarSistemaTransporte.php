<?php
include("myconnection.php");
$data = json_decode(file_get_contents("php://input"),true);

$sql = "DELETE FROM `transporte`.`sistema_transporte` WHERE `sistema_id` = '".$data["sistema_id"]."';";
$ejecucionSQL = $conexion->prepare($sql);
$ejecucionSQL->execute();