<?php
include("myconnection.php");
include("token.php");
$data = json_decode(file_get_contents("php://input"),true);

if(token($data["token"]) != false) {
    $time_pre = microtime(true);

    $sql = "INSERT INTO `transporte`.`sistema_transporte` (`nombre`, `pais_procedencia`) VALUES ('" . $data["nombre"] . "', '" . $data["pais_procedencia"] . "');";
    $ejecucionSQL = $conexion->prepare($sql);
    $ejecucionSQL->execute();

    $time_post = microtime(true);
    $time = $time_post - $time_pre;
    $time = $time*pow(10,3);
    $sql = "INSERT INTO `transporte`.`auditoria` (`fecha_acceso`, `user`, `response_time`, `endpoint`) VALUES ('".date('Y-m-d H:i:s')."', '".token($data["token"])."', '".$time."', 'asd');";
    $ejecucionSQL = $conexion->prepare($sql);
    $ejecucionSQL->execute();
}