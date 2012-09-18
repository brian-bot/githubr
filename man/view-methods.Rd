\name{view-methods}
\docType{methods}
\alias{view}
\alias{view-methods}
\alias{view,githubRepo,character-method}
\alias{view,githubRepo,missing-method}

\title{ Methods for Function \code{view} in Package \pkg{rGithubClient} }

\description{
  \code{view} allows users to quickly and easily view github repositories (or specific files within said repository) through their default web browser
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
  \code{\link{getRepo-methods}}, \code{\link{githubRepo-class}}
}

\keyword{methods}
