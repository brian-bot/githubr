## GET METADATA SURROUNDING A REPO TIMEPOINT (HEAD, TAG, ETC)
##
## AUTHOR: BRIAN M. BOT
#####

setMethod(
  f = "getRepoFiles",
  signature = c("character", "character", "character"),
  definition = function(repo, type, name){
    
    repoPath <- tempdir()
    
    ## GET THE REFERENCE
    getRefInfo <- getURL(paste(repo$url, "/git/refs/", type, "s/", name, sep=""))
    refInfoList <- fromJSON(getRefInfo)
    
    ## GET THE TREE INFORMATION
    getRef <- getURL(refInfoList$object["url"])
    refList <- fromJSON(getRef)
    
    ## GET THE TREE
    getTree <- getURL(paste(refList$tree["url"], "?recursive=1", sep=""))
    treeList <- fromJSON(getTree)
    
    theseFiles <- lapply(treeList$tree, function(x){
      tmpText <- getURL(x[["url"]], httpheader = c(Accept="application/vnd.github.raw"))
      tmpDir <- dirname(x[["path"]])
      if( x[["type"]] == "tree" ){
        if( !file.exists(file.path(repoPath, x[["path"]])) ){
          dir.create(file.path(repoPath, x[["path"]]), recursive=T)
        }
        return(NULL)
      } else{
        cat(tmpText, file=file.path(repoPath, x[["path"]]))
        return(x[["path"]])
      }
    })
    theseFiles <- file.path(repoPath, theseFiles[!sapply(theseFiles, is.null)])
  }
)


setMethod(
  f = "getRepoFiles",
  signature = c("character", "missing", "missing"),
  definition = function(repo, type, name){
    getRepoFiles(repo, "head", "master")
  }
)

setMethod(
  f = "getRepoFiles",
  signature = c("character", "character", "missing"),
  definition = function(repo, type, name){
    getRepoFiles(repo, type, "master")
  }
)


