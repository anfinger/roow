library(shiny)

#' @export
datetimeInput <- function(inputId, label, min=NULL, max=NULL) {
    tagList(
        singleton(tags$head(tags$script(src="roow/jquery-ui-1.10.4.min.js")))
        ,singleton(tags$head(tags$link(href="roow/jquery-ui.css", rel='stylesheet', type='text/css')))
        ,singleton(tags$head(tags$script(src="roow/timepicker/jquery-ui-timepicker-addon.js")))
        ,singleton(tags$head(tags$script(src="roow/timepicker/timepicker_bindings.js")))
        ,singleton(tags$head(tags$link(href="roow/timepicker/jquery-ui-timepicker-addon.css", rel='stylesheet', type='text/css')))
        ,tags$label(class="control-label", `for`=inputId, label)
        ,tags$input(type='text', id=inputId, class='shiny-datetime-input')
        ,tags$script(sprintf("$(function() {$('#%s').datetimepicker(
            {minDate: '%s', maxDate: '%s', changeMonth: true, changeYear: true, showButtonPanel: true}
        )})", inputId, min, max))
    )
}


test <- function() {
    ui <- fluidPage(
        datetimeInput('dtime_input', 'datetime input', min='1/1/1999', max='1/2/1999'),
        textOutput('text_out')
    )

    server <- function(input, output, session) {
        output$text_out <- renderText({
            input$dtime_input
        })
    }
    runApp(list(ui=ui, server=server))
}
