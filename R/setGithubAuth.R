## AUTHOR: BRIAN M. BOT
#####

setGithubAuth <- function(user, password){
  stopifnot( length(user)==1L & is.character(user))
  stopifnot( length(password)==1L & is.character(password) )
  
  ## CHECK GITHUB AUTH
  test <- .getGithubJSON("https://api.github.com/authorizations",
                         userpwd=paste(user, password, sep=":"), httpauth=1L)
  if( is.character(test) ){
    if( test == "Bad credentials" )
      stop("user / password combination not recognized by github")
  }
  
  ## IF PASS CHECK, THEN SET IN CACHE FOR FUTURE CALLS
  .setGithubCache("userpwd", paste(user, password, sep=":"))
  .setGithubCache("httpauth", 1L)
  
  return(invisible(cat("Success!")))
}

