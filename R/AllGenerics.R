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

