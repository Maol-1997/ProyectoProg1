<?php
include("myconnection.php");
include("token.php");
$data = json_decode(file_get_contents("php://input"), true);
if(($user = token($data["token"])) != false) {
    $time_pre = microtime(true);
    if (isset($data["patente"])) {
        $sql = "UPDATE `transporte`.`vehiculo` SET `patente` = '" . $data["patente"] . "' WHERE `vehiculo_id` = '" . $data["id"] . "';";
        $ejecucionSQL = $conexion->prepare($sql);
        $ejecucionSQL->execute();
    }

    if (isset($data["anho_patente"])) {
        $sql = "UPDATE `transporte`.`vehiculo` SET `anho_patente` = '" . $data["anho_patente"] . "' WHERE `vehiculo_id` = '" . $data["id"] . "';";
        $ejecucionSQL = $conexion->prepare($sql);
        $ejecucionSQL->execute();
    }

    if (isset($data["anho_fabricacion"])) {
        $sql = "UPDATE `transporte`.`vehiculo` SET `anho_fabricacion` = '" . $data["anho_fabricacion"] . "' WHERE `vehiculo_id` = '" . $data["id"] . "';";
        $ejecucionSQL = $conexion->prepare($sql);
        $ejecucionSQL->execute();
    }

    if (isset($data["marca"])) {
        $sql = "UPDATE `transporte`.`vehiculo` SET `marca` = '" . $data["marca"] . "' WHERE `vehiculo_id` = '" . $data["id"] . "';";
        $ejecucionSQL = $conexion->prepare($sql);
        $ejecucionSQL->execute();
    }

    if (isset($data["modelo"])) {
        $sql = "UPDATE `transporte`.`vehiculo` SET `modelo` = '" . $data["modelo"] . "' WHERE `vehiculo_id` = '" . $data["id"] . "';";
        $ejecucionSQL = $conexion->prepare($sql);
        $ejecucionSQL->execute();
    }
    $time_post = microtime(true);
    $time = $time_post - $time_pre;
    $sql = "INSERT INTO `transporte`.`auditoria` (`fecha_acceso`, `user`, `response_time`, `endpoint`) VALUES ('".date('Y-m-d H:i:s')."', '".token($data["token"])."', '".$time."', 'modificarVehiculo.php');";
    $ejecucionSQL = $conexion->prepare($sql);
    $ejecucionSQL->execute();
}