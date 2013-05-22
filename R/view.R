## AUTHOR: BRIAN M. BOT
#####

view <- function(repository, repositoryPath, ...){
  
  ## CHECK FOR BROWSER
  args <- list(...)
  if( any(names(args) == "browser") ){
    b <- args[["browser"]]
    args[["browser"]] <- NULL
  }
  args[["repository"]] <- repository
  args[["type"]] <- "html"
  
  ## CALL TO CREATE PERMLINK
  if( missing(repositoryPath) ){
    htmlPermlink <- do.call(getPermlink, args)
  } else{
    args[["repositoryPath"]] <- repositoryPath
    htmlPermlink <- do.call(getPermlink, args)
  }
  
  ## IF BROWSER ARG IS PASSED - PASS ON TO browseURL
  if( exists("b") ){
    tryCatch(utils::browseURL(htmlPermlink, browser=b), error = function(e){
      warning("Unable to launch the web browser. Paste this url into your web browser: %s", htmlPermlink)
      warning(e)
    })
  } else{
    tryCatch(utils::browseURL(htmlPermlink), error = function(e){
      warning("Unable to launch the web browser. Paste this url into your web browser: %s", htmlPermlink)
      warning(e)
    })
  }
  
  return(invisible(htmlPermlink))
}
