## AUTHOR: BRIAN M. BOT
#####

setMethod(
  f = "view",
  signature = signature("ANY", "ANY"),
  definition = function(repository, repositoryPath, ...){
    
    if( missing(repositoryPath) ){
      htmlPermlink <- getPermlink(repository, type = "html", ...)
    } else{
      htmlPermlink <- getPermlink(repository, repositoryPath, type = "html", ...)
    }
    tryCatch(utils::browseURL(htmlPermlink), error = function(e){
      warning("Unable to launch the web browser. Paste this url into your web browser: %s", htmlPermlink)
      warning(e)
    })
    return(invisible(htmlPermlink))
  }
)
