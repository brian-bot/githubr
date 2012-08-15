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
      stop(paste("repository ", repository, " must contain an user and a repo name (e.g. /user/repoName)\n", sep=""))
    }
    
    myRepo <- new("githubRepo", user=repoSplit[1], repo=repoSplit[2])
    
    ## SPECIFY VALIDITY OF ARGUMENTS PASSED
    ## IGNORE outputPath IF PASSED TO THIS FUNCTION -- BUT DO NOT THROW ERROR (LEAVE IN validArgs)
    validArgs <- c("type", "typeName", "outputPath")
    validTypes <- c("tag", "branch", "commit")
    
    if( any(!(names(argList) %in% validArgs)) )
      stop(sprintf("Valid optional arguments are: %s", paste(validArgs, collapse=", ")))
    
    ## CHECK type AND typeName
    if( any(names(argList) == "typeName") & (!any(names(argList) == "type")) )
      stop("must specify type along with typeName")
    if( (!any(names(argList) == "typeName")) & any(names(argList) == "type") )
      stop("must specify typeName along with type")
    if( (!any(names(argList) == "typeName")) & (!any(names(argList) == "type")) ){
      argList[["type"]] <- "branch"
      argList[["typeName"]] <- "master"
    }
    
    ## CHECK IF type IS VALID
    if( !any(argList[["type"]] == validTypes) )
      stop(sprintf("Valid types are: %s", paste(validTypes, collapse=", ")))
    
    ## IGNORE outputPath IF PASSED TO THIS FUNCTION -- BUT DO NOT THROW ERROR (LEAVE IN validArgs)
#     ## CHECK IF outputPath HAS BEEN PASSED
#     if( any(names(argList) == "outputPath") )
#       myRepo@output <- argList[["outputPath"]]
    
    ## DEPENDING ON type, DISPATCH GET TO COMMIT DIFFERENT WAYS
    if( argList[["type"]] == "commit" ){
      myRepo@commit <- argList[["typeName"]]
    } else{
      if( argList[["type"]] == "branch" ){
        constructedURI <- paste("/", myRepo@user, "/", myRepo@repo, "/git/refs/heads/", argList[["typeName"]], sep="")
        ## GET THE COMMIT
        cat(paste("status: getting commit information about: ", constructedURI, "\n", sep=""))
        commitList <- .getGitURL(paste("https://api.github.com/repos", constructedURI, sep=""))
        myRepo@commit <- commitList$object["sha"]
      } else{
        if( argList[["type"]] == "tag" ){
          constructedURI <- paste("/", myRepo@user, "/", myRepo@repo, "/git/refs/tags/", argList[["typeName"]], sep="")
          ## GET THE COMMIT
          cat(paste("status: getting commit information about: ", constructedURI, "\n", sep=""))
          refList <- .getGitURL(paste("https://api.github.com/repos", constructedURI, sep=""))
          commitList <- .getGitURL(refList$object[["url"]])
          myRepo@commit <- commitList$object["sha"]
        }
      }
    }
    myRepo <- .getCommitTree(myRepo)
    
    return(myRepo)
  }
)



