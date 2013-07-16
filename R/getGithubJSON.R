## FUNCTION THAT WILL CHECK ALL getURL CALLS FOR FAILURES AND CONVERT JSON RESPONSES
#####

.getGithubJSON <- function(url, .opts, httpheader, ...){
  
  tryGetURL <- getURL(url, .opts=.opts,
                      httpheader=httpheader, ...)
  tryGetURL <- fromJSON(tryGetURL)
  if(is.character(tryGetURL)){
    if(tryGetURL["message"] == "Not Found")
      stop("github api could not find specified URI", call.=F)
  }
  
  return(tryGetURL)
}
