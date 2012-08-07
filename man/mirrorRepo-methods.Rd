\name{mirrorRepo-methods}
\docType{methods}
\alias{mirrorRepo}
\alias{mirrorRepo-methods}
\alias{mirrorRepo,character,character-method}
\title{Methods for Function \code{mirrorRepo} in Package \pkg{rGithubClient}}
\description{
  Methods for function \code{mirrorRepo} in package \pkg{rGithubClient}
}
\section{Methods}{
  \describe{
    \item{\code{signature(owner = "character", repo = "character", ...)}}{}
    \item{\code{owner}}{
      name of the owner of the github repository to be mirrored (uri will be constructed by combination of owner and repo)
    }
    \item{\code{repo}}{
      name of the github repository to be mirrored (uri will be constructed by combination of owner and repo)
    }
    \item{\code{...}}{}
    \item{\code{refType} = "heads"}{
      reference type to be pulled from the repository - default is "heads" which will pull the head of the specified refName - the other valid value currently is "tags"
    }
    \item{\code{refName} = "master"}{
      reference name to be pulled from the repository - default is "master" which will pull from the master branch - if refType = "tags", this will be the name of the tag to mirror
    }
    \item{\code{outputDir}}{
      output directory in which to store the files from the mirrored repository - default is a temporary directory which will be deleted once R session is terminated
    }
  }
}

\section{Value}{
  \describe{
    return value is a character vector of file locations for mirrored repository
  }
}

\section{Examples}{
  \describe{
    # USING DEFAULT VALUES
    
    repo1 <- mirrorRepo("brian-bot", "rGithubClient")
    
    
    # USING A TAGGED VERSION
    
    repo2 <- mirrorRepo("brian-bot", "rGithubClient", refType="tags", refName="rGithubClient-alpha-0.0.1")
    
    
    # PULLING THE HEAD OF dev BRANCH
    
    repo3 <- mirrorRepo("brian-bot", "rGithubClient", refName="dev")
    
    
    # ERROR RETURNED FOR AN INVALID REPO
    
    repo4 <- mirrorRepo("brian-bot", "not-a-repo")
  }
}

\keyword{methods}
