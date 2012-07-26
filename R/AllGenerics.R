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
  name = ".getRepoInfo",
  def = function(uri){
    standardGeneric(".getRepoInfo")
  }
)

setGeneric(
  name = ".getRepoRef",
  def = function(refInfoList){
    standardGeneric(".getRepoRef")
  }
)

setGeneric(
  name = ".getRepoRefInfo",
  def = function(repo, refType, refName){
    standardGeneric(".getRepoRefInfo")
  }
)

setGeneric(
  name = ".getRepoRefTreeInfo",
  def = function(refInfoList){
    standardGeneric(".getRepoRefTreeInfo")
  }
)

setGeneric(
  name = ".getRepoRefTree",
  def = function(refTree){
    standardGeneric(".getRepoRefTree")
  }
)

setGeneric(
  name = ".getRepoRefFiles",
  def = function(treeList, outputPath){
    standardGeneric(".getRepoRefFiles")
  }
)

