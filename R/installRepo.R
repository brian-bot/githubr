## AUTHOR: BRIAN M. BOT
#####


setMethod(
  f = "installRepo",
  signature = c("character"),
  definition = function(repository, ...){
    argList <- list(...)
    if(any(names(argList) == "localPath")){
      localPath <- argList[["localPath"]]
      return(installRepo(downloadRepo(getRepo(repository, ...), localPath=localPath)))
    } else{
      return(installRepo(downloadRepo(getRepo(repository, ...))))
    }
  }
)

setMethod(
  f = "installRepo",
  signature = c("githubRepo"),
  definition = function(repository){
    cat(paste("status: installing repo from ", repository@localPath, "\n", sep=""))
    install(repository@localPath)
    return(repository)
  }
)


