//= require jquery
//= require jquery.tokeninput

$(function() {
    $.each($('input[data-tokeninput]'), function(index, input) {
        var inputName = $(input).attr('name');
        var options = $(input).data('tokeninput').options;

        var add_input = function(value) {
            var inputItemName  = inputName + '[]';
            $('<input name="' + inputItemName + '" type="text" style="display: none;" value="' + value + '">').insertAfter(input);
        }

        var add_item = function(item) {
            var inputItemValue = item[$(input).data('tokeninput').options.tokenValue || 'id'];
            add_input(inputItemValue);
        }

        $(input).attr('name', '');

        options.onAdd = add_item;

        options.onDelete = function(item) {
            var inputItemValue = item[$(input).data('tokeninput').options.tokenValue || 'id'];
            $('input[value="' + inputItemValue + '"]').remove();
            add_input('');
        };

        if(options.prePopulate) {
            $.each(options.prePopulate, function(index, itemToPrePopulate) {
                add_item(itemToPrePopulate)
            });
        }

        $(input).tokenInput($(input).data('tokeninput').collection, options);
    });
});
