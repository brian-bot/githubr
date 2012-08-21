\name{getRepo-methods}
\docType{methods}
\alias{getRepo}
\alias{getRepo-methods}
\alias{getRepo,character-method}

\title{ Methods for Function \code{getRepo} in Package \pkg{rGithubClient} }

\description{
  \describe{
    \code{getRepo} talks to the github API to retrieve information about a specified repository at a specific point in time (commit). There are three separate ways to convey the github commit:
    \item{(1) \code{type = "branch"}}{
      Must specify \code{typeName} to be the name of the branch that info is to be pulled from. \code{getRepo} will find the commit that the \code{type} and \code{typeName} refer to.
    }
    \item{(2) \code{type = "tag"}}{
      Must specify \code{typeName} to be the name of the tag that info is to be pulled from. \code{getRepo} will find the commit that the \code{type} and \code{typeName} refer to.
    }
    \item{(3) \code{type = "commit"}}{
      Must specify \code{typeName} to be the sha of the commit that info is to be pulled from.
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
        \item{\code{type = "branch"}}{
          one of "branch", "tag", or "commit" -- typeName must be specified along with type
        }
        \item{\code{typeName = "master"}}{
          specified along with \code{type}: name of the branch, tag, or the sha of the requested commit
        }
      }
    }
  }
}

\section{Value}{
  return value is of class \code{githubRepo}
}

\seealso{
  \code{\link{downloadRepo-methods}}, \code{\link{githubRepo-class}}
}

\keyword{methods}
