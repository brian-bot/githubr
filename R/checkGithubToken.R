## FOR USE IN TESTS
checkGithubToken <- function(){
  if(!.inGithubCache("Authorization")){
    skip("No GitHub Authorization present - will not run integration tests")
  }
}
