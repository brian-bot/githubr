\name{getPermlink-methods}
\docType{methods}
\alias{getPermlink}
\alias{getPermlink-methods}
\alias{getPermlink,githubRepo,character-method}
\alias{getPermlink,githubRepo,missing-method}
\alias{getPermlink,character,ANY-method}

\title{ Methods for Function \code{getPermlink} in Package \pkg{githubr} }

\description{
  \code{getPermlink} allows users to quickly and easily get permlinks relative to a specific point in time for github repositories (or specific files within said repository). User has option of getting either an "html" (default) or "raw" permlink. Currently, these are constructed by the client -- once github moves to a fully hypermedia API (all resources have at least one \code{*_url} property) this will be completely handled by the API and won't need to be constructed client-side.
}

\section{Methods}{
  \describe{
    
    \item{\code{signature(repository = "character", repositoryPath = "ANY", ...)}}{
      \describe{
        \item{\code{repository, ...}}{
          name of repository, in the form of /owner/repo, which is passed to \code{getRepo} along with optional arguments \code{ref} and \code{refName} - resulting \code{githubRepo} object is passed (along with other arguments, if provided) back to \code{getPermlink} method below.
        }
      }
    }
    
    \item{\code{signature(repository = "githubRepo", repositoryPath = "character", ...)}}{
      \describe{
        \item{\code{repository}}{
          timepoint of repository specified by an object of class \code{githubRepo}
        }
        \item{\code{repositoryPath}}{
          optional argument specifying a specific file within the repository to get the permlink (must be contained in \code{repository@tree$path})
        }
        \item{\code{type}}{
          one of "html" (default) or "raw" for the type of permlink to return
        }
      }      
    }
  }
}

\section{Value}{
  github permlink
}

\seealso{
  \code{\link{getRepo}}, \code{\link{githubRepo}}, \code{\link{sourceRepoFile}}, \code{\link{view}}
}

\keyword{methods}
