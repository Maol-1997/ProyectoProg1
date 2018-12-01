<?php
include("myconnection.php");
$data = json_decode(file_get_contents("php://input"),true);

$sql = "DELETE FROM `transporte`.`chofer` WHERE `chofer_id` = '".$data["chofer_id"]."';";
$ejecucionSQL = $conexion->prepare($sql);
$ejecucionSQL->execute();