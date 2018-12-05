<?php
include("myconnection.php");
include("token.php");
switch ($_SERVER['REQUEST_METHOD']) {
    case "POST":
        $data = json_decode(file_get_contents("php://input"), true);
        if(($user = token($data["token"])) != false) {
            $time_pre = microtime(true);
            $sql = "INSERT INTO `transporte`.`sistema_vehiculo` (`vehiculo_id`, `sistema_id`) VALUES ('".$data["vehiculo_id"]."', '".$data["sistema_id"]."');";
            $ejecucionSQL = $conexion->prepare($sql);
            $ejecucionSQL->execute();

            $time_post = microtime(true);
            $time = $time_post - $time_pre;
            $time = $time*pow(10, 3);

            $sql = "INSERT INTO `transporte`.`auditoria` (`fecha_acceso`, `user`, `response_time`, `endpoint`) VALUES ('".date('Y-m-d H:i:s')."', '".token($data["token"])."', '".$time."', 'agregarSistemaVehiculo.php');";
            $ejecucionSQL = $conexion->prepare($sql);
            $ejecucionSQL->execute();
        }
        break;
    case "GET":
        if(token($_GET['token']) != false) {
            $time_pre = microtime(true);
            if (!empty($_GET['id'])) {
                $sql = "SELECT * FROM sistema_vehiculo WHERE sistemavehiculo_id=".$_GET["id"].";";
                $ejecucionSQL = $conexion->prepare($sql);
                $ejecucionSQL->execute();
                $res = $ejecucionSQL->fetch(PDO::FETCH_ASSOC);
                echo json_encode($res);
            } else {
                $sql = "SELECT * FROM sistema_vehiculo;";
                $ejecucionSQL = $conexion->prepare($sql);
                $ejecucionSQL->execute();
                $sistema_vehiculos = array();
                while($res = $ejecucionSQL->fetch(PDO::FETCH_ASSOC)) {
                    $sistema_vehiculos["Sistema_vehiculo"][] = $res;
                }
                echo json_encode($sistema_vehiculos);
            }
            $time_post = microtime(true);
            $time = $time_post - $time_pre;
            $time = $time * pow(10, 3);

            $sql = "INSERT INTO `transporte`.`auditoria` (`fecha_acceso`, `user`, `response_time`, `endpoint`) VALUES ('" . date('Y-m-d H:i:s') . "', '" . token($_GET['token']) . "', '" . $time . "', 'listarChofer');";
            $ejecucionSQL = $conexion->prepare($sql);
            $ejecucionSQL->execute();
        }
        break;
    case "PUT":
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
        break;
    case "DELETE":
        $data = json_decode(file_get_contents("php://input"), true);
        if(($user = token($data["token"])) != false) {
            $time_pre = microtime(true);
            $sql = "DELETE FROM `transporte`.`sistema_vehiculo` WHERE `sistemavehiculo_id` = '".$data["sistemavehiculo_id"]."';";
            $ejecucionSQL = $conexion->prepare($sql);
            $ejecucionSQL->execute();
            $time_post = microtime(true);
            $time = $time_post - $time_pre;
            $sql = "INSERT INTO `transporte`.`auditoria` (`fecha_acceso`, `user`, `response_time`, `endpoint`) VALUES ('".date('Y-m-d H:i:s')."', '".token($data["token"])."', '".$time."', 'eliminarSistemaVehiculo.php');";
            $ejecucionSQL = $conexion->prepare($sql);
            $ejecucionSQL->execute();
        }
        break;
}