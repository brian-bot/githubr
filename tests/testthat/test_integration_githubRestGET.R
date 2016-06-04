library(githubr)
context("githubRestGET integration")

test_that("githubRestGET - test one good call and one bad call", {
  checkGithubToken()
  
  ## ALREADY USED IN MANY OF THE OTHER EXPORTED FUNCTIONS
  githubRestGET('/repos/brian-bot/githubr')
  ## THIS WILL SUCCEED IF A REPO githubrIsAwesome IS EVER CREATED
  expect_error(githubRestGET('/repos/brian-bot/githubrIsAwesome'))
})
