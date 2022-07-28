<?php include 'connection.php';?>
<!DOCTYPE HTML>
<html>
<head>
    <title>Lab1</title>
    <link href="style_lab1.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="container">
<form action="genre.php" method="GET">
<a>Genre:</a>
    <select name='genre'>
    <?php
        try{
            $sql = 'SELECT * FROM genre';
            $res = $dbh->query($sql);
            foreach($res as $sel){
                $name = $sel['title'];
                print "<option>$name</option>";
            }
        }
        catch(PDOException $ex)
        {
            print "Error".$ex->getMessage();
            die();
        }
    ?>
    </select>
    <input type="submit" value="search">
</form>



<form action="actor.php" method="GET">
<a>Actor:</a>
    <select name='actor'>
    <?php
        try{
            $sql = 'SELECT * FROM actor';
            $res = $dbh->query($sql);
            foreach($res as $sel){
                print "<option>$sel[1]</option>";
            }
        }
        catch(PDOException $ex)
        {
            print "Error".$ex->getMessage();
            die();
        }
    ?>
    </select>
    <input type="submit" value="search">
</form>


<form action="realease_date.php" method="GET">
    <a>Release date:</a>
    <a>From:</a>
    <input type="date" name="period_start"> 
    <a>To:</a>
    <input type="date" name="period_end">
    <input type="submit" value="search">

</form>
</div>
</body>

</html>