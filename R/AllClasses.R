## GENERIC CLASS DEFINITIONS
##
## AUTHOR: BRIAN M. BOT
#####

setClass(
  Class = "GlobalCache",
  representation = representation(env = "environment"),
  prototype = prototype(
    env = new.env(parent=emptyenv())
  )
)

setClass(
  Class = "githubRepo",
  
  representation = representation(
    user = "character",
    repo = "character",
    commit = "character",
    tree = "data.frame",
    localPath = "character"),
    
  prototype = prototype(
    localPath = NA_character_)
)
setValidity(
  "githubRepo",
  function(object){
    for(this in c("user", "repo", "commit", "localPath")){
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
    cat('  user   = ', slot(object, "user"), '\n', sep="")
    cat('  repo   = ', slot(object, "repo"), '\n', sep="")
    cat('  commit = ', slot(object, "commit"), '\n', sep="")
    cat('-----------------------------\n')
    if( any(names(object@tree)=="downloadedLocally") ){
      cat('  tree contains ', nrow(object@tree), ' files (', sum(object@tree$downloadedLocally),' downloaded locally)\n', sep="")
    } else{
      cat('  tree contains ', nrow(object@tree), ' files\n', sep="")
    }
    if( !is.na(slot(object, "localPath")) )
      cat('  localPath = ', slot(object, "localPath"), '\n', sep="")
  }
)


