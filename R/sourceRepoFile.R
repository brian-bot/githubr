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
    
    ## SEND ON ... ARGS (NOT USED FOR REPOSITORY CONSTRUCTION) TO base::source()
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
    constructedURIs <- .constructBlobURL(repository, theseShas)
    
    for( uri in constructedURIs ){
      rawHeader <- .getGithubCache("httpheader")
      rawHeader["Accept"] <- "application/vnd.github.raw"
      if(substr(uri, 1, 1) == "/"){
        uri <- substr(uri, 2, nchar(uri))
      }
      txt <- getURL(paste(.getGithubCache("githubEndpoint"), uri, sep=""), .opts = .getGithubCache("opts"), httpheader=rawHeader)
      source(file=textConnection(txt), ...)
    }
    
  }
)

