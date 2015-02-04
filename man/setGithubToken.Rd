\name{setGithubToken}
\alias{setGithubToken}

\title{ function used to cache github token for all subsequent api calls }

\description{
  \code{setGithubToken} . This token is used for all subsequent calls to github api for the current R session.
}

\usage{
  setGithubToken(token)
}

\arguments{
  \item{token}{
    character string specifying a github personal access tokens
  }
}

\value{
  invisibly sets token to be used for subsequent github api calls
}

\seealso{
  \code{\link{getPermlink}}, \code{\link{getRepo}}, \code{\link{githubRepo}}, \code{\link{sourceRepoFile}}, \code{\link{view}}
}
