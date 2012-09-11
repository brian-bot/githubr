\name{installRepo-methods}
\docType{methods}
\alias{installRepo}
\alias{installRepo-methods}
\alias{installRepo,character-method}
\alias{installRepo,githubRepo-method}
\title{ Methods for Function \code{installRepo} in Package \pkg{rGithubClient} }

\description{
  \code{installRepo} takes an object of class \code{githubRepo} and tries to install the repository as an R package (uses \code{install} function from Hadley Wickham's \code{devtools} package)
}

\section{Methods}{
  \describe{
    \item{\code{signature(repository = "githubRepo")}}{
      \describe{
        \item{\code{repository}}{
          object of class \code{githubRepo}, usually created by a call to \code{getRepo} and \code{downloadRepo}
        }
      }      
    }
    \item{\code{signature(repository = "character", ...)}}{
      \describe{
        \item{\code{repository}}{
          character string specifying the repository to passed to \code{getRepo} to generate object of class \code{githubRepo}
        }
        \item{\code{...}}{}
        \item{\code{ref, refName}}{
          optional arguments passed along to \code{getRepo} if class of repository is character and of the form "/owner/repo""
        }
        \item{\code{localPath}}{
          local path for repository file tree to be downloaded to when passed to \code{downloadRepo} -- defaults to a temporary directory
        }
      }
    }
  }
}

\section{Value}{
  return value is of class \code{githubRepo} if repository is successfullly installed
}

\seealso{
  \code{\link{getRepo-methods}}, \code{\link{downloadRepo-methods}}, \code{\link{githubRepo-class}}
}

\keyword{methods}
