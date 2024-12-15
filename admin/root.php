
<?php

$connect = mysqli_connect('s54ham9zz83czkff.cbetxkdyhwsb.us-east-1.rds.amazonaws.com', 'f4gq4vwbzbcnptj9', 'q2qzcjhp0lisqdm7', 'w4t40p61r1k835wr');
mysqli_set_charset($connect, 'UTF8');

if ($connect === false) {
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
if (!function_exists('currency_format')) {
    function currency_format($number, $suffix = 'đ') {
        if (!empty($number)) {
            return number_format($number, 0, ',', '.') . "{$suffix}";
        }
    }
}