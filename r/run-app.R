library(plumber)

app <- plumber::plumb("r/endpoints.R")

args <- commandArgs(trailingOnly = TRUE)

# Work out if we've been asked to listen on a specific port or not.
if (length(args) > 1) {
  stop("Too many arguments supplied - expected 1, found ", length(args))
} else if (length(args) == 1) {
  port <- as.numeric(commandArgs(trailingOnly = TRUE)[[1]])
  if (!is.na(port) & port <= 65535) {
    app$run(port = port)
  } else {
    stop("Port ", port, " is not valid")
  }
} else {
  app$run()
}

