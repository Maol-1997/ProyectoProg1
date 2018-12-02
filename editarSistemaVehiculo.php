<?php
include("myconnection.php");
include("token.php");
$data = json_decode(file_get_contents("php://input"), true);
if(($user = token($data["token"])) != false) {
    $time_pre = microtime(true);
    if(isset($data["vehiculo_id"])) {
        $sql = "UPDATE `transporte`.`sistema_vehiculo` SET `vehiculo_id` = '".$data["vehiculo_id"]."' WHERE `sistemavehiculo_id` = '".$data["sistemavehiculo_id"]."';";
        $ejecucionSQL = $conexion->prepare($sql);
        $ejecucionSQL->execute();
    }
    if(isset($data["sistema_id"])) {
        $sql = "UPDATE `transporte`.`sistema_vehiculo` SET `sistema_id` = '".$data["sistema_id"]."' WHERE `sistemavehiculo_id` = '".$data["sistemavehiculo_id"]."';";
        $ejecucionSQL = $conexion->prepare($sql);
        $ejecucionSQL->execute();
    }
    $time_post = microtime(true);
    $time = $time_post - $time_pre;
    $sql = "INSERT INTO `transporte`.`auditoria` (`fecha_acceso`, `user`, `response_time`, `endpoint`) VALUES ('".date('Y-m-d H:i:s')."', '".token($data["token"])."', '".$time."', 'editarSistemaVehiculo.php');";
    $ejecucionSQL = $conexion->prepare($sql);
    $ejecucionSQL->execute();
}