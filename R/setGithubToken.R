## AUTHOR: BRIAN M. BOT
#####

setGithubToken <- function(token){
  stopifnot( length(token)==1L & is.character(token))
  
  ## CHECK TOKEN
  header <- .getGithubCache("httpheader")
  header[["Authorization"]] <- paste("token", token)
  getUser <- githubRestGET("/user", httpheader=header)
  if( is.character(getUser) ){
    if( "Bad credentials" %in% getUser )
      stop("token not recognized by github - check the token or generate a new personal access token here: https://github.com/settings/applications")
  }
  
  ## IF PASS CHECK, THEN SET IN CACHE FOR FUTURE CALLS
  .setGithubCache("Authorization", paste("token", token))
  
  message(sprintf("OAuth successfully set for user %s!", getUser$login))
  return(invisible(TRUE))
}
