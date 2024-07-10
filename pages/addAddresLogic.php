<?php
include_once '../config.php';
#session_start();
#$userId = $_SESSION['user_id'];

if (isset($_POST['addAdress'])) {



    $address_type = $_POST['address_type'];
    $address_line_1 = $_POST['address_line_1'];
    $address_line_2 = $_POST['address_line_2'];
    $city = $_POST['city'];
    $state = $_POST['state'];
    $zip_code = $_POST['zip_code'];
    $country = $_POST['country'];
    $user_id = $userId;

    $sql = "INSERT INTO adress values (null, :address_type, :address_line_1,: address_line_2, :city, `:state`, :zip_code, :country, :user_id)";

    $prep = $con->prepare($sql);

    $prep->bindParam(':address_type', $address_type);
    $prep->bindParam(':address_line_1', $address_line_1);
    $prep->bindParam(':address_line_2', $address_line_2);
    $prep->bindParam(':city', $city);
    $prep->bindParam(':state', $state);
    $prep->bindParam(':zip_code', $zip_code);
    $prep->bindParam(':country', $country);
    $prep->bindParam(':user_id', $user_id);

    $prep->execute();

    Header("Location:pages/myProfile.php");
}
?>