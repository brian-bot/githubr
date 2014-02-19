\name{githubRestGET}
\alias{githubRestGET}

\title{
  Interface for accessing GitHub REST API
}

\description{
  This function allows users to access (GET) content from the GitHub API in a flexible way. The \code{rGithubClient} package provides convenience methods to access certain types of content - this function is provided to allow users to access any other API that they choose.
}

\usage{
  githubRestGET(uri, endpoint = .getGithubCache("githubEndpoint"), .opts = .getGithubCache("opts"), httpheader = .getGithubCache("httpheader"), ...)
}

\arguments{
  \item{uri}{ uri of the API request, e.g. "/repos/brian-bot/rGithubClient" }
  \item{endpoint}{ endpoint to access uri from, e.g. "https://api.github.com/" }
  \item{.opts}{ additional options to be passed on to getURL }
  \item{httpheader}{ httpheader to be passed onto getURL }
  \item{\dots}{ other named parameters to be passed onto getURL }
}

\details{
  Defaults to recieving content in JSON format (\code{Accept="application/json"}) which is, in turn, converted into a list via the \code{RJSONIO} function \code{fromJSON}. If authorization is set via \code{setGithubAuth}, the token specific to the rGithubClient is used for subsequent calls to the API via this function.
}

\value{
  Typically a list which is the content returned from the GitHub API and converted via fromJSON.
}

\seealso{
  \code{\link{getPermlink}}, \code{\link{githubRepo}}, \code{\link{getRepo}}, \code{\link{sourceRepoFile}}, \code{\link{view}}
}
