## AUTHOR: BRIAN M. BOT
#####

setMethod(
  f = ".getCommitFiles",
  signature = c("list", "character"),
  definition = function(treeList, outputPath){
    
    cat("status: getting the file tree\n")
    theseFiles <- lapply(treeList$tree, function(x){
      tmpText <- getURL(x[["url"]], httpheader = c(Accept="application/vnd.github.raw"))
      tmpDir <- dirname(x[["path"]])
      if( x[["type"]] == "tree" ){
        if( !file.exists(file.path(outputPath, x[["path"]])) ){
          dir.create(file.path(outputPath, x[["path"]]), recursive=T)
        }
        return(NULL)
      } else{
        cat(tmpText, file=file.path(outputPath, x[["path"]]))
        return(x[["path"]])
      }
    })
    theseFiles <- file.path(outputPath, theseFiles[!sapply(theseFiles, is.null)])
    
    return(theseFiles)
  }
)

# setMethod(
#   f = ".getRepoRefFiles",
#   signature = c("list", "missing"),
#   definition = function(treeList, outputPath){
#     .getRepoRefFiles(treeList, tempdir())
#   }
# )


