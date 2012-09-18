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
  name = "sourceRepoFile",
  def = function(repository, repositoryPath){
    standardGeneric("sourceRepoFile")
  }
)

setGeneric(
  name = "view",
  def = function(repository, repositoryPath){
    standardGeneric("view")
  }
)

setGeneric(
  name = ".getURLjson",
  def = function(url, ...){
    standardGeneric(".getURLjson")
  }
)

setGeneric(
  name = ".getCommitTree",
  def = function(myRepo){
    standardGeneric(".getCommitTree")
  }
)
