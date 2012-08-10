\name{downloadRepo-methods}
\docType{methods}
\alias{downloadRepo}
\alias{downloadRepo-methods}
\alias{downloadRepo,character-method}
\alias{downloadRepo,githubRepo-method}

\title{ Methods for Function \code{downloadRepo} in Package \pkg{rGithubClient} }

\description{
  
}

\section{Methods}{
  \describe{
    \item{\code{signature(repository = "githubRepo", ...)}}{}
    \item{\code{signature(repository = "character", ...)}}{
      \describe{
        \item{\code{repository}}{
          object of class \code{githubRepo}, usually created by a call to \code{getRepo} -- or character vector specifying the repository to passed to \code{getRepo} which is then downloaded via \code{downloadRep(repository = "githubRepo", ...)}
        }
        \item{\code{...}}{}
        \item{\code{outputPath}}{
          local path for repository file tree to be downloaded to
        }
        \item{\code{type, typeName}}{
          optional arguments passed along to \code{getRepo} if class of repository is character and of the form /owner/repo
        }
      }
    }
  }
}

\section{Value}{
  return value is of class \code{githubRepo}
}
\keyword{methods}
