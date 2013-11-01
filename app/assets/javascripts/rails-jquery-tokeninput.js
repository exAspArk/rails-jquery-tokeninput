//= require jquery.tokeninput

$(function() {
    $.each($('input[data-tokeninput]'), function(index, input) {
        var inputName = $(input).attr('name');
        var options = $(input).data('tokeninput').options;

        $(input).attr('name', '');

        options.onAdd = function(item) {
            var inputItemName  = inputName + '[]';
            var inputItemValue = item[$(input).data('tokeninput').options.tokenValue || 'id'];

            $('<input name="' + inputItemName + '" type="text" style="display: none;" value="' + inputItemValue + '">').insertAfter(input);
        };

        options.onDelete = function(item) {
            var inputItemValue = item[$(input).data('tokeninput').options.tokenValue || 'id'];
            $('input[value="' + inputItemValue + '"]').remove();
        };

        if (options.prePopulate) {
            $.each(options.prePopulate, function(index, itemToPrePopulate) {
                options.onAdd(itemToPrePopulate)
            });
        }

        $(input).tokenInput($(input).data('tokeninput').collection, options);
    });
});
