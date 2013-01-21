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
    validArgs <- c("ref", "refName")
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
        constructedURL <- .constructRepoRefURL(myRepo, "heads")
        ## GET THE COMMIT
        cat(paste("status: getting commit information about: ", constructedURL, "\n", sep=""))
        commitList <- .getGithubJSON(constructedURL)
        myRepo@commit <- commitList$object["sha"]
      } else{
        if( myRepo@ref == "tag" ){
          constructedURL <- .constructRepoRefURL(myRepo, "tags")
          ## GET THE COMMIT
          cat(paste("status: getting commit information about: ", constructedURL, "\n", sep=""))
          refList <- .getGithubJSON(constructedURL)
          if( refList$object["type"] == "commit" ){
            myRepo@commit <- refList$object["sha"]
          } else{
            commitList <- .getGithubJSON(refList$object[["url"]])
            myRepo@commit <- commitList$object["sha"]
          }
        }
      }
    }
    myRepo <- .getCommitTree(myRepo)
    
    return(myRepo)
  }
)

