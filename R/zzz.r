.onLoad <- function(libname, pkgname) {
    require(shiny)
    addResourcePath('roow', system.file('www', package='roow'))
}

.onAttach <- function(libname, pkgname) {
    require(shiny)
}
