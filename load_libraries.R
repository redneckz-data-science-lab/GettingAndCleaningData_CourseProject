LoadLibraries <- function(...) {
    #
    # Installs/updates and loads listed libraries
    #
    # Args:
    #   ...: character vector of libraries to install/update and load
    # 
    # Returns: nothing
    #
    libs <- list(...)
    libs.currently.installed <- installed.packages()[, "Package"]
    libs.to.update <- libs[libs %in% libs.currently.installed]
    if (length(libs.to.update) > 0) {
        update.packages(libs.to.update)
    }
    libs.to.install <- libs[!(libs %in% libs.currently.installed)]
    if (length(libs.to.install) > 0) {
        install.packages(libs.to.install)
    }
    for (lib in libs) {
        library(lib, character.only = T)
    }
}
