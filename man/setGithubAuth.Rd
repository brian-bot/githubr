\name{setGithubAuth}
\alias{setGithubAuth}

\title{ function used to retrieve github authentication for a specific user }

\description{
  \code{setGithubAuth} makes a call to github authorization services and either (1) retrieves a token specific to the rGithubClient (if already exists); or (2) creates a new token. This retrieved token is used for all subsequent calls to github api for the current R session.
}

\usage{
  setGithubAuth(user, password)
}

\arguments{
  \item{user}{
    character string specifying github user account name
  }
  \item{password}{
    character string specifying github password (this is used to retrieve token, but not stored in R session)
  }
}

\value{
  sets authorization to be used for subsequent github API calls and invisibly returns token
}

\seealso{
  \code{\link{getPermlink}}, \code{\link{getRepo}}, \code{\link{githubRepo}}, \code{\link{sourceRepoFile}}, \code{\link{view}}
}
