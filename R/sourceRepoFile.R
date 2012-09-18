## AUTHOR: BRIAN M. BOT
#####


setMethod(
  f = "sourceRepoFile",
  signature = c("githubRepo", "character"),
  definition = function(repository, repositoryPath){
    
#     if( length(repositoryPath) > 1L ){
#       return(mapply(sourceRepoFile, repository, repositoryPath))
#     }
    ## ANYTHING THAT MAKES IT TO THIS POINT WILL ONLY HAVE ONE VALUE FOR repositoryPath
    
    ## MAKE SURE repositoryPath EXISTS
    if( !all(repositoryPath %in% repository@tree$path) ){
      stop("repositoryPath does not exists within this repository - cannot source")
    }
    
    ## GRAB THE sha VALUES FROM THESE PATHS AND BUILD URLS FOR THEIR BLOBS
    theseShas <- repository@tree$sha[match(repositoryPath, repository@tree$path)]
    builtUrl <- paste("https://api.github.com/repos", repository@user, repository@repo, "git/blobs", theseShas, sep="/")
    e <- new.env()
    invisible(mapply(builtUrl, FUN=function(url){
      eval(parse(text=getURL(url, .opts=.getCache("curlOptsGithubRaw"))), envir=e)
    }))
    return(e)
  }
)

