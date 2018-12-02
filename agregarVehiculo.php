<?php
include("myconnection.php");
include ("token.php");
$data = json_decode(file_get_contents("php://input"), true);
if(($user = token($data["token"])) != false) {
    $time_pre = microtime(true);
    $sql = "INSERT INTO `transporte`.`vehiculo` (`patente`, `anho_patente`, `anho_fabricacion`, `marca`, `modelo`) VALUES ('" . $data["patente"] . "', '" . $data["anho_patente"] . "', '" . $data["anho_fabricacion"] . "', '" . $data["marca"] . "', '" . $data["modelo"] . "');";
    $ejecucionSQL = $conexion->prepare($sql);
    $ejecucionSQL->execute();
    $time_post = microtime(true);
    $time = $time_post - $time_pre;
    $time = $time*pow(10, 3);

    //$sql = "INSERT INTO `transporte`.`auditoria` (`fecha_acceso`, `user`, `response_time`, `endpoint`, `created`) VALUES ('".date("d N m Y H i s")."', 'asdf', '".$time."', 'asdf', 'asdf');";
    $sql = "INSERT INTO `transporte`.`auditoria` (`fecha_acceso`, `user`, `response_time`, `endpoint`) VALUES ('".date('Y-m-d H:i:s')."', '".token($data["token"])."', '".$time."', 'agregarVehiculo.php');";
    $ejecucionSQL = $conexion->prepare($sql);
    $ejecucionSQL->execute();
}
