## CREATE AND MANAGE A GLOBAL CACHE FOR THE CLIENT TO ACCESS
#####
## AUTHOR: BRIAN M. BOT
#####

.setGithubCache <- function(key, value){
  cache <- new("GithubCache")
  cache@env[[key]] <- value
  
  ## IF ONE OF THESE PARAMS THEN ADD TO opts
  validOpts <- c("low.speed.time", "low.speed.limit", "connecttimeout", "followlocation", "ssl.verifypeer", "verbose")
  if(key %in% validOpts){
    opts <- .getGithubCache("opts")
    opts[[key]] <- value
    .setGithubCache("opts", opts)
  }
  
  ## IF ONE OF THESE PARAMS THEN ADD TO httpheader
  validHeaders <- c("Authorization", "User-Agent", "Accept")
  if(key %in% validHeaders){
    httpheader <- .getGithubCache("httpheader")
    httpheader[[key]] <- value
    .setGithubCache("httpheader", httpheader)
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

