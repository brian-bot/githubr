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
    allUrls <- paste("https://api.github.com/repos", myRepo@user, myRepo@repo, "git/blobs", myRepo@tree$sha, sep="/")
    
    ## DOWNLOAD FILES ONE AT A TIME
    for(i in 1:length(allUrls)){
      fullFile <- file.path(myRepo@localPath, myRepo@tree$path[i])
      basedir <- dirname(fullFile)
      if( !file.exists(basedir) ){
        dir.create(basedir, recursive=TRUE)
      }
      
      tmpFile <- tempfile()
      tryCatch(
        .curlWriterDownload(url=allUrls[i], destfile=tmpFile, opts = .getCache("curlOpts"), curlHandle = getCurlHandle()),
        error = function(ex){
          file.remove(tmpFile)
          stop(ex)
        }
      )
      
      ## copy then delete. this avoids a cross-device error encountered
      ## on systems with multiple hard drives when using file.rename
      if(!file.copy(tmpFile, fullFile, overwrite = TRUE)){
        file.remove(tmpFile)
        stop("COULD NOT COPY: ", tmpFile, " TO: ", destfile)
      }
      file.remove(tmpFile)
    }
    
    return(myRepo)
  }
)


