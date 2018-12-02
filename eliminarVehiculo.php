<?php
include("myconnection.php");
include("token.php");
$data = json_decode(file_get_contents("php://input"), true);
if(($user = token($data["token"])) != false) {
    $time_pre = microtime(true);
    $sql = "DELETE FROM `transporte`.`vehiculo` WHERE `vehiculo_id` = '" . $data["id"] . "';";
    $ejecucionSQL = $conexion->prepare($sql);
    $ejecucionSQL->execute();
    $time_post = microtime(true);
    $time = $time_post - $time_pre;
    $sql = "INSERT INTO `transporte`.`auditoria` (`fecha_acceso`, `user`, `response_time`, `endpoint`) VALUES ('".date('Y-m-d H:i:s')."', '".token($data["token"])."', '".$time."', 'eliminarVehiculo.php');";
    $ejecucionSQL = $conexion->prepare($sql);
    $ejecucionSQL->execute();
}