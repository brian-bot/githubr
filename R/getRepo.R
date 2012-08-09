## AUTHOR: BRIAN M. BOT
#####

setMethod(
  f = "getRepo",
  signature = c("character"),
  definition = function(repository, ...){
    argList <- list(...)
    
    repoSplit <- unlist(strsplit(repository, "/", fixed=T))
    repoSplit <- repoSplit[repoSplit != ""]
    if( length(repoSplit) != 2 ){
      stop(paste("repository ", repository, " must contain an owner and a repo name (e.g. /owner/repoName)\n", sep=""))
    }
    
    myRepo <- new("githubRepo", owner=repoSplit[1], repo=repoSplit[2])
    
    ## SPECIFY VALIDITY OF ARGUMENTS PASSED
    validArgs <- c("refType", "refName", "outputPath")
    
    if(any(!(names(argList) %in% validArgs)))
      stop(sprintf("Valid optional arguments are: %s", paste(validArgs, collapse=", ")))
    
    for(i in validArgs){
      if(any(names(argList) == i)){
        slot(myRepo, i) <- argList[[i]]
      }
    }
    
    myRepo <- .getCommit(myRepo)
    myRepo <- .getCommitTree(myRepo)
    
    return(myRepo)
  }
)



