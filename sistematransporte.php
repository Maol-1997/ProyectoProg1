<?php
include("myconnection.php");
include("token.php");
switch ($_SERVER['REQUEST_METHOD']) {
    case "POST":
        $data = json_decode(file_get_contents("php://input"),true);
        if(token($data["token"]) != false) {
            $time_pre = microtime(true);

            $sql = "INSERT INTO `transporte`.`sistema_transporte` (`nombresistema`, `pais_procedencia`) VALUES ('" . $data["nombresistema"] . "', '" . $data["pais_procedencia"] . "');";
            $ejecucionSQL = $conexion->prepare($sql);
            $ejecucionSQL->execute();

            $time_post = microtime(true);
            $time = $time_post - $time_pre;
            $time = $time*pow(10,3);
            $sql = "INSERT INTO `transporte`.`auditoria` (`fecha_acceso`, `user`, `response_time`, `endpoint`) VALUES ('".date('Y-m-d H:i:s')."', '".token($data["token"])."', '".$time."', 'agregarSistemaTransporte');";
            $ejecucionSQL = $conexion->prepare($sql);
            $ejecucionSQL->execute();
        }
        break;
    case "GET":
        if(token($_GET['token']) != false) {
            $time_pre = microtime(true);
            if(!empty($_GET['id'])) {
                $sql = "SELECT * FROM sistema_transporte WHERE sistema_id = '".$_GET['id']."'";
                $ejecucionSQL = $conexion->prepare($sql);
                $ejecucionSQL->execute();
                $res = $ejecucionSQL->fetch(PDO::FETCH_ASSOC);
                echo json_encode($res);
            }else {
                $sql = "SELECT * FROM sistema_transporte";
                $stmt = $conexion->prepare($sql);
                $stmt->execute();

                $choferes = array();

                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {

                    $choferes['SistemasDeTransporte'][] = $row;

                }

                echo json_encode($choferes);
            }
            $time_post = microtime(true);
            $time = $time_post - $time_pre;
            $time = $time*pow(10,3);

            $sql = "INSERT INTO `transporte`.`auditoria` (`fecha_acceso`, `user`, `response_time`, `endpoint`) VALUES ('".date('Y-m-d H:i:s')."', '".token($_GET['token'])."', '".$time."', 'listarSistemaTransporte');";
            $ejecucionSQL = $conexion->prepare($sql);
            $ejecucionSQL->execute();
        }
        break;
    case "PUT":
        $data = json_decode(file_get_contents("php://input"),true);
        if(token($data["token"]) != false) {
            $time_pre = microtime(true);

            if (isset($data["nombresistema"])) {
                $sql = "UPDATE `transporte`.`sistema_transporte` SET `nombresistema` = '" . $data["nombresistema"] . "' WHERE `sistema_id` = '" . $data["sistema_id"] . "';";
                $ejecucionSQL = $conexion->prepare($sql);
                $ejecucionSQL->execute();
            }

            if (isset($data["pais_procedencia"])) {
                $sql = "UPDATE `transporte`.`sistema_transporte` SET `pais_procedencia` = '" . $data["pais_procedencia"] . "' WHERE `sistema_id` = '" . $data["sistema_id"] . "';";
                $ejecucionSQL = $conexion->prepare($sql);
                $ejecucionSQL->execute();
            }

            $time_post = microtime(true);
            $time = $time_post - $time_pre;
            $time = $time*pow(10,3);
            $sql = "INSERT INTO `transporte`.`auditoria` (`fecha_acceso`, `user`, `response_time`, `endpoint`) VALUES ('".date('Y-m-d H:i:s')."', '".token($data["token"])."', '".$time."', 'editarSistemaTransporte');";
            $ejecucionSQL = $conexion->prepare($sql);
            $ejecucionSQL->execute();
        }
        break;
    case "DELETE":
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
        break;
}