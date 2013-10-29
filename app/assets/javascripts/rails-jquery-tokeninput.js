//= require jquery.tokeninput

$(function() {
    $.each($('input[data-tokeninput]'), function(index, input) {
        var inputName = $(input).attr('name')
        $(input).attr('name', '');

        $(input).data('tokeninput').options.onAdd = function(item) {
            var inputItemName  = inputName + '[]';
            var inputItemValue = item[$(input).data('tokeninput').options.tokenValue || 'id'];

            $('<input name="' + inputItemName + '" type="text" style="display: none;" value="' + inputItemValue + '">').insertAfter(input);
        };

        $(input).data('tokeninput').options.onDelete = function(item) {
            var inputItemValue = item[$(input).data('tokeninput').options.tokenValue || 'id'];
            $('input[value="' + inputItemValue + '"]').remove();
        };

        $(input).tokenInput(
            $(input).data('tokeninput').collection,
            $(input).data('tokeninput').options
        );
    });
});
