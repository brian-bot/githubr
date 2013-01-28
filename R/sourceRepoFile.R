## AUTHOR: BRIAN M. BOT
#####

setMethod(
  f = "sourceRepoFile",
  signature = c("character", "character"),
  definition = function(repository, repositoryPath, ...){
    argList <- list(...)
    
    ## SPECIFY VALIDITY OF ARGUMENTS PASSED
    validArgs <- c("ref", "refName")
    getRepoArgs <- list()
    getRepoArgs[["repository"]] <- repository
    for( x in validArgs ){
      if( x %in% names(argList) ){
        getRepoArgs[[x]] <-  argList[[x]]
        argList[[x]] <- NULL
      }
    }
    
    myRepo <- do.call(getRepo, getRepoArgs)
    sourceArgs <- c(argList, list(repository=myRepo, repositoryPath=repositoryPath))
    return(do.call(sourceRepoFile, sourceArgs))
  }
)


setMethod(
  f = "sourceRepoFile",
  signature = c("githubRepo", "character"),
  definition = function(repository, repositoryPath, ...){
    
    ## MAKE SURE repositoryPath EXISTS
    if( !all(repositoryPath %in% repository@tree$path) ){
      stop("repositoryPath does not exists within this repository - cannot source")
    }
    
    ## GRAB THE sha VALUES FROM THESE PATHS AND BUILD URLS FOR THEIR BLOBS
    theseShas <- repository@tree$sha[match(repositoryPath, repository@tree$path)]
    constructedURLs <- .constructBlobURL(repository, theseShas)
    
    for( url in constructedURLs ){
      rawHeader <- .getGithubCache("httpheader")
      rawHeader["Accept"] <- "application/vnd.github.raw"
      txt <- getURL(url, httpheader=rawHeader, .opts=.getGithubCache("opts"))
      source(file=textConnection(txt), ...)
    }
    
  }
)

