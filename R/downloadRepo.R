## AUTHOR: BRIAN M. BOT
#####


setMethod(
  f = "downloadRepo",
  signature = c("character"),
  definition = function(repository, ...){
    argList <- list(...)
    
    if(any(names(argList) == "localPath")){
      return(downloadRepo(getRepo(repository, ...), localPath=argList[["localPath"]]))
    } else{
      return(downloadRepo(getRepo(repository, ...)))
    }
    
  }
)

setMethod(
  f = "downloadRepo",
  signature = c("githubRepo"),
  definition = function(repository, ...){
    argList <- list(...)
    
    ## SPECIFY VALIDITY OF ARGUMENTS PASSED
    if( any(names(argList) != "localPath") ){
      stop("invalid optional argument\n")
    }
    if( any(names(argList) == "localPath") ){
      repository@localPath <- path.expand(argList[["localPath"]])
    }
    if( repository@localPath == "NA" ){
      tmpDir <- tempfile(pattern="dir")
      dir.create(tmpDir)
      repository@localPath <- tmpDir
    }
    
    cat(paste("status: downloading file tree to ", repository@localPath, "\n", sep=""))
    repository <- downloadRepoBlob(repository)
    
    return(repository)
  }
)

