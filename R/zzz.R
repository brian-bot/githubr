## Startup functions and global constants
###############################################################################

.onLoad <- function(libname, pkgname){
  
  ## install cleanup hooks upon shutdown
  reg.finalizer(topenv(parent.frame()),
                function(...) .Last.lib(),
                onexit=TRUE)
  reg.finalizer(getNamespace("rGithubClient"),
                function(...) .Last.lib(),
                onexit=TRUE)
  
  ## SET GITHUB CACHE AND START OPTIONS
  .setGithubCache("opts", list())
  .setGithubCache("User-Agent", .userAgent())
}

.onUnload <- function(libpath) .Last.lib()

.userAgent <- function(){
  return(paste("rGithubClient", packageDescription("rGithubClient", fields="Version"), sep="/"))
}