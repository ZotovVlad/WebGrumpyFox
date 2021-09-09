    updateRatingGamesInterval = 60000;
    jQuery(document).ready(function($) {
    $(document).ready(function(){
        updateRatingGames();
        setInterval('updateRatingGames()', updateRatingGamesInterval);
    });
});
    function updateRatingGames() {
    $.ajax({
        type : "GET",
        contentType : "application/json",
        url : "${home}/updateRatingGames",
        data : JSON.stringify(""),
        dataType : 'json',
        timeout : 100000,
        async: true,
        success : function(data) {
            console.log("SUCCESS: ", data);
            displayUpdateRatingGames(data);
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

    function displayUpdateRatingGames(data) {
    var json = JSON.stringify(data, null, 4);
    var obj = jQuery.parseJSON(json);
    var str = obj.result;
    str = str.split(",");
    for (var i = 0; i < str.length; i++) {
    var id = i + 1;
    $("#" + id).html(str[i]);
}

}