<?php
include("myconnection.php");
include("token.php");
    switch ($_SERVER['REQUEST_METHOD']) {
        case "POST":
            $data = json_decode(file_get_contents("php://input"),true);
            echo $data['token'];
            if(token($data["token"]) != false) {
                $time_pre = microtime(true);
                $sql = "INSERT INTO `transporte`.`chofer` (`apellido`, `nombre`, `documento`, `email`, `vehiculo_id`, `sistema_id`) VALUES ('" . $data["apellido"] . "', '" . $data["nombre"] . "', '" . $data["documento"] . "', '" . $data["email"] . "', '" . $data["vehiculo_id"] . "', '" . $data["sistema_id"] . "');";
                $ejecucionSQL = $conexion->prepare($sql);
                $ejecucionSQL->execute();

                $time_post = microtime(true);
                $time = $time_post - $time_pre;
                $time = $time * pow(10, 3);
                $sql = "INSERT INTO `transporte`.`auditoria` (`fecha_acceso`, `user`, `response_time`, `endpoint`) VALUES ('" . date('Y-m-d H:i:s') . "', '" . token($data["token"]) . "', '" . $time . "', 'agregarChofer');";
                $ejecucionSQL = $conexion->prepare($sql);
                $ejecucionSQL->execute();
            }
            break;
        case "GET":
            if(token($_GET['token']) != false) {
                $time_pre = microtime(true);
                if (!empty($_GET['id'])) {
                    $sql = "SELECT chofer.`chofer_id`,chofer.`apellido`,chofer.`nombre`,chofer.`documento`,chofer.`email`,marca,sistema_transporte.`nombresistema` FROM chofer INNER JOIN vehiculo ON chofer.vehiculo_id = vehiculo.vehiculo_id INNER JOIN sistema_transporte ON chofer.sistema_id = sistema_transporte.`sistema_id` WHERE chofer.chofer_id = '" . $_GET['id'] . "';";
                    $ejecucionSQL = $conexion->prepare($sql);
                    $ejecucionSQL->execute();
                    $res = $ejecucionSQL->fetch(PDO::FETCH_ASSOC);
                    echo json_encode($res);
                } else {
                    $sql = "SELECT chofer.`chofer_id`,chofer.`apellido`,chofer.`nombre`,chofer.`documento`,chofer.`email`,marca,sistema_transporte.`nombresistema` FROM chofer INNER JOIN vehiculo ON chofer.vehiculo_id = vehiculo.vehiculo_id INNER JOIN sistema_transporte ON chofer.sistema_id = sistema_transporte.`sistema_id`";
                    $stmt = $conexion->prepare($sql);
                    $stmt->execute();

                    $choferes = array();

                    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {

                        $choferes['Choferes'][] = $row;

                    }

                    echo json_encode($choferes);
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
            $data = json_decode(file_get_contents("php://input"),true);
            if(token($data["token"]) != false) {
                $time_pre = microtime(true);

                if (isset($data["apellido"])) {
                    $sql = "UPDATE `transporte`.`chofer` SET `apellido` = '" . $data["apellido"] . "' WHERE `chofer_id` = '" . $data["chofer_id"] . "';";
                    $ejecucionSQL = $conexion->prepare($sql);
                    $ejecucionSQL->execute();
                }

                if (isset($data["nombre"])) {
                    $sql = "UPDATE `transporte`.`chofer` SET `nombre` = '" . $data["nombre"] . "' WHERE `chofer_id` = '" . $data["chofer_id"] . "';";
                    $ejecucionSQL = $conexion->prepare($sql);
                    $ejecucionSQL->execute();
                }

                if (isset($data["documento"])) {
                    $sql = "UPDATE `transporte`.`chofer` SET `documento` = '" . $data["documento"] . "' WHERE `chofer_id` = '" . $data["chofer_id"] . "';";
                    $ejecucionSQL = $conexion->prepare($sql);
                    $ejecucionSQL->execute();
                }

                if (isset($data["email"])) {
                    $sql = "UPDATE `transporte`.`chofer` SET `email` = '" . $data["email"] . "' WHERE `chofer_id` = '" . $data["chofer_id"] . "';";
                    $ejecucionSQL = $conexion->prepare($sql);
                    $ejecucionSQL->execute();
                }

                if (isset($data["vehiculo_id"])) {
                    $sql = "UPDATE `transporte`.`chofer` SET `vehiculo_id` = '" . $data["vehiculo_id"] . "' WHERE `chofer_id` = '" . $data["chofer_id"] . "';";
                    $ejecucionSQL = $conexion->prepare($sql);
                    $ejecucionSQL->execute();
                }

                if (isset($data["sistema_id"])) {
                    $sql = "UPDATE `transporte`.`chofer` SET `sistema_id` = '" . $data["sistema_id"] . "' WHERE `chofer_id` = '" . $data["chofer_id"] . "';";
                    $ejecucionSQL = $conexion->prepare($sql);
                    $ejecucionSQL->execute();
                }

                $time_post = microtime(true);
                $time = $time_post - $time_pre;
                $time = $time * pow(10, 3);
                $sql = "INSERT INTO `transporte`.`auditoria` (`fecha_acceso`, `user`, `response_time`, `endpoint`) VALUES ('" . date('Y-m-d H:i:s') . "', '" . token($data["token"]) . "', '" . $time . "', 'editarChofer');";
                $ejecucionSQL = $conexion->prepare($sql);
                $ejecucionSQL->execute();
            }
            break;
    }