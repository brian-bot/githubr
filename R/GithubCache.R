## CREATE AND MANAGE A GLOBAL CACHE FOR THE CLIENT TO ACCESS
#####
## AUTHOR: BRIAN M. BOT
#####

.setGithubCache <- function(key, value){
  cache <- new("GithubCache")
  cache@env[[key]] <- value
  
  ## IF ONE OF THESE PARAMS THEN ADD TO OPTS
  params <- c("userpwd", "httpauth")
  if(key %in% params){
    opts <- .getGithubCache("opts")
    opts[[key]] <- value
    .setGithubCache("opts", opts)
  }
  
  return(NULL)
}

.inGithubCache <- function(key){
  cache <- new("GithubCache")
  return(key %in% ls(cache@env))
}

.getGithubCache <- function(key){
  if( !.inGithubCache(key) ){
    return(NULL)
  } else{
    cache <- new("GithubCache")
    return(cache@env[[key]])
  }
}

