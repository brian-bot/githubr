## GENERIC METHOD DEFINITIONS
##
## AUTHOR: BRIAN M. BOT
#####

setGeneric(
  name = "getRepo",
  def = function(uri, owner, repo){
    standardGeneric("getRepo")
  }
)

setGeneric(
  name = ".getRepoInfo",
  def = function(uri){
    standardGeneric(".getRepoInfo")
  }
)

setGeneric(
  name = "getRepoFiles",
  def = function(repo, type, name){
    standardGeneric("getRepoFiles")
  }
)
