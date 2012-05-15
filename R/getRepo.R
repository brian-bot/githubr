## GENERIC CLASS DEFINITIONS
##
## AUTHOR: BRIAN M. BOT
#####

setMethod(
  f = "getRepo",
  signature = c("character", "missing", "missing"),
  definition = function(uri, owner, repo){
    uriSplit <- strsplit(uri, "/")[[1]]
    if( uriSplit[2] != "repos" ){
      stop("uri must be of the form: /repos/:owner/:repo")
    }
    if( length(uriSplit) != 4 ){
      stop("uri must be of the form: /repos/:owner/:repo")
    }
    
    ## PUT TOGETHER THE PIECES
    owner <- uriSplit[3]
    repo <- uriSplit[4]
    
    ## KICK OUT WORK NOW THAT COMPLETE
    .builtRepo(uri, owner, repo)
  }
)

setMethod(
  f = "getRepo",
  signature = c("missing", "character", "character"),
  definition = function(uri, owner, repo){
    uri <- paste("/repos", owner, "/", repo, sep="")
    
    ## KICK OUT WORK NOW THAT COMPLETE
    .builtRepo(uri, owner, repo)
  }
)

setMethod(
  f = ".builtRepo",
  signature = c("character", "character", "character"),
  definition = function(uri, owner, repo){
    getThis <- getURL(paste("https://api.github.com", uri, sep=""))
    repoList <- fromJSON(getThis)
  }
)
