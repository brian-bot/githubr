## GET INFO ABOUT A GITHUB REPOSITORY
##
## AUTHOR: BRIAN M. BOT
#####

setMethod(
  f = ".getRepoInfo",
  signature = c("character"),
  definition = function(uri){
    getThis <- getURL(paste("https://api.github.com", uri, sep=""))
    repoInfoList <- fromJSON(getThis)
    
    return(repoInfoList)
  }
)
