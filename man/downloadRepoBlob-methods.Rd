\name{downloadRepoBlob-methods}
\docType{methods}
\alias{downloadRepoBlob}
\alias{downloadRepoBlob-methods}
\alias{downloadRepoBlob,githubRepo,character-method}
\alias{downloadRepoBlob,githubRepo,missing-method}
\alias{downloadRepoBlob,character,ANY-method}

\title{ Methods for Function \code{downloadRepoBlob} in Package \pkg{rGithubClient} }

\description{
  \code{downloadRepoBlob} takes an object of class \code{githubRepo} and a character vector containing a path (or paths) within that repository in order to download the blobs associated with a specific timepoint of that repository
}

\section{Methods}{
  \describe{
    \item{\code{signature(repository = "githubRepo", repositoryPath = "character", ...)}}{
      \describe{
        \item{\code{repository}}{
          object of class \code{githubRepo}, usually created by a call to \code{getRepo}
        }
        \item{\code{repositoryPath}}{
          character vector containing a path (or paths) within \code{repository} of blobs to be downloaded -- defaults to all blobs assiciated with \code{repository} if not specified
        }
        \item{\code{...}}{}
        \item{\code{localPath}}{
          local path for blobs to be downloaded to if not already specified within \code{repository} -- defaults to a temporary directory if not specified
        }
      }      
    }
    \item{\code{signature(repository = "character", repositoryPath = "character", ...)}}{
      \describe{
        \item{\code{repository}}{
          character string specifying the repository to passed to \code{getRepo} to generate object of class \code{githubRepo}
        }
        \item{\code{repositoryPath}}{
          character vector containing a path (or paths) within \code{repository} of blobs to be downloaded -- defaults to all blobs assiciated with \code{repository} if not specified
        }
        \item{\code{...}}{}
        \item{\code{ref, refName}}{
          optional arguments passed along to \code{getRepo} if class of repository is character and of the form "/owner/repo""
        }
        \item{\code{localPath}}{
          local path for blobs to be downloaded to if not already specified within \code{repository} -- defaults to a temporary directory if not specified
        }
      }
    }
  }
}

\section{Value}{
  return value is of class \code{githubRepo}
}

\seealso{
  \code{\link{getRepo-methods}}, \code{\link{downloadRepo-methods}}, \code{\link{installRepo-methods}}, \code{\link{githubRepo-class}}
}

\keyword{methods}
