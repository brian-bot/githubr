## AUTHOR: BRIAN M. BOT
#####

setMethod(
  f = "mirrorRepo",
  signature = c("character", "character"),
  definition = function(owner, repo, ...){
    argList <- list(...)
    
    ## CREATE A DEFAULT githubRepo CLASS TO POPULATE
    myDir <- tempfile()
    dir.create(myDir)
    myRepo <- new("githubRepo", owner=owner, repo=repo, localPath=myDir)
    
    ## SPECIFY VALIDITY OF ARGUMENTS PASSED
    validArgs <- c("refType", "refName", "commit", "outputPath")
    
    if(any(!(names(argList) %in% validArgs)))
      stop(sprintf("Valid optional arguments are: %s", paste(validArgs, collapse=", ")))
    
    for(i in validArgs){
      if(any(names(argList) == i)){
        slot(myRepo, i) <- argList[[i]]
      }
    }
    
    myRepo <- .getCommit(myRepo)
    myRepo <- .getCommitTree(myRepo)
    cat("status: mirrorRepo done!\n")
    
    return(myRepo)
  }
)



