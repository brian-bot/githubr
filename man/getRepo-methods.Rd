\name{getRepo-methods}
\docType{methods}
\alias{getRepo}
\alias{getRepo-methods}
\alias{getRepo,character-method}

\title{ Methods for Function \code{getRepo} in Package \pkg{rGithubClient} }

\description{
  
}

\section{Methods}{
  \describe{
    \item{\code{signature(repository = "character", ...)}}{
      \describe{
        \item{\code{repository}}{
          name of repository, in the form of /owner/repo
        }
        \item{\code{...}}{}
        \item{\code{type} = "branch"}{
          one of "branch", "tag", or "commit" -- typeName must be specified along with type
        }
        \item{\code{typeName} = "master"}{
          specified along with \code{type}: name of the branch, tag, or the sha of the requested commit
        }
      }
    }
  }
}

\section{Value}{
  return value is of class \code{githubRepo}
}

\keyword{methods}
