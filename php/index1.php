<?php
$servername = "localhost";
$username = "root";
$password = "ghiglieno";
$dbname = "classicmodels";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$stmt = $conn->prepare('SELECT country FROM v_country');

// eseguo la query
$stmt->execute();

// prendo il risultato
$result = $stmt->get_result();

//dobbiamo ottenere:
//<option value="USA">USA</option>
//<option value="UK">UK</option>
//....
$ht = "";

if ($result->num_rows > 0) {
    // output data of each row
    // fetch_assoc è il metodo che recupera un record per volta, e si posiziona sul record successivo
    while ($row = $result->fetch_assoc()) {
        // &agrave; è un HTML special caracters
        //echo "code: " . $row["officeCode"]. " - Citt&agrave;: " . $row["city"]. " " . $row["country"]. "<br>";
        $ht = $ht . '<option value="' . $row["country"] . '">' . $row["country"] . '</option>';
    }
}
$conn->close();
?>

<script>
function showEmp() {
    let str=document.getElementById("scountry").value;
    if (str.length == 0) { 
        document.getElementById("myemp").innerHTML = "";
        return;
    } else {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("myemp").innerHTML = this.responseText;
            }
        };
        xmlhttp.open("GET", "getEmps.php?country=" + str, true);
        xmlhttp.send();
    }
}
</script>



<html>
    <body>

        <form action="ris1.php" method="post">
            Name: <input type="text" name="name"><br/>
            E-mail: <input type="text" name="email"><br/>
            <input type="submit"><br/>
            <input type="text" name="testo" id="intest">

            <input type="hidden" name="paramhid" value="nascosto hidden">
        </form>

        <form action="risdb.php" method="post">
            country: <select name="country" id="scountry">
                <?php
                echo $ht;
                ?>
            </select>

            <input type="text" name="country2"><br/>
            <input type="submit"><br/>
            <input type="button" onclick="showEmp()" value="ajax load"><br/>

        </form>

        <div id="myemp">nessuno</div>
    </body>
</html>
