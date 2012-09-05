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
    fullFiles <- file.path(myRepo@localPath, myRepo@tree$path)
    basedirs <- unique(dirname(fullFiles))
    createDirs <- basedirs[!file.exists(basedirs)]
    createDirs <- mapply(dir.create, createDirs, MoreArgs=list(recursive=T))
    
    ## DOWNLOAD FILES
    getThese <- mapply(.downloadURLtoFile, allUrls, fullFiles)
    
    return(myRepo)
  }
)

.downloadURLtoFile <- function(url, file){
  tmpFile <- tempfile()
  tryCatch(
    .curlWriterDownload(url=url, destfile=tmpFile, opts = .getCache("curlOpts"), curlHandle = getCurlHandle()),
    error = function(ex){
      file.remove(tmpFile)
      stop(ex)
    }
  )
  
  ## copy then delete. this avoids a cross-device error encountered
  ## on systems with multiple hard drives when using file.rename
  if(!file.copy(tmpFile, file, overwrite = TRUE)){
    file.remove(tmpFile)
    stop("COULD NOT COPY: ", tmpFile, " TO: ", file)
  }
  file.remove(tmpFile)
}
