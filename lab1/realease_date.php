<?php
include "connection.php";
?>


<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Lab1</title>
    <link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>

    <?php
   if (isset($_GET["period_start"]) && isset($_GET["period_end"])) {
    $period_start = $_GET["period_start"];
    $period_end = $_GET["period_end"];

    $stmt = $dbh->prepare( "SELECT * FROM film WHERE `date` between ? and ?");
    
    $stmt->execute([$period_start, $period_end]);
    $tabl_data = $stmt->fetchAll();

    echo "Films with a release date from " . $period_start . " to " . "$period_end: <br><br>";
    $table =  "<table  border=`1`>";
    $table .= " <tr><td> Name </td><td> Date </td><td> Country </td>
     <td> Quality </td><td> Resolution </td><td> Codec </td>
     <td> Producer </td><td> Director </td><td> Carrier </td></tr> ";

    foreach($tabl_data as $row) 
    { 
        $name = $row['name'];
        $date = $row['date'];
        $country = $row['country'];
        $quality = $row['quality'];
        $resolution = $row['resolution'];
        $codec = $row['codec'];
        $producer = $row['producer'];
        $director = $row['director'];
        $carrier = $row['carrier'];
    
    
        $table .=  " <tr><td> $name  </td> <td>$date </td><td>$country </td>
        <td>$quality  </td><td> $resolution </td><td>$codec </td>
        <td> $producer </td><td>$director </td><td>$carrier </td> </tr>";
    }
    $table .= "</table>";

    echo $table;
}
    ?>
 
</body>
<html>