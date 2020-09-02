## CONSTRUCTOR FUNCTIONS
#####

.constructBlobURL <- function(repository, shas){
  tt <- sapply(repository@apiResponses$tree$tree, "[[", "type")
  u <- sapply(repository@apiResponses$tree$tree, "[[", "url")
  s <- sapply(repository@apiResponses$tree$tree, "[[", "sha")
  ttype <- tt[ match(shas, s) ]
  if( any(ttype == "submodule") ){
    stop("githubr does not support submodules")
  }
  url <- u[ match(shas, s) ]
  return(url)
}

.constructRepoURI <- function(repository){
  url <-paste("/repos", repository@user, repository@repo, sep="/")
  return(url)
}

.constructCommitURI <- function(repository){
  url <- paste(sub("{/sha}", "", repository@apiResponses$repo$git_commits_url, fixed=T), repository@commit, sep="/")
  return(url)
}

.constructHtmlPermlink <- function(repository, repositoryPath=NA){
  if( is.na(repositoryPath) ){
    permlink <-paste(repository@apiResponses$repo$html_url, "tree", repository@commit, sep="/")
    return(permlink)
  } else{
    permlink <- paste(repository@apiResponses$repo$html_url, "blob", repository@commit, repositoryPath, sep="/")
    return(permlink)
  }
}

.constructRawPermlink <- function(repository, repositoryPath){
  permlink <- paste("https://raw.github.com", repository@user, repository@repo, repository@commit, repositoryPath, sep="/")
  return(permlink)
}

