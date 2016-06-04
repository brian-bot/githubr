library(githubr)
context("view integration")

test_that("view - repo character", {
  checkGithubToken()
  
  ## TRY PASSING A CHARACTER VECTOR OF A REPOSITORY
  pl <- view("brian-bot/githubr", browser="false")
  expect_true(checkResponseStatusOk(pl))
  pl <- view("brian-bot/githubr", ref="tag", refName="rGithubClient-0.8", browser="false")
  expect_true(checkResponseStatusOk(pl))
  pl <- view("brian-bot/githubr", ref="branch", refName="dev", browser="false")
  expect_true(checkResponseStatusOk(pl))
  pl <- view("brian-bot/githubr", ref="commit", refName="9382e7191073c1a5dc554ec8b6658d07d405b89e", browser="false")
  expect_true(checkResponseStatusOk(pl))
})

test_that("view - repo character + file path", {
  checkGithubToken()
  
  ## TRY PASSING A CHARACTER VECTOR OF A REPOSITORY - NOW WITH A FILE PATH
  pl <- view("brian-bot/githubr", "DESCRIPTION", browser="false")
  expect_true(checkResponseStatusOk(pl))
  pl <- view("brian-bot/githubr", "DESCRIPTION", ref="tag", refName="rGithubClient-0.8", browser="false")
  expect_true(checkResponseStatusOk(pl))
  pl <- view("brian-bot/githubr", "DESCRIPTION", ref="branch", refName="dev", browser="false")
  expect_true(checkResponseStatusOk(pl))
  pl <- view("brian-bot/githubr", "DESCRIPTION", ref="commit", refName="9382e7191073c1a5dc554ec8b6658d07d405b89e", browser="false")
  expect_true(checkResponseStatusOk(pl))
})

test_that("view - repo object", {
  checkGithubToken()
  
  ## NOW TRY BY PASSING A githubRepo OBJECT
  myRepo <- getRepo("brian-bot/githubr", ref="tag", refName="rGithubClient-0.8")
  pl <- view(myRepo, browser="false")
  expect_true(checkResponseStatusOk(pl))
  pl <- view(myRepo, "DESCRIPTION", browser="false")
  expect_true(checkResponseStatusOk(pl))
})
