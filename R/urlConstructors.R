## CONSTRUCTOR FUNCTIONS
#####

.constructBlobURL <- function(repository, shas){
  url <- paste("https://api.github.com/repos", repository@user, repository@repo, "git/blobs", shas, sep="/")
  return(url)
}

.constructRepoRefURL <- function(repository, type){
  url <-paste("https://api.github.com/repos", repository@user, repository@repo, "git/refs", type, repository@refName, sep="/")
  return(url)
}

.constructCommitURL <- function(repository){
  url <-paste("https://api.github.com/repos", repository@user, repository@repo, "git/commits", repository@commit, sep="/")
  return(url)
}

.constructWebURL <- function(repository, repositoryPath=NA){
  if( is.na(repositoryPath) ){
    url <-paste("https://github.com", repository@user, repository@repo, "tree", repository@commit, sep="/")
    return(url)
  } else{
    url <- paste("https://github.com", repository@user, repository@repo, "blob", repository@commit, repositoryPath, sep="/")
    return(url)
  }
}
