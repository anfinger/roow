library(shiny)

#' @export
customsliderInput <- function (inputId, label, min, max, value, step = NULL, round = FALSE, 
          format = "#,##0.#####", locale = "us", ticks = TRUE, animate = FALSE){
    if (identical(animate, TRUE)) 
        animate <- animationOptions()
    if (!is.null(animate) && !identical(animate, FALSE)) {
        if (is.null(animate$playButton)) 
            animate$playButton <- tags$i(class = "icon-play")
        if (is.null(animate$pauseButton)) 
            animate$pauseButton <- tags$i(class = "icon-pause")
    }
    tags$div(id="valuelist", value)
    tags$div(tagList(controlLabel(inputId, label), slider(inputId, 
                                                          min = min, max = max, value = value, step = step, round = round, 
                                                          locale = locale, format = format, ticks = ticks, animate = animate)))
}
# library(devtools)
# install_github('roow', 'oow') # install the package with the datetimeInput widget
# library(shiny)
# library(roow)
# 
# test <- function(include_dateInput=FALSE) {
#     ui <- fluidPage(
#         customsliderInput('slider_input', 'slider input', min=50, max=100, value=75),
#         textOutput('text_out')
#     )
#     server <- function(input, output, session) {
#         output$text_out <- renderText({
#             input$slider_input
#         })
#     }
#     runApp(list(ui=ui, server=server))
# }
# 
# test() # datetimeInput works fine
# test(TRUE)