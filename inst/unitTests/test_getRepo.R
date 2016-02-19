## TESTING FOR getRepo METHOD
#####

unitTestGetRepo <- function(){
  ## CALLS GIVEN NO REF AND EACH DIFFERENT ALLOWABLE REF TYPE
  getRepo("brian-bot/githubr")
  getRepo("brian-bot/githubr", ref="tag", refName="rGithubClient-0.8")
  getRepo("brian-bot/githubr", ref="branch", refName="dev")
  getRepo("brian-bot/githubr", ref="commit", refName="9382e7191073c1a5dc554ec8b6658d07d405b89e")
}

