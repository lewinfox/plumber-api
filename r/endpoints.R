#' Log incoming requests
#' @filter logger
function(req) {
  cat(as.character(Sys.time()), "-",
      req$REQUEST_METHOD, req$PATH_INFO, "-",
      req$HTTP_USER_AGENT, "@", req$REMOTE_ADDR, "\n")
  plumber::forward()
}

#' Default message for "/"
#' @get /
function() {
  "Nothing to see here..."
}

#' Add one to numeric payloads
#' @get /add-one/<id:numeric>
function(id) {
  list(
    result = id + 1
  )
}


#' Echo the parameter back to the caller
#' @param message
#' @get /echo
function(message = NULL) {
  list(
    message = message
    )
}
