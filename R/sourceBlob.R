## AUTHOR: BRIAN M. BOT
#####


setMethod(
  f = "sourceBlob",
  signature = c("githubRepo", "character"),
  definition = function(repository, repositoryPath){
    
    ## MAKE SURE repositoryPath EXISTS
    if( !all(repositoryPath %in% repository@tree$path) ){
      stop("repositoryPath does not exists within this repository - cannot source")
    }
    
    ## CHECK TO SEE IF THE BLOBS ARE DOWNLOADED LOCALLY -- IF NOT, THROW AN ERROR
    idx <- mapply(repositoryPath, FUN=function(x){
      which(repository@tree$path == x)
    })
    downloadThese <- which(!repository@tree$downloadedLocally[idx])
    if( length(downloadThese) > 0L ){
      stop(sprintf("there was at least one repositoryPath that was not downloaded locally. Please run the following command before sourcing these files:
           %s <- downloadRepoBlob(%s, %s)", deparse(substitute(repository)), deparse(substitute(repository)), deparse(repositoryPath[downloadThese])))
    }
    
    sourceThese <- file.path(repository@localPath, repositoryPath)
    
    invisible(mapply(sourceThese, FUN=source))
  }
)



