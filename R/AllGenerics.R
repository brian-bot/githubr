## GENERIC METHOD DEFINITIONS
##
## AUTHOR: BRIAN M. BOT
#####

setGeneric(
  name = "mirrorRepo",
  def = function(owner, repo, ...){
    standardGeneric("mirrorRepo")
  }
)

setGeneric(
  name = ".getGitURL",
  def = function(url, ...){
    standardGeneric(".getGitURL")
  }
)

setGeneric(
  name = ".getCommit",
  def = function(myRepo){
    standardGeneric(".getCommit")
  }
)

setGeneric(
  name = ".getCommitTree",
  def = function(myRepo){
    standardGeneric(".getCommitTree")
  }
)

