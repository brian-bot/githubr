library(githubr)
context("getRepo integration")

test_that("getRepo - different ref types", {
  checkGithubToken()
  
  getRepo("brian-bot/githubr")
  getRepo("brian-bot/githubr", ref="tag", refName="rGithubClient-0.8")
  getRepo("brian-bot/githubr", ref="branch", refName="dev")
  getRepo("brian-bot/githubr", ref="commit", refName="9382e7191073c1a5dc554ec8b6658d07d405b89e")
  expect_error(getRepo("brian-bot/githubr", ref="commit", refName="githubrIsAwesome"))
})
