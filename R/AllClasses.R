## GENERIC CLASS DEFINITIONS
##
## AUTHOR: BRIAN M. BOT
#####

setClass(
  Class = "githubRepo",
  
  representation = representation(
    user = "character",
    repo = "character",
    commit = "character",
    tree = "list",
    outputPath = "character"),
    
  prototype = prototype(
    outputPath = "NA")
)
setValidity(
  "githubRepo",
  function(object){
    for(this in c("user", "repo", "commit", "outputPath")){
      if( length(slot(object, this)) > 1L ){
        return(paste(this, " may only contain a single character value\n", sep=""))
      }
    }
  }
)


#####
## INCLUDE SHOW METHOD
#####
setMethod(
  f = "show",
  signature = "githubRepo",
  definition = function(object){
    cat('An object of class githubRepo\n')
    cat('-----------------------------\n')
    cat('  user  = ', slot(object, "user"), '\n', sep="")
    cat('  repo   = ', slot(object, "repo"), '\n', sep="")
    cat('  commit = ', slot(object, "commit"), '\n', sep="")
    cat('-----------------------------\n')
    cat('  tree (list) contains ', length(slot(object, "tree")$treeFiles), ' files\n', sep="")
    cat('    - tree$treeFiles contains file name paths relative to repository\n')
    cat('    - tree$treeUrls contains url to commit-specific locations within github\n')
    cat('  outputPath = ', slot(object, "outputPath"), '\n', sep="")
  }
)


