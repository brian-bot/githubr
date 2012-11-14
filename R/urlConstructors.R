## CONSTRUCTOR FUNCTIONS
#####

.constructBlobURL <- function(repository, shas){
  paste("https://api.github.com/repos", repository@user, repository@repo, "git/blobs", shas, sep="/")
}

.constructRepoRefURL <- function(repository, type){
  paste("https://api.github.com/repos", repository@user, repository@repo, "git/refs", type, repository@refName, sep="/")
}

.constructCommitURL <- function(repository){
  paste("https://api.github.com/repos", repository@user, repository@repo, "git/commits", repository@commit, sep="/")
}
