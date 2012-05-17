## AUTHOR: BRIAN M. BOT
#####

setMethod(
  f = ".getRepoRefTree",
  signature = c("list"),
  definition = function(refTree){
    
    ## GET THE TREE
    getTree <- getURL(paste(refTree$tree["url"], "?recursive=1", sep=""))
    treeList <- fromJSON(getTree)
    
    return(treeList)
  }
)

