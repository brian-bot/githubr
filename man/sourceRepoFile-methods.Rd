\name{sourceRepoFile-methods}
\docType{methods}
\alias{sourceRepoFile}
\alias{sourceRepoFile-methods}
\alias{sourceRepoFile,character,character-method}
\alias{sourceRepoFile,githubRepo,character-method}

\title{ Methods for Function \code{sourceRepoFile} in Package \pkg{rGithubClient} }

\description{
  \describe{
    \code{sourceRepoFile} takes a file from a github repository and sources the file into a new environment which is returned to the user
  }
}

\section{Methods}{
  \describe{
    \item{\code{signature(repository = "character", repositoryPath = "character", ...)}}{
      \describe{
        \item{\code{repository, ...}}{
          name of repository, in the form of /owner/repo, which is passed to \code{getRepo} along with optional arguments specified in \code{...}
        }
      }
    }
    \item{\code{signature(repository = "githubRepo", repositoryPath = "character")}}{
      \describe{
        \item{\code{repository}}{
          timepoint of repository specified by an object of class \code{githubRepo}
        }
        \item{\code{repositoryPath}}{
          path within the repository of the file to be sourced - must be a valid path in the repository (\code{repository@tree$path})
        }
      }
    }
  }
}

\section{Value}{
  return value is an environment containing the results of the sourced in file (works best for functions)
}

\seealso{
  \code{\link{githubRepo}}, \code{\link{getRepo}}, \code{\link{view}}
}

\keyword{methods}
