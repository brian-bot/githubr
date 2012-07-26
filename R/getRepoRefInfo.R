## AUTHOR: BRIAN M. BOT
#####

setMethod(
  f = ".getRepoRefInfo",
  signature = c("list", "character", "character"),
  definition = function(repo, refType, refName){
    
    ## GET THE REFERENCE
    getRefInfo <- getURL(paste(repo$url, "/git/refs/", refType, "/", refName, sep=""))
    refInfoList <- fromJSON(getRefInfo)
    
    return(refInfoList)
  }
)



# setMethod(
#   f = ".getRepoRefInfo",
#   signature = c("list", "missing", "missing"),
#   definition = function(repo, type, name){
#     .getRepoRefInfo(repo, "heads", "master")
#   }
# )
# 
# setMethod(
#   f = ".getRepoRefInfo",
#   signature = c("list", "character", "missing"),
#   definition = function(repo, type, name){
#     .getRepoRefInfo(repo, type, "master")
#   }
# )


