## FUNCTION THAT WILL CHECK ALL getURL CALLS FOR FAILURES AND CONVERT JSON RESPONSES
#####

.getGithubJSON <- function(url, ...){
  
  tryGetURL <- getURL(url, .opts=.getGithubCache("opts"),
                      httpheader=c("Accept" = "application/json", "User-Agent" = .getGithubCache("User-Agent")), ...)
  tryGetURL <- fromJSON(tryGetURL)
  if(is.character(tryGetURL)){
    if(tryGetURL["message"] == "Not Found")
      stop("github api could not find specified repository and/or reference", call.=F)
  }
  
  return(tryGetURL)
}
