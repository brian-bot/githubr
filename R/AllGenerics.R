## GENERIC METHOD DEFINITIONS
##
## AUTHOR: BRIAN M. BOT
#####

setGeneric(
  name = ".getRepoInfo",
  def = function(uri, owner, repo){
    standardGeneric(".getRepoInfo")
  }
)

setGeneric(
  name = ".getRepoInfoWorker",
  def = function(uri){
    standardGeneric(".getRepoInfoWorker")
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
  def = function(repo, type, name){
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
  def = function(treeList, repoPath){
    standardGeneric(".getRepoRefFiles")
  }
)

