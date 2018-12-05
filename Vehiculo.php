<?php
include("myconnection.php");
include("token.php");
switch ($_SERVER['REQUEST_METHOD']) {
    case "POST":
        $data = json_decode(file_get_contents("php://input"), true);
        if(($user = token($data["token"])) != false) {
            $time_pre = microtime(true);
            $sql = "INSERT INTO `transporte`.`vehiculo` (`patente`, `anho_patente`, `anho_fabricacion`, `marca`, `modelo`) VALUES ('" . $data["patente"] . "', '" . $data["anho_patente"] . "', '" . $data["anho_fabricacion"] . "', '" . $data["marca"] . "', '" . $data["modelo"] . "');";
            $ejecucionSQL = $conexion->prepare($sql);
            $ejecucionSQL->execute();
            $time_post = microtime(true);
            $time = $time_post - $time_pre;
            $time = $time*pow(10, 3);

            $sql = "INSERT INTO `transporte`.`auditoria` (`fecha_acceso`, `user`, `response_time`, `endpoint`) VALUES ('".date('Y-m-d H:i:s')."', '".token($data["token"])."', '".$time."', 'agregarVehiculo.php');";
            $ejecucionSQL = $conexion->prepare($sql);
            $ejecucionSQL->execute();
        }
        break;
    case "GET":
        if(token($_GET['token']) != false) {
            $time_pre = microtime(true);
            if (!empty($_GET['id'])) {
                $sql = "SELECT * FROM vehiculo WHERE id=".$_GET["id"].";";
                $ejecucionSQL = $conexion->prepare($sql);
                $ejecucionSQL->execute();
                $res = $ejecucionSQL->fetch(PDO::FETCH_ASSOC);
                echo json_encode($res);
            } else {
                $sql = "SELECT * FROM vehiculo";
                $ejecucionSQL = $conexion->prepare($sql);
                $ejecucionSQL->execute();
                $vehiculos = array();
                while($res = $ejecucionSQL->fetch(PDO::FETCH_ASSOC)) {
                    $vehiculos["vehiculos"][] = $res;
                }
                echo json_encode($vehiculos);
                $time_post = microtime(true);
                $time = $time_post - $time_pre;
                $time = $time * pow(10, 3);

                $sql = "INSERT INTO `transporte`.`auditoria` (`fecha_acceso`, `user`, `response_time`, `endpoint`) VALUES ('" . date('Y-m-d H:i:s') . "', '" . token($_GET['token']) . "', '" . $time . "', 'listarChofer');";
                $ejecucionSQL = $conexion->prepare($sql);
                $ejecucionSQL->execute();
            }
        }
        break;
    case "PUT":
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
        break;
    case "DELETE":
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
        break;
}