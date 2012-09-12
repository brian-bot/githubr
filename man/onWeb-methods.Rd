\name{onWeb-methods}
\docType{methods}
\alias{onWeb}
\alias{onWeb-methods}
\alias{onWeb,githubRepo,character-method}
\alias{onWeb,githubRepo,missing-method}

\title{ Methods for Function \code{onWeb} in Package \pkg{rGithubClient} }

\description{
  \code{onWeb} allows users to quickly and easily view github repositories (or specific files within said repository) through their default web browser
}

\section{Methods}{
  \describe{
    \item{\code{signature(repository = "githubRepo", repositoryPath = "character")}}{
      \describe{
        \item{\code{repository}}{
          object of class \code{githubRepo}, usually created by a call to \code{getRepo} and \code{downloadRepo}
        }
        \item{\code{repositoryPath}}{
          optional argument specifying a specific file within the repository to view (must be contained in \code{repository@tree$path})
        }
      }      
    }
  }
}

\section{Value}{
  directs user to their default web browser and invisibly returns web url internally
}

\seealso{
  \code{\link{getRepo-methods}}, \code{\link{downloadRepoBlob-methods}}, \code{\link{downloadRepo-methods}}, \code{\link{installRepo-methods}}, \code{\link{githubRepo-class}}
}

\keyword{methods}
