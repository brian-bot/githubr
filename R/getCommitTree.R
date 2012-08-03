## AUTHOR: BRIAN M. BOT
#####

setMethod(
  f = ".getCommitTree",
  signature = c("character"),
  definition = function(commit){
    
    ## GET THE TREE INFORMATION
    commitTreeList <- .getGitURL(commit["url"])
    ## GET THE TREE
    treeList <- .getGitURL(paste(commitTreeList$tree["url"], "?recursive=1", sep=""))
    
    return(treeList)
  }
)

