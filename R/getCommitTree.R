## AUTHOR: BRIAN M. BOT
#####

setMethod(
  f = ".getCommitTree",
  signature = c("githubRepo"),
  definition = function(myRepo){
    
    ## GET THE TREE INFORMATION
    cat(paste("status: getting meta information about commit: ", myRepo@commit, "\n", sep=""))
    constructedURL <- paste("https://api.github.com/repos/", myRepo@user, "/", myRepo@repo, "/git/commits/", myRepo@commit, sep="")
    commitTreeList <- .getURLjson(constructedURL)
    ## GET THE TREE
    cat("status: getting information about the commit tree\n")
    treeList <- .getURLjson(paste(commitTreeList$tree["url"], "?recursive=1", sep=""))
    
    ## COLLECT INFORMATION ABOUT THE COMMIT TREE FOR STORING WITHIN githubRepo CLASS
    theseFiles <- unlist(sapply(treeList$tree, function(x){if(x[["type"]] != "tree") x[["path"]]}))
    theseFiles <- theseFiles[!is.null(theseFiles)]
    theseShas <- unlist(sapply(treeList$tree, function(x){if(x[["type"]] != "tree") x[["sha"]]}))
    theseShas <- theseShas[!is.null(theseShas)]
    myRepo@tree <- list(treeFiles=theseFiles, treeShas=theseShas)
    
    return(myRepo)
  }
)

