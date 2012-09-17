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
    
    argList <- list(...)
    
    ## SPECIFY VALIDITY OF ARGUMENTS PASSED
    if( any(names(argList) != "localPath") ){
      stop("invalid optional argument\n")
    }
    if( any(names(argList) == "localPath") ){
      repository@localPath <- path.expand(argList[["localPath"]])
    }
    if( is.na(repository@localPath) ){
      tmpDir <- tempfile(pattern="dir")
      dir.create(tmpDir)
      repository@localPath <- tmpDir
    }
    
    ## IF A BRANCH OR TAG, WE CAN DOWNLOAD THE ARCHIVE (MUCH FASTER)
    if( repository@ref %in% c("branch", "tag") ){
      repository@tree$downloadedLocally <- .downloadGithubArchiveToLocalPath(repository)
      return(repository)
    } else{
      return(downloadRepoBlob(repository, repository@tree$path, ...))
    }
    
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
    if( is.na(repository@localPath) ){
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
    
    ## DOWNLOAD FILE(S)
    repository@tree$downloadedLocally[idx] <- mapply(.downloadGithubBlobToFile, allUrls, fullFiles)
    
    return(repository)
  }
)


## TAKE A GITHUB BLOB URL - DOWNLOAD TO A LOCAL DESTINATION
.downloadGithubBlobToFile <- function(url, destFile){
  tmpFile <- tempfile()
  tryCatch(
    .curlWriterDownload(url=url, destfile=tmpFile, opts = .getCache("curlOptsGithubRaw"), curlHandle = getCurlHandle()),
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

## TAKE A GITHUB ARCHIVE URL - DOWNLOAD TO A LOCAL DESTINATION
.downloadGithubArchiveToLocalPath <- function(repository){
  archiveUrl <- paste("https://api.github.com/repos", repository@user, repository@repo, "tarball", repository@refName, sep="/")
  tmpFile <- tempfile(fileext=".tar")
  tryCatch(
    .curlWriterDownload(url=archiveUrl, destfile=tmpFile, opts = .getCache("curlOptsGithub"), curlHandle = getCurlHandle()),
    error = function(ex){
      file.remove(tmpFile)
      stop(ex)
    }
  )
#  unlink(repository@localPath, recursive=TRUE)
  untarDir <- tempfile()
  untar(tmpFile, exdir = untarDir)
  subDir <- list.dirs(untarDir, recursive=F)
  theseFullFiles <- list.files(subDir, recursive=T, full.names=T)
  thesePartial <- sub(subDir, "", theseFullFiles, fixed=T)
  
  ## CREATE DIRECTORIES IF NECESSARY
  basedirs <- unique(dirname(file.path(repository@localPath, thesePartial)))
  createDirs <- basedirs[!file.exists(basedirs)]
  if( length(createDirs) > 0L ){
    createDirs <- mapply(dir.create, createDirs, MoreArgs=list(recursive=T))
  }
  
  ## COPY FILES
  file.copy(theseFullFiles, file.path(repository@localPath, thesePartial))
  file.remove(tmpFile)
  unlink(untarDir)
  return(TRUE)
}


