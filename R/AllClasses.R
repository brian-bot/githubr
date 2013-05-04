## GENERIC CLASS DEFINITIONS
##
## AUTHOR: BRIAN M. BOT
#####

setClass(
  Class = "githubRepo",
  
  representation = representation(
    user = "character",
    repo = "character",
    ref = "character",
    refName = "character",
    commit = "character",
    apiResponses = "list",
    tree = "data.frame"),
    
  prototype = prototype(
    ref = "branch",
    refName = "master")
)
setValidity(
  "githubRepo",
  function(object){
    ## CHECK TO MAKE SURE ARGUMENTS ARE ONLY OF LENGTH 1
    for(this in c("user", "repo", "ref", "refName", "commit")){
      if( length(slot(object, this)) > 1L ){
        return(paste(this, " may only contain a single character value\n", sep=""))
      }
    }
    
    ## CHECK VALID VALUES FOR ref
    validRefs <- c("tag", "branch", "commit")
    if( !(object@ref %in% validRefs) ){
      return(sprintf("Valid refs are: %s", paste(validRefs, collapse=", ")))
    }
    
    ## CHECK VALID VALUES FOR ref
    validResponses <- c("repo", "ref", "commit", "tree")
    if( length(object@apiResponses) > 0L ){
      if( !(names(object@apiResponses) %in% validResponses) ){
        return(sprintf("Valid API responses are: %s", paste(validResponses, collapse=", ")))
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
    cat('  user    = ', slot(object, "user"), '\n', sep="")
    cat('  repo    = ', slot(object, "repo"), '\n', sep="")
    cat('  ref     = ', slot(object, "ref"), '\n', sep="")
    cat('  refName = ', slot(object, "refName"), '\n', sep="")
    cat('-----------------------------\n')
    cat('  commit  = ', slot(object, "commit"), '\n', sep="")
    cat('  tree contains ', nrow(object@tree), ' files\n', sep="")
  }
)

## CREATE A CACHE THAT CAN BE WRITTEN TO IN ORDER FOR CLIENT TO ACCESS INFORMATION
setClass(
  Class = "GithubCache",
  representation = representation(env = "environment"),
  prototype = prototype(env = new.env(parent=emptyenv()))
)
