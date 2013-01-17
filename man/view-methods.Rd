\name{view-methods}
\docType{methods}
\alias{view}
\alias{view-methods}
\alias{view,githubRepo,character-method}
\alias{view,githubRepo,missing-method}

\title{ Methods for Function \code{view} in Package \pkg{rGithubClient} }

\description{
  \code{view} allows users to quickly and easily view github repositories (or specific files within said repository) through the default web browser
}

\section{Methods}{
  \describe{
    
    \item{\code{signature(repository = "character", repositoryPath = "character", ...)}}{
      \describe{
        \item{\code{repository, ...}}{
          name of repository, in the form of /owner/repo, which is passed to \code{getRepo} along with optional arguments \code{ref} and \code{refName} - resulting \code{githubRepo} object is passed along with repositoryPath back to \code{view} method below.
        }
      }
    }
    
    \item{\code{signature(repository = "githubRepo", repositoryPath = "character",)}}{
      \describe{
        \item{\code{repository}}{
          timepoint of repository specified by an object of class \code{githubRepo}
        }
        \item{\code{repositoryPath}}{
          optional argument specifying a specific file within the repository to view (must be contained in \code{repository@tree$path})
        }
      }      
    }
  }
}

\section{Value}{
  directs user to the default web browser and invisibly returns web url internally
}

\seealso{
  \code{\link{getPermlink}}, \code{\link{getRepo}}, \code{\link{githubRepo}}, \code{\link{sourceRepoFile}}
}

\keyword{methods}
