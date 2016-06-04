## REST API CALLS
#####
## FOCUS ON GET CALLS ONLY FOR NOW - POSSIBLY EXTEND TO POST, PATCH, PUT, AND DELETE IN THE FUTURE
#####

githubRestGET <- function(uri, endpoint = .getGithubCache("githubEndpoint"), .opts=.getGithubCache("opts"), httpheader=.getGithubCache("httpheader"), ...){
  uri <- sub(endpoint, "", uri, fixed=T)
  if(substr(uri, 1, 1) == "/"){
    uri <- substr(uri, 2, nchar(uri))
  }
  url <- paste(endpoint, uri, sep="")
  
  accept <- httpheader[["Accept"]]
  
  tryGetURL <- getURL(url, .opts=.opts,
                      httpheader=httpheader, ...)
  
  ## IF THE RESPONSE IS IN JSON, CONVERT IT
  if( grepl("json", accept) ){
    tryGetURL <- fromJSON(tryGetURL)
    if(any(names((tryGetURL)) == "message")){
      if(tryGetURL["message"] == "Not Found")
        stop("github api could not find specified URI", call.=F)
    }
  }
  
  return(tryGetURL)
}

# githubRestPOST <- function(uri, endpoint = .getGithubCache("githubEndpoint"), ...){
#   
# }
# 
# githubRestPATCH <- function(uri, endpoint = .getGithubCache("githubEndpoint"), ...){
#   
# }
# 
# githubRestPUT <- function(uri, endpoint = .getGithubCache("githubEndpoint"), ...){
#   
# }
# 
# githubRestDELETE <- function(uri, endpoint = .getGithubCache("githubEndpoint"), ...){
#   
# }
# 
# githubRestHEAD <- function(uri, endpoint = .getGithubCache("githubEndpoint"), ...){
#   
# }

