\name{downloadRepo-methods}
\docType{methods}
\alias{downloadRepo}
\alias{downloadRepo-methods}
\alias{downloadRepo,character-method}
\alias{downloadRepo,githubRepo-method}

\title{ Methods for Function \code{downloadRepo} in Package \pkg{rGithubClient} }

\description{
  \code{downloadRepo} takes an object of class \code{githubRepo} and downloads the tree that is associated with a specific timepoint of that repository
}

\section{Methods}{
  \describe{
    \item{\code{signature(repository = "githubRepo", ...)}}{
      \describe{
        \item{\code{repository}}{
          object of class \code{githubRepo}, usually created by a call to \code{getRepo}
        }
        \item{\code{...}}{}
        \item{\code{localPath}}{
          local path for repository file tree to be downloaded to if not already specified within \code{repository} -- defaults to a temporary directory if not specified
        }
      }      
    }
    \item{\code{signature(repository = "character", ...)}}{
      \describe{
        \item{\code{repository}}{
          character string specifying the repository to passed to \code{getRepo} to generate object of class \code{githubRepo}
        }
        \item{\code{...}}{}
        \item{\code{type, typeName}}{
          optional arguments passed along to \code{getRepo} if class of repository is character and of the form "/owner/repo""
        }
        \item{\code{localPath}}{
          local path for repository file tree to be downloaded to if not already specified within \code{repository} -- defaults to a temporary directory if not specified
        }
      }
    }
  }
}

\section{Value}{
  return value is of class \code{githubRepo}
}

\seealso{
  \code{\link{getRepo-methods}}, \code{\link{installRepo-methods}}, \code{\link{githubRepo-class}}
}

\keyword{methods}
