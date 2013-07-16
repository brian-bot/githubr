## CONSTRUCTOR FUNCTIONS
#####

.constructBlobURI <- function(repository, shas){
  url <- paste("/repos", repository@user, repository@repo, "git/blobs", shas, sep="/")
  return(url)
}

.constructRepoURI <- function(repository){
  url <-paste("/repos", repository@user, repository@repo, sep="/")
  return(url)
}

.constructRepoRefURI <- function(repository, type){
  url <-paste("/repos", repository@user, repository@repo, "git/refs", type, repository@refName, sep="/")
  return(url)
}

.constructCommitURI <- function(repository){
  url <-paste("/repos", repository@user, repository@repo, "git/commits", repository@commit, sep="/")
  return(url)
}

.constructHtmlPermlink <- function(repository, repositoryPath=NA){
  if( is.na(repositoryPath) ){
    permlink <-paste("https://github.com", repository@user, repository@repo, "tree", repository@commit, sep="/")
    return(permlink)
  } else{
    permlink <- paste("https://github.com", repository@user, repository@repo, "blob", repository@commit, repositoryPath, sep="/")
    return(permlink)
  }
}

.constructRawPermlink <- function(repository, repositoryPath){
  permlink <- paste("https://raw.github.com", repository@user, repository@repo, repository@commit, repositoryPath, sep="/")
  return(permlink)
}

