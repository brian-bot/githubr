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
    
    ## GET GENERAL REPO INFO
    myRepo@apiResponses$repo <- .getGithubJSON(.constructRepoURL(myRepo))
    
    ## DEPENDING ON ref, DISPATCH TO GET COMMIT DIFFERENT WAYS
    if( myRepo@ref == "commit" ){
      myRepo@commit <- myRepo@refName
    } else{
      if( myRepo@ref == "branch" ){
        constructedURL <- .constructRepoRefURL(myRepo, "heads")
        ## GET THE COMMIT
        cat(paste("status: getting commit information about: ", constructedURL, "\n", sep=""))
        myRepo@apiResponses$ref <- .getGithubJSON(constructedURL)
        myRepo@commit <- myRepo@apiResponses$ref$object["sha"]
      } else{
        if( myRepo@ref == "tag" ){
          constructedURL <- .constructRepoRefURL(myRepo, "tags")
          ## GET THE COMMIT
          cat(paste("status: getting commit information about: ", constructedURL, "\n", sep=""))
          myRepo@apiResponses$ref <- .getGithubJSON(constructedURL)
          if( myRepo@apiResponses$ref$object["type"] != "commit" ){
            myRepo@apiResponses$ref <- .getGithubJSON(myRepo@apiResponses$ref$object[["url"]])
          }
          myRepo@commit <- myRepo@apiResponses$ref$object["sha"]
        }
      }
    }
    myRepo <- .getCommitTree(myRepo)
    
    return(myRepo)
  }
)

