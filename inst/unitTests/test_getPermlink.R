## TESTING FOR getPermlink METHOD
#####

unitTestGetPermlink <- function(){
  ## TRY PASSING A CHARACTER VECTOR OF A REPOSITORY
  getPermlink("brian-bot/rGithubClient")
  getPermlink("brian-bot/rGithubClient", ref="tag", refName="rGithubClient-0.8")
  getPermlink("brian-bot/rGithubClient", ref="branch", refName="dev")
  getPermlink("brian-bot/rGithubClient", ref="commit", refName="9382e7191073c1a5dc554ec8b6658d07d405b89e")
  checkException(getPermlink("brian-bot/rGithubClient", type="raw"), silent=T)
  
  ## TRY PASSING A CHARACTER VECTOR OF A REPOSITORY - NOW WITH A FILE PATH
  getPermlink("brian-bot/rGithubClient", "DESCRIPTION")
  getPermlink("brian-bot/rGithubClient", "DESCRIPTION", ref="tag", refName="rGithubClient-0.8")
  getPermlink("brian-bot/rGithubClient", "DESCRIPTION", ref="branch", refName="dev")
  getPermlink("brian-bot/rGithubClient", "DESCRIPTION", ref="commit", refName="9382e7191073c1a5dc554ec8b6658d07d405b89e")
  getPermlink("brian-bot/rGithubClient", "DESCRIPTION", type="raw")
  getPermlink("brian-bot/rGithubClient", "DESCRIPTION", ref="tag", refName="rGithubClient-0.8", type="raw")
  getPermlink("brian-bot/rGithubClient", "DESCRIPTION", ref="branch", refName="dev", type="raw")
  getPermlink("brian-bot/rGithubClient", "DESCRIPTION", ref="commit", refName="9382e7191073c1a5dc554ec8b6658d07d405b89e", type="raw")
  
  ## NOW TRY BY PASSING A githubRepo OBJECT
  myRepo <- getRepo("brian-bot/rGithubClient", ref="tag", refName="rGithubClient-0.8")
  getPermlink(myRepo)
  getPermlink(myRepo, "DESCRIPTION")
  getPermlink(myRepo, "DESCRIPTION", type="raw")
}


