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
    myRepo@apiResponses$repo <- githubRestGET(.constructRepoURI(myRepo))
    
    ## DEPENDING ON ref, DISPATCH TO GET COMMIT DIFFERENT WAYS
    if( myRepo@ref == "commit" ){
      myRepo@commit <- myRepo@refName
      commitURI <- .constructCommitURI(myRepo)
    } else{
      allRefs <- githubRestGET(sub("{/sha}", "", myRepo@apiResponses$repo$git_refs_url, fixed=T))
      if( myRepo@ref == "tag" ){
        myRef <- paste("refs/tags", myRepo@refName, sep="/")
      } else if( myRepo@ref == "branch" ){
        myRef <- paste("refs/heads", myRepo@refName, sep="/")
      }
      ns <- sapply(allRefs, function(x){x$ref})
      idn <- which(ns == myRef)
      if( length(idn) == 0 ){
        stop("This is not a valid reference for this repository")
      }
      cs <- sapply(allRefs, function(x){x$object['sha']})
      myRepo@commit <- cs[idn]
      urls <- sapply(allRefs, function(x){x$object['url']})
      commitURI <- urls[idn]
      cat(paste("status: getting commit information about: ", commitURI, "\n", sep=""))
      myRepo@apiResponses$commit <- githubRestGET(commitURI)
      
    }
    myRepo@apiResponses$commit <- githubRestGET(commitURI)
    
    myRepo <- .getCommitTree(myRepo)
    
    return(myRepo)
  }
)

