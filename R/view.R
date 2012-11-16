## AUTHOR: BRIAN M. BOT
#####

setMethod(
  f = "view",
  signature = signature("githubRepo", "missing"),
  definition = function(repository, repositoryPath){
    
    constructedURL <- .constructWebURL(repository)
    .doView(constructedURL)
  }
)

setMethod(
  f = "view",
  signature = signature("githubRepo", "character"),
  definition = function(repository, repositoryPath){
    
    if( !any(repository@tree$path == repositoryPath) ){
      stop(sprintf("repositoryPath %s does not match any paths within the repository tree", repositoryPath))
    }
    
    constructedURL <- .constructWebURL(repository, repositoryPath=repositoryPath)
    .doView(constructedURL)
  }
)


.doView <- function(url){
  tryCatch(
    utils::browseURL(url),
    error = function(e){
      warning("Unable to launch the web browser. Paste this url into your web browser: %s", url)
      warning(e)
    }
  )
  invisible(url)
}
