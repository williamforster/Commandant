/**
 * On load do an ajax request and put the data ... to console
 */
$(document).ready(function() {
    console.log("Running script");
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            console.log(this.responseText);
        } else {
            console.log("AJAX request failed");
        }
    };
    xmlhttp.open("GET", "ajax_get_data.php", true);
    xmlhttp.send();
});