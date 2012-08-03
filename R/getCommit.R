## AUTHOR: BRIAN M. BOT
#####

setMethod(
  f = ".getCommit",
  signature = c("character", "character", "character"),
  definition = function(uri, refType, refName){
    
    ## GET THE REFERENCE
    refList <- .getGitURL(paste("https://api.github.com", uri, "/git/refs/", refType, "/", refName, sep=""))
    if(refType=="tags"){
      commitList <- .getGitURL(refList$object[["url"]])
    } else{
      commitList <- refList
    }
    
    return(commitList$object)
  }
)
