## AUTHOR: BRIAN M. BOT
#####

setMethod(
  f = ".getRepoRefInfo",
  signature = c("list", "character", "character"),
  definition = function(repo, refType, refName){
    
    ## GET THE REFERENCE
    getRefInfo <- getURL(paste(repo$url, "/git/refs/", refType, "/", refName, sep=""))
    refInfoList <- fromJSON(getRefInfo)
    ## IF A TAG, THEN NEED TO TAKE ONE MORE STEP
    if(refType == "tags"){
      getRefInfo2 <- getURL(refInfoList$object[["url"]])
      refInfoList <- fromJSON(getRefInfo2)
    }
    
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


