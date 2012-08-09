## AUTHOR: BRIAN M. BOT
#####

setMethod(
  f = ".getCommitTree",
  signature = c("githubRepo"),
  definition = function(myRepo){
    
    ## GET THE TREE INFORMATION
    cat(paste("status: getting meta information about commit: ", myRepo@commit, "\n", sep=""))
    constructedURL <- paste("https://api.github.com/repos/", myRepo@owner, "/", myRepo@repo, "/git/commits/", myRepo@commit, sep="")
    commitTreeList <- .getGitURL(constructedURL)
    ## GET THE TREE
    cat("status: getting meta information about the commit tree\n")
    treeList <- .getGitURL(paste(commitTreeList$tree["url"], "?recursive=1", sep=""))
    
    cat("status: getting the file tree\n")
    theseFiles <- lapply(treeList$tree, function(x){
      if( x[["type"]] == "tree" ){
        if( !file.exists(file.path(myRepo@localPath, x[["path"]])) ){
          dir.create(file.path(myRepo@localPath, x[["path"]]), recursive=T)
        }
        return(NULL)
      } else{
        tmpText <- getURL(x[["url"]], httpheader = c(Accept="application/vnd.github.raw"))
        cat(tmpText, file=file.path(myRepo@localPath, x[["path"]]))
        return(x[["path"]])
      }
    })
    theseFiles <- unlist(theseFiles)[!sapply(theseFiles, is.null)]
    theseUrls <- sapply(treeList$tree, function(x){if(x[["type"]] != "tree") x[["url"]]})
    theseUrls <- theseUrls[!is.null(theseUrls)]
    myRepo@tree <- list(treeFiles=theseFiles, treeUrls=theseUrls)
    
    return(myRepo)
  }
)

