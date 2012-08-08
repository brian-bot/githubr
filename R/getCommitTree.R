## AUTHOR: BRIAN M. BOT
#####

setMethod(
  f = ".getCommitTree",
  signature = c("character"),
  definition = function(commit){
    
    ## GET THE TREE INFORMATION
    cat(paste("status: getting meta information about commit: ", commit[["sha"]], "\n", sep=""))
    commitTreeList <- .getGitURL(commit["url"])
    ## GET THE TREE
    cat("status: getting meta information about the commit tree\n")
    treeList <- .getGitURL(paste(commitTreeList$tree["url"], "?recursive=1", sep=""))
    
    return(treeList)
  }
)

