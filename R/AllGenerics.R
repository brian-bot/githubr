## GENERIC METHOD DEFINITIONS
##
## AUTHOR: BRIAN M. BOT
#####

setGeneric(
  name = "getRepo",
  def = function(repository, ...){
    standardGeneric("getRepo")
  }
)

setGeneric(
  name = "downloadRepo",
  def = function(repository, ...){
    standardGeneric("downloadRepo")
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

