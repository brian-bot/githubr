## AUTHOR: BRIAN M. BOT
#####

setMethod(
  f = "downloadRepoBlob",
  signature = c("character", "ANY"),
  definition = function(repository, repositoryPath, ...){
    argList <- list(...)
    
    if( any(names(argList) == "localPath") ){
      return(downloadRepoBlob(getRepo(repository, ...), repositoryPath, localPath=argList[["localPath"]]))
    } else{
      return(downloadRepoBlob(getRepo(repository, ...), repositoryPath))
    }
    
  }
)

setMethod(
  f = "downloadRepoBlob",
  signature = c("githubRepo", "missing"),
  definition = function(repository, repositoryPath, ...){
    ## IF NO repositoryPath IS PASSED, DOWNLOAD ALL FILE PATHS IN THE REPOSITORY
    return(downloadRepoBlob(repository, repository@tree$path, ...))
  }
)

setMethod(
  f = "downloadRepoBlob",
  signature = c("githubRepo", "character"),
  definition = function(repository, repositoryPath, ...){
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
    
    if( any(!(repositoryPath %in% repository@tree$path)) ){
      stop("at least one repositoryPath is not available in passed repository")
    }
    
    ## INDEX SPECIFYING WHICH FILES / BLOBS ARE TO BE DOWNLOADED
    idx <- which(repository@tree$path %in% repositoryPath)
    allUrls <- paste("https://api.github.com/repos", repository@user, repository@repo, "git/blobs", repository@tree$sha[idx], sep="/")
    fullFiles <- file.path(repository@localPath, repository@tree$path[idx])
    
    ## CREATE DIRECTORIES IF NECESSARY
    basedirs <- unique(dirname(fullFiles))
    createDirs <- basedirs[!file.exists(basedirs)]
    if( length(createDirs) > 0L ){
      createDirs <- mapply(dir.create, createDirs, MoreArgs=list(recursive=T))
    }
    
    ## SEE IF DOWNLOAD STATUS IS AVAILABLE FOR THIS REPO YET
    if( !any(colnames(repository@tree) == "downloadedLocally") ){
      repository@tree$downloadedLocally <- FALSE
    }
    ## DOWNLOAD FILE(S)
    repository@tree$downloadedLocally[idx] <- mapply(.downloadURLtoFile, allUrls, fullFiles)
    
    return(repository)
  }
)


## TAKE A URL - DOWNLOAD TO A LOCAL DESTINATION
.downloadURLtoFile <- function(url, destFile){
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
  if(!file.copy(tmpFile, destFile, overwrite = TRUE)){
    file.remove(tmpFile)
    stop("COULD NOT COPY: ", tmpFile, " TO: ", destFile)
  }
  file.remove(tmpFile)
  return(TRUE)
}


