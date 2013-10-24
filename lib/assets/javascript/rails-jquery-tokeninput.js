$(function() {
    for (var input in ('.tokeninput')) {
        $(input).tokenInput(
            $(input).data('tokeninput').collection,
            $(input).data('tokeninput').options
        )
    }
});
