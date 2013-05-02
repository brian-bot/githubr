## AUTHOR: BRIAN M. BOT
#####

setGithubAuth <- function(user, password){
  stopifnot( length(user)==1L & is.character(user))
  stopifnot( length(password)==1L & is.character(password) )
  
  ## CHECK GITHUB AUTH
  getAuths <- .getGithubJSON("https://api.github.com/authorizations",
                             userpwd = paste(user, password, sep=":"), httpauth = 1L)
  if( is.character(getAuths) ){
    if( "Bad credentials" %in% getAuths )
      stop("user / password combination not recognized by github - cannot get OAuth token")
  }
  
  ## IF PASS CHECK, THEN SET IN CACHE FOR FUTURE CALLS
  .setGithubCache("user", user)
  
  ## CHECK TO SEE IF ANY OF THE AUTHS CONTAIN CORRECT TOKEN
  ## IF SO, TAKE THE FIRST ONE RETURNED (IF MULTIPLE)
  if( is.list(getAuths) & length(getAuths) > 0 ){
    idClient <- which(sapply(getAuths, "[[", "note") == "rGithubClient Authorization")
    if( length(idClient) > 0L ){
      token <- getAuths[[idClient[1]]]$token
      #print("grabbed the token")
    }
  }
  
  ## IF NO TOKEN - POST INFORMATION TO CREATE ONE FOR THE USER
  if( !exists("token") ){
    setAuth <- .getGithubJSON("https://api.github.com/authorizations",
                              postfields = .buildOAuthBody(),
                              userpwd = paste(user, password, sep=":"), httpauth = 1L)
    token <- setAuth$token
    #print("set the token")
  }
  
  if( !exists("token") ){
    stop("failure to retrieve or create a token")
  }
  
  .setGithubCache("Authorization", paste("token", token))
  
  message(sprintf("OAuth successfully set for user %s!", user))
  return(invisible(token))
}

.buildOAuthBody <- function(){
  oauthBody <- toJSON(list(scopes = c("repo"),
                           note = "rGithubClient Authorization"))
  return(oauthBody)
}
