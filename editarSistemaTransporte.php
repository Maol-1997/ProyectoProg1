<?php
include("myconnection.php");
$data = json_decode(file_get_contents("php://input"),true);

if(isset($data["nombre"])){
    $sql = "UPDATE `transporte`.`sistema_transporte` SET `nombre` = '".$data["nombre"]."' WHERE `".$data["sistema_id"]."` = '1';";
    $ejecucionSQL = $conexion->prepare($sql);
    $ejecucionSQL->execute();
}

if(isset($data["pais_procedencia"])){
    $sql = "UPDATE `transporte`.`sistema_transporte` SET `nombre` = '".$data["pais_procedencia"]."' WHERE `".$data["sistema_id"]."` = '1';";
    $ejecucionSQL = $conexion->prepare($sql);
    $ejecucionSQL->execute();
}