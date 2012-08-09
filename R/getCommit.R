## AUTHOR: BRIAN M. BOT
#####

setMethod(
  f = ".getCommit",
  signature = c("githubRepo"),
  definition = function(myRepo){
    
    constructedURI <- paste("/", myRepo@owner, "/", myRepo@repo, "/git/refs/", myRepo@refType, "/", myRepo@refName, sep="")
    ## GET THE REFERENCE
    cat(paste("status: getting meta information about: ", constructedURI, "\n", sep=""))
    refList <- .getGitURL(paste("https://api.github.com/repos", constructedURI, sep=""))
    if(myRepo@refType=="tags"){
      commitList <- .getGitURL(refList$object[["url"]])
    } else{
      commitList <- refList
    }
    myRepo@commit <- c(commitList$object["sha"])
    return(myRepo)
  }
)
