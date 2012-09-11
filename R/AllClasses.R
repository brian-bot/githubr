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
    ref = "character",
    refName = "character",
    commit = "character",
    tree = "data.frame",
    localPath = "character"),
    
  prototype = prototype(
    ref = "branch",
    refName = "master",
    localPath = NA_character_)
)
setValidity(
  "githubRepo",
  function(object){
    ## CHECK TO MAKE SURE ARGUMENTS ARE ONLY OF LENGTH 1
    for(this in c("user", "repo", "ref", "refName", "commit", "localPath")){
      if( length(slot(object, this)) > 1L ){
        return(paste(this, " may only contain a single character value\n", sep=""))
      }
    }
    
    ## CHECK VALID VALUES FOR ref
    validrefs <- c("tag", "branch", "commit")
    if( !(object@ref %in% validrefs) ){
      return(sprintf("Valid refs are: %s", paste(validrefs, collapse=", ")))
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
    cat('  user    = ', slot(object, "user"), '\n', sep="")
    cat('  repo    = ', slot(object, "repo"), '\n', sep="")
    cat('  ref     = ', slot(object, "ref"), '\n', sep="")
    cat('  refName = ', slot(object, "refName"), '\n', sep="")
    cat('-----------------------------\n')
    cat('  commit  = ', slot(object, "commit"), '\n', sep="")
    if( any(names(object@tree)=="downloadedLocally") ){
      cat('  tree contains ', nrow(object@tree), ' files (', sum(object@tree$downloadedLocally),' downloaded locally)\n', sep="")
    } else{
      cat('  tree contains ', nrow(object@tree), ' files\n', sep="")
    }
    if( !is.na(slot(object, "localPath")) )
      cat('  localPath = ', slot(object, "localPath"), '\n', sep="")
  }
)


