## AUTHOR: BRIAN M. BOT
#####

setMethod(
  f = "sourceRepoFile",
  signature = c("character", "character"),
  definition = function(repository, repositoryPath, ...){
    return(sourceRepoFile(getRepo(repository, ...), repositoryPath))
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
    constructedURLs <- paste("https://api.github.com/repos", repository@user, repository@repo, "git/blobs", theseShas, sep="/")
    e <- new.env()
    invisible(mapply(constructedURLs, FUN=function(url){
      eval(parse(text=getURL(url, .opts=.getCache("curlOptsGithubRaw"))), envir=e)
    }))
    return(e)
  }
)

