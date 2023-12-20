{function searchTrains(){
    origin_station = document.getElementById("sourceStation").options[document.getElementById("sourceStation").selectedIndex].value;
    dest_station = document.getElementById("destinationStation").options[document.getElementById("destinationStation").selectedIndex].value;

    console.log(origin_station, dest_station);
}}