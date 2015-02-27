//= require jquery
//= require jquery.tokeninput

$(function() {
    var DEFAULTS = {
        options: { tokenValue: 'id' },
        source: []
    };

    $.each($('input[data-tokeninput]'), function(index, input) {
        var inputName = $(input).attr('name');
        var source = $(input).data('tokeninput').collection || DEFAULTS.source;
        var options = $.extend({}, DEFAULTS.options, $(input).data('tokeninput').options);

        var addInput = function(value) {
            var inputItemName = inputName + '[]';
            $('<input name="' + inputItemName + '" type="text" style="display: none;" value="' + value + '">').insertAfter(input);
        }

        var addItem = function(item) {
            var inputItemValue = item[options.tokenValue];
            addInput(inputItemValue);
        }

        var deleteItem = function(item) {
            var inputItemValue = item[options.tokenValue];
            $('input[value="' + inputItemValue + '"]').remove();
            addInput('');
        };

        options.onAdd = addItem;
        options.onDelete = deleteItem;

        if(options.prePopulate) {
            $.each(options.prePopulate, function(index, itemToPrePopulate) {
                addItem(itemToPrePopulate)
            });
        }

        $(input).attr('name', '');
        $(input).tokenInput(source, options);
    });
});
