## AUTHOR: BRIAN M. BOT
#####


setMethod(
  f = "downloadRepo",
  signature = c("character"),
  definition = function(repository, ...){
    argList <- list(...)
    if(any(names(argList) == "outputPath")){
      outputPath <- argList[["outputPath"]]
      return(downloadRepo(getRepo(repository, ...), outputPath=outputPath))
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
    if(any(names(argList) != "outputPath"))
      stop("invalid optional argument\n")
    if(any(names(argList) == "outputPath"))
      myRepo@outputPath <- argList[["outputPath"]]
    if(myRepo@outputPath == "NA"){
      tmpDir <- tempfile(pattern="dir")
      dir.create(tmpDir)
      myRepo@outputPath <- tmpDir
    }
    
    cat(paste("status: downloading file tree to ", myRepo@outputPath, "\n", sep=""))
    for(i in 1:length(myRepo@tree$treeUrls)){
      fullFile <- file.path(myRepo@outputPath, myRepo@tree$treeFiles[i])
      basedir <- dirname(fullFile)
      if( !file.exists(basedir) ){
        dir.create(basedir, recursive=TRUE)
      }
      tmpText <- getURL(myRepo@tree$treeUrls[i], httpheader = c(Accept="application/vnd.github.raw"))
      cat(tmpText, file=fullFile)
    }
    
    return(myRepo)
  }
)


