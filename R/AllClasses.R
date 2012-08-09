## GENERIC CLASS DEFINITIONS
##
## AUTHOR: BRIAN M. BOT
#####

setClass(
  Class = "githubRepo",
  
  representation = representation(
    owner = "character",
    repo = "character",
    refType = "character",
    refName = "character",
    commit = "character",
    localPath = "character",
    tree = "list"),
  prototype = prototype(
    refType = "heads",
    refName = "master")
)

