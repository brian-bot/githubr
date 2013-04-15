## AUTHOR: BRIAN M. BOT
#####

## THIS SIGNATURE GETS INFO ABOUT REPOSITORY IF REPOSITORY IS PASSED AS A CHARACTER STRING
setMethod(
  f = "getPermlink",
  signature = signature("character", "ANY"),
  definition = function(repository, repositoryPath, ...){
    
    argList <- list(...)
    argList[["repository"]] <- repository
    
    if( any(names(argList) == "type") ){
      type <- tolower(argList[["type"]])
      argList[["type"]] <- NULL
    } else{
      type <- "html"
    }
    
    myRepo <- do.call(getRepo, argList)
    
    if( missing(repositoryPath) ){
      getPermlink(myRepo, as.character(NA), type=type)
    } else{
      getPermlink(myRepo, repositoryPath, type=type)
    }
  }
)

## THE MOST SPECIFIC OF THE FUNCTIONS (WHICH ALL WILL END UP CALLING)
setMethod(
  f = "getPermlink",
  signature = signature("githubRepo", "character"),
  definition = function(repository, repositoryPath, ...){
    
    argList <- list(...)
    if( any(names(argList) == "type") ){
      type <- tolower(argList[["type"]])
      if( !(type %in% c("raw", "html")) ){
        stop("type must be either 'raw' or 'html'")
      }
    } else{
      type <- "html"
    }
    
    if( !is.na(repositoryPath) & !(repositoryPath %in% repository@tree$path) ){
      stop(sprintf("repositoryPath %s does not match any paths within the repository tree", repositoryPath))
    }
    
    if( type == "raw" ){
      if( is.na(repositoryPath) ){
        stop("repositoryPath must be specified for type='raw'")
      }
      permlink <- .constructRawPermlink(repository, repositoryPath)
    }
    if( type == "html" ){
      permlink <- .constructHtmlPermlink(repository, repositoryPath)
    }
    
    return(permlink)
  }
)
