## METHOD THAT WILL CHECK ALL getURL CALLS FOR FAILURES AND CONVERT JSON RESPONSES
#####


setMethod(
  f = ".getGitURLjson",
  signature = c("character"),
  definition = function(url, ...){
    
    tryGetURL <- getURL(url, ...)
    tryGetURL <- fromJSON(tryGetURL)
    if(is.character(tryGetURL)){
      if(tryGetURL["message"] == "Not Found")
        stop("github api could not find specified repository and/or reference", call.=F)
    }
    
    return(tryGetURL)
  }
)
