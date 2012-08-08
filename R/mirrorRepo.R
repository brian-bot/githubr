## AUTHOR: BRIAN M. BOT
#####

setMethod(
  f = "mirrorRepo",
  signature = c("character", "character"),
  definition = function(owner, repo, ...){
    argList <- list(...)
    
    ## SPECIFY VALIDITY OF ARGUMENTS PASSED
    validArgs <- c("refType", "refName", "outputPath")
    myDir <- tempfile()
    dir.create(myDir)
    defaultArgs <- c("heads", "master", myDir)
    
    if(any(!(names(argList) %in% validArgs)))
      stop(sprintf("Valid optional arguments are: %s", paste(validArgs, collapse=", ")))
    
    for(i in 1:length(validArgs)){
      if(validArgs[i] %in% names(argList)){
        assign(validArgs[i], argList[[validArgs[i]]])
      } else{
        assign(validArgs[i], defaultArgs[i])
      }
    }
    
    uri <- paste("/repos/", owner, "/", repo, sep="")
    
    commit <- .getCommit(uri, refType, refName)
    commitTree <- .getCommitTree(commit)
    commitFiles <- .getCommitFiles(commitTree, outputPath)
    cat("status: mirrorRepo done!\n")
    
#     ## STEP THROUGH DETERMINING FILES IN REPO TREE
#     repoInfo <- .getRepoInfo(uri)
#     repoRefInfo <- .getRepoRefInfo(repo=repoInfo, refType=refType, refName=refName)
#     repoRefTreeInfo <- .getRepoRefTreeInfo(repoRefInfo)
#     repoRefTree <- .getRepoRefTree(repoRefTreeInfo)
#     repoRefFiles <- .getRepoRefFiles(repoRefTree, outputPath=outputPath)
    
    return(commitFiles)
  }
)



