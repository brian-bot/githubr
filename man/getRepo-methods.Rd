\name{getRepo-methods}
\docType{methods}
\alias{getRepo}
\alias{getRepo-methods}
\alias{getRepo,character-method}

\title{ Methods for Function \code{getRepo} in Package \pkg{rGithubClient} }

\description{
  \describe{
    \code{getRepo} talks to the github API to retrieve information about a specified repository at a specific point in time (commit). There are three separate ways to convey the github commit:
    \item{(1) \code{ref = "branch"}}{
      Must specify \code{refName} to be the name of the branch that info is to be pulled from. \code{getRepo} will find the commit that the \code{ref} and \code{refName} refer to.
    }
    \item{(2) \code{ref = "tag"}}{
      Must specify \code{refName} to be the name of the tag that info is to be pulled from. \code{getRepo} will find the commit that the \code{ref} and \code{refName} refer to.
    }
    \item{(3) \code{ref = "commit"}}{
      Must specify \code{refName} to be the sha of the commit that info is to be pulled from.
    }
  }
}

\section{Methods}{
  \describe{
    \item{\code{signature(repository = "character", ...)}}{
      \describe{
        \item{\code{repository}}{
          name of repository, in the form of /owner/repo
        }
        \item{\code{...}}{}
        \item{\code{ref = "branch"}}{
          one of "branch", "tag", or "commit" -- refName must be specified along with ref
        }
        \item{\code{refName = "master"}}{
          specified along with \code{ref}: name of the branch, tag, or the sha of the requested commit
        }
      }
    }
  }
}

\section{Value}{
  return value is of class \code{githubRepo}
}

\seealso{
  \code{\link{downloadRepo-methods}}, \code{\link{installRepo-methods}}, \code{\link{githubRepo-class}}
}

\keyword{methods}
