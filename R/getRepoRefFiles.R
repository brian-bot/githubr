## AUTHOR: BRIAN M. BOT
#####

setMethod(
  f = ".getRepoRefFiles",
  signature = c("list", "character"),
  definition = function(treeList, repoPath){
    
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
#    theseFiles <- theseFiles[!sapply(theseFiles, is.null)]
    
    return(theseFiles)
  }
)

setMethod(
  f = ".getRepoRefFiles",
  signature = c("list", "missing"),
  definition = function(treeList, repoPath){
    .getRepoRefFiles(treeList, tempdir())
  }
)


