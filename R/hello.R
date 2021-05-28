# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

hello <- function() {
  print("Hello, world!")
}
Clinton<-function(){
  print("Hello Clinton!!")
}

#' Find path seperator
#'
#' @return Path seperator. For windowsm this is ";". For all other systems, it is ";":
get_path_sep <- function() {
  # TODO Add memorization here
  sysinf <- Sys.info()
  path_sep <- ":"
  if (!is.null(sysinf) && sysinf['sysname'] == "Windows"){
    path_sep <- ";"
  }
  path_sep
}

#' Find file on environment path
#'
#' @description
#' Find the path of a file(if it exists) using an environment path defined on an environment variable. The working directory
#' is searched first.
#'
#' @param filename Filename to find using environment var
#' @param environment_var Environment var to search. Defaults to PATH
#' @param stop_if_not_found If true, an "error" will occur with a stop when a file is not found. Defaults to False.
#'
#' @return Path of the file. Possibly returns NULL when stop_if_not_found is FALSE and the file is not found
#' @note Possible of a stopping error when stop_if_not_found is TRUE and the file is not found
find_file_on_env_path <- function(filename, environment_var = "PATH", stop_if_not_found = FALSE) {
  # Get our path seperator. This is OS based. On Windows, we split by ; and : on most other platforms
  path_sep <- get_path_sep()
  # spit our environment var using our sep
  # We add the working directory and start there
  paths <- c(getwd(), unlist(strsplit(Sys.getenv(environment_var), path_sep)[1]))
  # For each path on our environment vars, search for file
  for (path in paths) {
    fp <- file.path(path, filename)
    # If we found file, return
    if (file.exists(fp)) {
      return (fp)
    }
  }
  if (stop_if_not_found) {
    # We could not find the file! Error out
    stop(sprintf("Could not find file: %s", filename))
  } else {
    NULL
  }
}

#' Source file on environment path
#'
#' @description
#' Source a file(if it exists) using an environment path defined on an environment variable
#' If the file does not exist, an error will be thrown
#'
#' @param filename Filename to source using environment var
#' @param environment_var Environment var to use for search. Defaults to PATH
#'
#' @examples
#' source_file_on_env_path(file.path("R", "make_results_summary.R"))
#' source_file_on_env_path(file.path("example.R"))
source_file_on_env_path <- function(filename, environment_var = "PATH") {
  source(find_file_on_env_path(filename, environment_var, TRUE))
}