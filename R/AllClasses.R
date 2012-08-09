## GENERIC CLASS DEFINITIONS
##
## AUTHOR: BRIAN M. BOT
#####

setClass(
  Class = "githubRepo",
  
  representation = representation(
    owner = "character",
    repo = "character",
    commit = "character",
    outputPath = "character",
    tree = "list"),
  
  prototype = prototype(
    outputPath = "NA")
)

