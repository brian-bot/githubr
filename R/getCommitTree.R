## AUTHOR: BRIAN M. BOT
#####

.getCommitTree <- function(myRepo){
  
  ## GET THE TREE INFORMATION
  cat(paste("status: getting meta information about commit: ", myRepo@commit, "\n", sep=""))
  constructedURL <- .constructCommitURL(myRepo)
  commitTreeList <- .getGitURLjson(constructedURL)
  ## GET THE TREE
  cat("status: getting information about the commit tree\n")
  treeList <- .getGitURLjson(paste(commitTreeList$tree["url"], "?recursive=1", sep=""))
  
  thisTree <- data.frame(type  = sapply(treeList$tree, function(x){x[["type"]]}),
                         path = sapply(treeList$tree, function(x){x[["path"]]}),
                         sha  = sapply(treeList$tree, function(x){x[["sha"]]}),
                         stringsAsFactors=FALSE)
  thisTree <- thisTree[thisTree$type != "tree", ]
  thisTree$type <- NULL
  rownames(thisTree) <- 1:nrow(thisTree)
  
  myRepo@tree <- thisTree
  
  return(myRepo)
}


