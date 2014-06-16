var datetimeInputBinding = new Shiny.InputBinding();
$.extend(datetimeInputBinding, {
    find: function(scope)  {
        return $(scope).find('.shiny-datetime-input');
    },
    getId: function(el) {
        return $(el).attr('id');
    },
    getValue: function(el) {
        return $(el).datetimepicker().val();
    },
    setValue: function(el, value) {
        var parsedDate = $.datepicker.parseDate('yy-mm-dd', value);
        $(el).datepicker('setDate', parsedDate);
    },
    subscribe: function(el, callback) {
        var elem = $(el)
        elem.on('change.shiny-datetime-input', function(e) {
            callback();
        });
    },
    unsubscribe: function(el) {
        $(el).off('.shiny-datetime-input')
    }
});

Shiny.inputBindings.register(datetimeInputBinding, 'datetimeInput');
