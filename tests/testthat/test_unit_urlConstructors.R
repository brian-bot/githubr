require(githubr)
context("various urlConstructors")

test_that(".constructBlobURL unit", {
  repository <- new("githubRepo",
                    apiResponses=list(
                      tree=list(
                        tree=list(
                          list(
                            url=c("blah/this/that/1234abcd", "blah/this/that/1234dcba"),
                            sha="1234abcd"
                          )
                        )
                      )
                    ))
  expect_equal(githubr:::.constructBlobURL(repository, "1234abcd"), "blah/this/that/1234abcd")
})

test_that(".constructRepoURI unit", {
  repository = new("githubRepo",
                   user="brian-bot",
                   repo="githubr")
  expect_equal(githubr:::.constructRepoURI(repository), "/repos/brian-bot/githubr")
})

test_that(".constructCommitURI unit", {
  repository = new("githubRepo",
                   apiResponses=list(
                     repo=list(
                       git_commits_url="this/that{/sha}"
                     )
                   ),
                   commit="thisOne")
  expect_equal(githubr:::.constructCommitURI(repository), "this/that/thisOne")
})

test_that(".constructHtmlPermlink unit -- repositoryPath NA", {
  repository = new("githubRepo",
                   apiResponses=list(
                     repo=list(
                       html_url="this/that"
                     )
                   ),
                   commit="thisOne")
  expect_equal(githubr:::.constructHtmlPermlink(repository), "this/that/tree/thisOne")
})

test_that(".constructHtmlPermlink unit -- repositoryPath non-NA", {
  repository = new("githubRepo",
                   apiResponses=list(
                     repo=list(
                       html_url="this/that"
                     )
                   ),
                   commit="thisOne")
  expect_equal(githubr:::.constructHtmlPermlink(repository, "thisThing/livesHere.R"), "this/that/blob/thisOne/thisThing/livesHere.R")
})

test_that(".constructRawPermlink unit -- repositoryPath NA", {
  repository = new("githubRepo",
                   user="brian-bot",
                   repo="githubr",
                   commit="thisOne")
  expect_equal(githubr:::.constructRawPermlink(repository, "thisThing/livesHere.R"), "https://raw.github.com/brian-bot/githubr/thisOne/thisThing/livesHere.R")
})
