library(githubr)
context("getPermlink integration")

test_that("getPermlink - repo character no file path", {
  checkGithubToken()
  
  pl <- getPermlink("brian-bot/githubr")
  expect_true(checkResponseStatusOk(pl))
  pl <- getPermlink("brian-bot/githubr", ref="tag", refName="rGithubClient-0.8")
  expect_true(checkResponseStatusOk(pl))
  pl <- getPermlink("brian-bot/githubr", ref="branch", refName="dev")
  expect_true(checkResponseStatusOk(pl))
  pl <- getPermlink("brian-bot/githubr", ref="commit", refName="9382e7191073c1a5dc554ec8b6658d07d405b89e")
  expect_true(checkResponseStatusOk(pl))
  
  expect_error(getPermlink("brian-bot/githubr", type="raw"))
})

test_that("getPermlink - repo character + file path", {
  checkGithubToken()
  
  pl <- getPermlink("brian-bot/githubr", "DESCRIPTION")
  expect_true(checkResponseStatusOk(pl))
  pl <- getPermlink("brian-bot/githubr", "DESCRIPTION", ref="tag", refName="rGithubClient-0.8")
  expect_true(checkResponseStatusOk(pl))
  pl <- getPermlink("brian-bot/githubr", "DESCRIPTION", ref="branch", refName="dev")
  expect_true(checkResponseStatusOk(pl))
  pl <- getPermlink("brian-bot/githubr", "DESCRIPTION", ref="commit", refName="9382e7191073c1a5dc554ec8b6658d07d405b89e")
  expect_true(checkResponseStatusOk(pl))
  pl <- getPermlink("brian-bot/githubr", "DESCRIPTION", type="raw")
  expect_true(checkResponseStatusOk(pl))
  pl <- getPermlink("brian-bot/githubr", "DESCRIPTION", ref="tag", refName="rGithubClient-0.8", type="raw")
  expect_true(checkResponseStatusOk(pl))
  pl <- getPermlink("brian-bot/githubr", "DESCRIPTION", ref="branch", refName="dev", type="raw")
  expect_true(checkResponseStatusOk(pl))
  pl <- getPermlink("brian-bot/githubr", "DESCRIPTION", ref="commit", refName="9382e7191073c1a5dc554ec8b6658d07d405b89e", type="raw")
  expect_true(checkResponseStatusOk(pl))
})

test_that("getPermlink - repo object + file path", {
  checkGithubToken()
  myRepo <- getRepo("brian-bot/githubr", ref="tag", refName="rGithubClient-0.8")
  pl <- getPermlink(myRepo)
  expect_true(checkResponseStatusOk(pl))
  pl <- getPermlink(myRepo, "DESCRIPTION")
  expect_true(checkResponseStatusOk(pl))
  pl <- getPermlink(myRepo, "DESCRIPTION", type="raw")
  expect_true(checkResponseStatusOk(pl))
})
