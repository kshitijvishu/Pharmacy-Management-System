<?php
session_start();
class CSRF
{
    public static function create_token()
    {
        $token = md5(time());
        $_SESSION["token"] = $token;
        echo "<input type='hidden' name='token' value='$token' />";
    }
}
?>