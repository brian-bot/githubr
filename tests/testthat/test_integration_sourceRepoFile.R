library(githubr)
context("sourceRepoFile integration")

test_that("sourceRepoFile - repo character", {
  checkGithubToken()
  
  sourceRepoFile(repository="brian-bot/githubr", repositoryPath="R/getGithubJSON.R", ref="tag", refName="rGithubClient-0.8")
  expect_true(exists(".getGithubJSON"))
})

test_that("sourceRepoFile - repo object", {
  checkGithubToken()
  
  myRepo <- getRepo("brian-bot/githubr", ref="tag", refName="rGithubClient-0.8")
  sourceRepoFile(repository=myRepo, repositoryPath="R/getGithubJSON.R")
  expect_true(exists(".getGithubJSON"))
})
