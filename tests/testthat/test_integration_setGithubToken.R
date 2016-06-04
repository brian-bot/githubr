library(githubr)
context("setGithubToken integration")

test_that("setGithubToken - different ref types", {
  checkGithubToken()
  ## THIS MEANS THAT THE AUTH TOKEN HAS BEEN SUCCESSFULLY STORED
  expect_true(.inGithubCache("Authorization"))
})
