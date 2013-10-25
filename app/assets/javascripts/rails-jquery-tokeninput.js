//= require jquery.tokeninput

$(function() {
    $.each($('.tokeninput'), function(index, input) {
        $(input).tokenInput(
            $(input).data('tokeninput').collection,
            $(input).data('tokeninput').options
        );
    });
});
