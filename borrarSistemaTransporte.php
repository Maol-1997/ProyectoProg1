<?php
include("myconnection.php");
include("token.php");
$data = json_decode(file_get_contents("php://input"),true);

if(token($data["token"]) != false) {
    $time_pre = microtime(true);
    $sql = "DELETE FROM `transporte`.`sistema_transporte` WHERE `sistema_id` = '".$data["sistema_id"]."';";
    $ejecucionSQL = $conexion->prepare($sql);
    $ejecucionSQL->execute();

    $time_post = microtime(true);
    $time = $time_post - $time_pre;
    $time = $time*pow(10,3);
    $sql = "INSERT INTO `transporte`.`auditoria` (`fecha_acceso`, `user`, `response_time`, `endpoint`) VALUES ('".date('Y-m-d H:i:s')."', '".token($data["token"])."', '".$time."', 'borrarSistemaTransporte');";
    $ejecucionSQL = $conexion->prepare($sql);
    $ejecucionSQL->execute();
}