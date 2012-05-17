## AUTHOR: BRIAN M. BOT
#####

setMethod(
  f = ".getRepoRefInfo",
  signature = c("list", "character", "character"),
  definition = function(repo, type, name){
    
    ## GET THE REFERENCE
    getRefInfo <- getURL(paste(repo$url, "/git/refs/", type, "s/", name, sep=""))
    refInfoList <- fromJSON(getRefInfo)
    
    return(refInfoList)
  }
)



setMethod(
  f = ".getRepoRefInfo",
  signature = c("list", "missing", "missing"),
  definition = function(repo, type, name){
    .getRepoRefInfo(repo, "head", "master")
  }
)

setMethod(
  f = ".getRepoRefInfo",
  signature = c("list", "character", "missing"),
  definition = function(repo, type, name){
    .getRepoRefInfo(repo, type, "master")
  }
)


