\name{view}
\alias{view}

\title{ Function \code{view} in Package \pkg{rGithubClient} }

\description{
  \code{view} allows users to quickly and easily view github repositories (or specific files within said repository) through the default web browser
}

\usage{
  view(repository, repositoryPath, ...)
}

\arguments{
  \item{repository}{
    a \code{githubRepo} object -- or the name of repository, as a character string in the form of /owner/repo, which is passed to \code{getRepo} along with optional arguments \code{ref} and \code{refName} to generate a \code{githubRepo} object
  }
  \item{...}{
    if \code{repository} is a character string specifying a repository, optional named arguments \code{ref} and \code{refName} to generate a \code{githubRepo} object
  }
  \item{repositoryPath}{
    optional argument specifying a specific file within the repository to view (must be contained in \code{repository@tree$path})
  }
}

\value{
  directs user to the default web browser and invisibly returns web url internally
}

\seealso{
  \code{\link{getPermlink}}, \code{\link{getRepo}}, \code{\link{githubRepo}}, \code{\link{sourceRepoFile}}
}

