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
    
    ## SPECIFY VALIDITY OF ARGUMENTS PASSED
    ## IGNORE localPath IF PASSED TO THIS FUNCTION -- BUT DO NOT THROW ERROR (LEAVE IN validArgs)
    validArgs <- c("ref", "refName", "localPath")
    if( any(!(names(argList) %in% validArgs)) ){
      stop(sprintf("Valid optional arguments are: %s", paste(validArgs, collapse=", ")))
    }
    
    ## CHECK ref AND refName -- BOTH (OR NEITHER) MUST BE SPECIFIED
    if( any(names(argList) == "refName") & (!any(names(argList) == "ref")) ){
      stop("must specify ref along with refName")
    }
    if( (!any(names(argList) == "refName")) & any(names(argList) == "ref") ){
      stop("must specify refName along with ref")
    }
    
    ## CREATE A NEW githubRepo OBJECT
    myRepo <- new("githubRepo", user=repoSplit[1], repo=repoSplit[2])
    if( (any(names(argList) == "refName")) & (any(names(argList) == "ref")) ){
      myRepo@ref <- argList[["ref"]]
      myRepo@refName <- argList[["refName"]]
    }
    
    ## DEPENDING ON ref, DISPATCH TO GET COMMIT DIFFERENT WAYS
    if( myRepo@ref == "commit" ){
      myRepo@commit <- myRepo@refName
    } else{
      if( myRepo@ref == "branch" ){
        constructedURI <- paste("/", myRepo@user, "/", myRepo@repo, "/git/refs/heads/", myRepo@refName, sep="")
        ## GET THE COMMIT
        cat(paste("status: getting commit information about: ", constructedURI, "\n", sep=""))
        commitList <- .getURLjson(paste("https://api.github.com/repos", constructedURI, sep=""))
        myRepo@commit <- commitList$object["sha"]
      } else{
        if( myRepo@ref == "tag" ){
          constructedURI <- paste("/", myRepo@user, "/", myRepo@repo, "/git/refs/tags/", myRepo@refName, sep="")
          ## GET THE COMMIT
          cat(paste("status: getting commit information about: ", constructedURI, "\n", sep=""))
          refList <- .getURLjson(paste("https://api.github.com/repos", constructedURI, sep=""))
          if( refList$object["type"] == "commit" ){
            myRepo@commit <- refList$object["sha"]
          } else{
            commitList <- .getURLjson(refList$object[["url"]])
            myRepo@commit <- commitList$object["sha"]
          }
        }
      }
    }
    myRepo <- .getCommitTree(myRepo)
    
    return(myRepo)
  }
)



