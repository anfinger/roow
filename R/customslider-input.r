library(shiny)

#' @export
customsliderInput <- function (inputId, label, min, max, value, step = NULL, round = FALSE, 
          format = "#,##0.#####", locale = "us", ticks = TRUE, animate = FALSE){
    value <- if (inherits(value, c('POSIXct', 'POSIXlt', 'Date'))) format(value, '%Y-%m-%d %H:%M') else value
 
    if (identical(animate, TRUE)) 
        animate <- animationOptions()
    if (!is.null(animate) && !identical(animate, FALSE)) {
        if (is.null(animate$playButton)) 
            animate$playButton <- tags$i(class = "icon-play")
        if (is.null(animate$pauseButton)) 
            animate$pauseButton <- tags$i(class = "icon-pause")
    }
    tagList(
        tags$label(class="control-label", `for`=inputId, label)
        ,tags$input(type='text', id=inputId, class='shiny-slider-input', value=value)
        ,tags$div(id="valuelist",class = 'slider-container', value)
    )
}
#library(devtools)
# install_github('roow', 'oow') # install the package with the datetimeInput widget
#library(shiny)
#library(roow)

test <- function(include_dateInput=FALSE) {
    ui <- fluidPage(
        customsliderInput('slider_input', 'slider input', min=50, max=100, value=75),
        textOutput('text_out')
    )
    server <- function(input, output, session) {
        output$text_out <- renderText({
            input$slider_input
        })
    }
    runApp(list(ui=ui, server=server))
}

test() # datetimeInput works fine
test(TRUE)
