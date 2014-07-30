library(shiny)

#' @export
datetimeInput <- function(inputId, label, value, min=NULL, max=NULL) {
    value <- if (inherits(value, c('POSIXct', 'POSIXlt', 'Date'))) format(value, '%Y-%m-%d %H:%M') else value
    tagList(
        singleton(tags$head(tags$script(src="roow/jquery-ui-1.10.4.min.js")))
        ,singleton(tags$head(tags$link(href="roow/jquery-ui.css", rel='stylesheet', type='text/css')))
        ,singleton(tags$head(tags$script(src="roow/timepicker/jquery-ui-timepicker-addon.js")))
        ,singleton(tags$head(tags$script(src="roow/timepicker/timepicker_bindings.js")))
        ,singleton(tags$head(tags$link(href="roow/timepicker/jquery-ui-timepicker-addon.css", rel='stylesheet', type='text/css')))
        ,tags$label(class="control-label", `for`=inputId, label)
        ,tags$input(type='text', id=inputId, class='shiny-datetime-input', value=value)
        ,tags$script(sprintf("$(function() {$('#%s').datetimepicker(
            {minDate: '%s', maxDate: '%s', changeMonth: true, changeYear: true, showButtonPanel: true}
        )})", inputId, min, max))
    )
}

library(devtools)
install_github('roow', 'oow') # install the package with the datetimeInput widget

library(shiny)
library(roow)

test <- function(include_dateInput=FALSE) {
   ui <- fluidPage(
       if (include_dateInput) dateInput('date_input', 'date input', value='1/1/1999') else div(),
       datetimeInput('dtime_input', 'datetime input', min='1/1/1999', max='1/2/1999', value='1/2/1999'),
       textOutput('text_out')
   )
   server <- function(input, output, session) {
       output$text_out <- renderText({
           input$dtime_input
       })
   }
   runApp(list(ui=ui, server=server))
}

test() # datetimeInput works fine
test(TRUE) # datetimeInput doesn't work. If you are in Chrome, you can view the error message with Ctrl+Shit+J

In jquery-ui-timepicker-addon.js I've included a call to console.log right before the error is encountered to show that is in fact the dateInput element that is causing the error









