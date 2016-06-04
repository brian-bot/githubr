library(testthat)
library(githubr)
library(RCurl)

## CHECK FOR ENVIRONMENT VARIABLE AND USE TO AUTHENTICATE, IF AVAILABLE
token <- Sys.getenv("GITHUBRTOKEN")
if(token != ""){
  setGithubToken(token)
}

## FOR USE IN TESTS
checkGithubToken <- function(){
  if(!githubr:::.inGithubCache("Authorization")){
    skip("No GitHub Authorization present - will not run integration tests")
  }
}

checkResponseStatusOk <- function(url){
  hhead <- githubr:::.getGithubCache("httpheader")["User-Agent"]
  h <- basicHeaderGatherer()
  tmp <- getURL(url, .opts=githubr:::.getGithubCache("opts"), httpheader=hhead, headerfunction = h$update)
  ## IF THE RESPONSE CODE IS LESS THAT 400, WE TAKE THAT AS OK
  return(as.integer(h$value()["status"]) < 400)
}

test_check("githubr")
