## AUTHOR: BRIAN M. BOT
#####

setMethod(
  f = ".getRepoRefTreeInfo",
  signature = c("list"),
  definition = function(refInfoList){
    
    ## GET THE TREE INFORMATION
    getRef <- getURL(refInfoList$object["url"])
    refTreeList <- fromJSON(getRef)
    
    return(refTreeList)
  }
)

