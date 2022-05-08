<?php
session_start();
if (!empty($_SESSION['active'])) {
    header('location: src/');
} else {
    if (!empty($_POST)) {
        $alert = '';
        if (empty($_POST['usuario']) || empty($_POST['clave'])) {
            $alert = '<div class="alert alert-warning alert-dismissible fade show" role="alert">
                        Ingrese usuario y contraseña
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>';
        } else {
            require_once "conexion.php";
            $user = mysqli_real_escape_string($conexion, $_POST['usuario']);
            $clave = md5(mysqli_real_escape_string($conexion, $_POST['clave']));
            $query = mysqli_query($conexion, "SELECT * FROM usuario WHERE usuario = '$user' AND clave = '$clave'");
            mysqli_close($conexion);
            $resultado = mysqli_num_rows($query);
            if ($resultado > 0) {
                $dato = mysqli_fetch_array($query);
                $_SESSION['active'] = true;
                $_SESSION['idUser'] = $dato['idusuario'];
                $_SESSION['nombre'] = $dato['nombre'];
                $_SESSION['user'] = $dato['usuario'];
                header('Location: src/');
            } else {
                $alert = '<div class="alert alert-danger alert-dismissible fade show" role="alert">
                        Contraseña incorrecta
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>';
                session_destroy();
            }
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión</title>
    <link rel="stylesheet" href="assets/css/stylos.css">
</head>
<body>
    <div>
        <div class="card">
            <center><h2 class="card-header">Iniciar sesion</h2></center>
            <form action="" id="login-form" method="POST">
                <div class="">
                    <div>
                        <input type="text" class="input" name="usuario" id="usuario" placeholder="Usuario" >
                    </div>
                    <div>
                        <input type="password" class="input" name="clave" id="clave" placeholder="Contraseña" >
                    </div>
					<?php echo (isset($alert)) ? $alert : '' ; ?>
                    <center>
                    <h2 class="button">
                        <input type="submit" value="Login">
                    </h2> </center>
                </div>
            </form>
        </div>

    </div>
	<script src="assets/js/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
	<script src="assets/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

</body>

</html>