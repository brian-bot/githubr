## CREATE A GLOBAL CACHE FOR THE CLIENT TO ACCESS
## AUTHOR: BRIAN M. BOT
#####

.getGithubCache <- function(key){
  cache <- new("GithubCache")
  cache@env[[key]]
  return(NULL)
}

.setGithubCache <- function(key, value){
  cache <- new("GithubCache")
  cache@env[[key]] <- value
  return(NULL)
}


