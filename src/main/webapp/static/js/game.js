updateRatingGameInterval = 60000;

jQuery(document).ready(function($) {
    $(document).ready(function(){
        updateRatingGame();
        setInterval('updateRatingGame()', updateRatingGameInterval);
    });
});
function updateRatingGame() {
    $.ajax({
        type : "GET",
        contentType : "application/json",
        url : "${home}${gameId}/updateRatingGame",
        data : JSON.stringify(""),
        dataType : 'json',
        timeout : 100000,
        async: true,
        success : function(data) {
            console.log("SUCCESS: ", data);
            displayUpdateRatingGame(data);
        },
        error : function(e) {
            console.log("ERROR: ", e);
            displayUpdateRatingGame(e);
        },
        done : function(e) {
            console.log("DONE");
            enableSearchButton(true);
        }
    });
}
function displayUpdateRatingGame(data) {
    var json = JSON.stringify(data, null, 4);
    var obj = jQuery.parseJSON(json);
    var str = obj.result;
    $('#gameRating').html(str);
}

$("#like").click(function(){
    $.ajax({
        type : "POST",
        contentType : "application/json",
        url : "${home}${gameId}/likeGame",
        data : JSON.stringify(""),
        dataType : 'json',
        timeout : 100000,
        async: true,
        success : function(data) {
            console.log("SUCCESS: ", data);
            displayUpdateRatingGame(data);
        },
        error : function(e) {
            console.log("ERROR: ", e);
            displayUpdateRatingGame(e);
        },
        done : function(e) {
            console.log("DONE");
            enableSearchButton(true);
        }
    });
})
$("#dislike").click(function(){
    $.ajax({
        type : "POST",
        contentType : "application/json",
        url : "${home}${gameId}/dislikeGame",
        data : JSON.stringify(""),
        dataType : 'json',
        timeout : 100000,
        async: true,
        success : function(data) {
            console.log("SUCCESS: ", data);
            displayRating(data);
        },
        error : function(e) {
            console.log("ERROR: ", e);
            displayRating(e);
        },
        done : function(e) {
            console.log("DONE");
            enableSearchButton(true);
        }
    });
})
function displayRating(data) {
    var json = JSON.stringify(data, null, 4);
    var obj = jQuery.parseJSON(json);
    var str = obj.result;
    $('#gameRating').html(str);
}