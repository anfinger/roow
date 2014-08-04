.onLoad <- function(libname, pkgname) {
    require(shiny)
    addResourcePath('roow', system.file('www', package='roow'))
    #addResourcePath('roow/images', system.file('www/images', package='roow'))
}

.onAttach <- function(libname, pkgname) {
    require(shiny)
}
