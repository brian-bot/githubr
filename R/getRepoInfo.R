## GET INFO ABOUT A GITHUB REPOSITORY
##
## AUTHOR: BRIAN M. BOT
#####

setMethod(
  f = ".getRepoInfo",
  signature = c("character", "missing", "missing"),
  definition = function(uri, owner, repo){
    .getRepoInfoWorker(uri)
  }
)

setMethod(
  f = ".getRepoInfo",
  signature = c("missing", "character", "character"),
  definition = function(uri, owner, repo){
    uri <- paste("/repos", owner, "/", repo, sep="")
    
    ## KICK OUT WORK NOW THAT COMPLETE
    .getRepoInfoWorker(uri)
  }
)


setMethod(
  f = ".getRepoInfoWorker",
  signature = c("character"),
  definition = function(uri){
    getThis <- getURL(paste("https://api.github.com", uri, sep=""))
    repoInfoList <- fromJSON(getThis)
    
    return(repoInfoList)
  }
)
