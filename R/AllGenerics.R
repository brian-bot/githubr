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
  def = function(repository, repositoryPath, ...){
    standardGeneric("sourceRepoFile")
  }
)

setGeneric(
  name = "view",
  def = function(repository, repositoryPath, ...){
    standardGeneric("view")
  }
)

