## AUTHOR: BRIAN M. BOT
#####

.getCommitTree <- function(myRepo){
  
  ## GET THE TREE INFORMATION
  cat(paste("status: getting meta information about commit: ", myRepo@commit, "\n", sep=""))
  constructedURI <- .constructCommitURI(myRepo)
  myRepo@apiResponses$commit <- githubRestGET(constructedURI)
  ## GET THE TREE
  cat("status: getting information about the commit tree\n")
  constructedTreeURI <- .constructCommitTreeURI(myRepo)
  myRepo@apiResponses$tree <- githubRestGET(constructedTreeURI)
  
  thisTree <- data.frame(type  = sapply(myRepo@apiResponses$tree$tree, function(x){x[["type"]]}),
                         path = sapply(myRepo@apiResponses$tree$tree, function(x){x[["path"]]}),
                         sha  = sapply(myRepo@apiResponses$tree$tree, function(x){x[["sha"]]}),
                         url = sapply(myRepo@apiResponses$tree$tree, function(x){x[["url"]]}),
                         stringsAsFactors=FALSE)
  thisTree <- thisTree[thisTree$type != "tree", ]
  thisTree$type <- NULL
  rownames(thisTree) <- 1:nrow(thisTree)
  
  myRepo@tree <- thisTree
  
  return(myRepo)
}


