const MovieChanged = (URL) => {
    
    $.post(URL, {

        "movieId": $("#MovieId option:selected").val()

    }, function (data) {

        document.getElementById("Movie_ReleaseDate").value = data.movie.releaseDate;
        document.getElementById("Movie_Duration").value = data.movie.duration;
        document.getElementById("Movie_Director").value = data.movie.director;
        document.getElementById("Movie_Actors").value = data.movie.actors;

    });

};