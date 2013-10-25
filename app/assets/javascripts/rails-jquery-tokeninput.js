//= require jquery.tokeninput

$(function() {
    $.each($('input[data-tokeninput]'), function(index, input) {
        $(input).tokenInput(
            $(input).data('tokeninput').collection,
            $(input).data('tokeninput').options
        );
    });
});
