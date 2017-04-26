

$(document).on('page:load', function() {
    $(".clickable").click(function() {
        console.log($(this).data("link"));
        window.location = $(this).data("link");
    });
});