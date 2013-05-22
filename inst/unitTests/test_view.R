## TESTING FOR view METHOD
##
## CURRENTLY UNTESTED SINCE WOULD REQUIRE LAUNCHING EXTERNAL WEB BROWSER
## IN FUTURE WILL ALLOW PASSING OF browser="false" TO ... IN ORDER TO ALLOW TESTING
#####

unitTestView <- function(){
  ## TRY PASSING A CHARACTER VECTOR OF A REPOSITORY
  view("brian-bot/rGithubClient", browser="false")
  view("brian-bot/rGithubClient", ref="tag", refName="rGithubClient-0.8", browser="false")
  view("brian-bot/rGithubClient", ref="branch", refName="dev", browser="false")
  view("brian-bot/rGithubClient", ref="commit", refName="9382e7191073c1a5dc554ec8b6658d07d405b89e", browser="false")
  
  ## TRY PASSING A CHARACTER VECTOR OF A REPOSITORY - NOW WITH A FILE PATH
  view("brian-bot/rGithubClient", "DESCRIPTION", browser="false")
  view("brian-bot/rGithubClient", "DESCRIPTION", ref="tag", refName="rGithubClient-0.8", browser="false")
  view("brian-bot/rGithubClient", "DESCRIPTION", ref="branch", refName="dev", browser="false")
  view("brian-bot/rGithubClient", "DESCRIPTION", ref="commit", refName="9382e7191073c1a5dc554ec8b6658d07d405b89e", browser="false")
  
  ## NOW TRY BY PASSING A githubRepo OBJECT
  myRepo <- getRepo("brian-bot/rGithubClient", ref="tag", refName="rGithubClient-0.8")
  view(myRepo, browser="false")
  view(myRepo, "DESCRIPTION", browser="false")
}

