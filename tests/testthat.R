library(testthat)
library(githubr)

## CHECK FOR ENVIRONMENT VARIABLE AND USE TO AUTHENTICATE, IF AVAILABLE
token <- Sys.getenv("GITHUBRTOKEN")
if(token != ""){
  setGithubToken(token)
}

test_check("githubr")
