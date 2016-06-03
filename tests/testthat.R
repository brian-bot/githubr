library(testthat)
library(githubr)

## CHECK FOR ENVIRONMENT VARIABLE AND USE TO AUTHENTICATE, IF AVAILABLE
token <- Sys.getenv("GITHUBRTOKEN")
if(token != ""){
  setGithubToken(token)
}

## FOR USE IN TESTS
checkGithubToken <- function(){
  if(!.inGithubCache("Authorization")){
    skip("No GitHub Authorization present - will not run integration tests")
  }
}

test_check("githubr")
