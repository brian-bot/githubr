## AUTHOR: BRIAN M. BOT
#####


setMethod(
  f = "downloadRepo",
  signature = c("character"),
  definition = function(repository, ...){
    argList <- list(...)
    if(any(names(argList) == "localPath")){
      localPath <- argList[["localPath"]]
      return(downloadRepo(getRepo(repository, ...), localPath=localPath))
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
    
    myRepo <- repository
    
      ## SPECIFY VALIDITY OF ARGUMENTS PASSED
    if( any(names(argList) != "localPath") ){
      stop("invalid optional argument\n")
    }
    if( any(names(argList) == "localPath") ){
      myRepo@localPath <- path.expand(argList[["localPath"]])
    }
    if( myRepo@localPath == "NA" ){
      tmpDir <- tempfile(pattern="dir")
      dir.create(tmpDir)
      myRepo@localPath <- tmpDir
    }
    
    cat(paste("status: downloading file tree to ", myRepo@localPath, "\n", sep=""))
    urls <- paste("https://api.github.com/repos", myRepo@user, myRepo@repo, "git/blobs", myRepo@tree$sha, sep="/")
    for(i in 1:length(urls)){
      fullFile <- file.path(myRepo@localPath, myRepo@tree$file[i])
      basedir <- dirname(fullFile)
      if( !file.exists(basedir) ){
        dir.create(basedir, recursive=TRUE)
      }
      tmpText <- getURL(urls[i], httpheader = c(Accept="application/vnd.github.raw"))
      cat(tmpText, file=fullFile)
    }
    
    return(myRepo)
  }
)


