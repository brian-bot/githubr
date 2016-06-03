library(githubr)
context("getPermlink integration")

test_that("getPermlink - repo character", {
  checkGithubToken()
  getPermlink("brian-bot/githubr")
  getPermlink("brian-bot/githubr", ref="tag", refName="rGithubClient-0.8")
  getPermlink("brian-bot/githubr", ref="branch", refName="dev")
  getPermlink("brian-bot/githubr", ref="commit", refName="9382e7191073c1a5dc554ec8b6658d07d405b89e")
  expect_error(getPermlink("brian-bot/githubr", type="raw"))
})

test_that("getPermlink - repo character + file path", {
  checkGithubToken()
  getPermlink("brian-bot/githubr", "DESCRIPTION")
  getPermlink("brian-bot/githubr", "DESCRIPTION", ref="tag", refName="rGithubClient-0.8")
  getPermlink("brian-bot/githubr", "DESCRIPTION", ref="branch", refName="dev")
  getPermlink("brian-bot/githubr", "DESCRIPTION", ref="commit", refName="9382e7191073c1a5dc554ec8b6658d07d405b89e")
  getPermlink("brian-bot/githubr", "DESCRIPTION", type="raw")
  getPermlink("brian-bot/githubr", "DESCRIPTION", ref="tag", refName="rGithubClient-0.8", type="raw")
  getPermlink("brian-bot/githubr", "DESCRIPTION", ref="branch", refName="dev", type="raw")
  getPermlink("brian-bot/githubr", "DESCRIPTION", ref="commit", refName="9382e7191073c1a5dc554ec8b6658d07d405b89e", type="raw")
})

test_that("getPermlink - repo object + file path", {
  checkGithubToken()
  myRepo <- getRepo("brian-bot/githubr", ref="tag", refName="rGithubClient-0.8")
  getPermlink(myRepo)
  getPermlink(myRepo, "DESCRIPTION")
  getPermlink(myRepo, "DESCRIPTION", type="raw")
})
