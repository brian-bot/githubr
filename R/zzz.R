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
  
  ## SET THE USER-AGENT FOR THIS VERSION OF THE CLIENT
  .setGithubCache("userAgent", paste("rGithubClient", packageDescription("rGithubClient", fields="Version"), sep="/"))
  
}

.onUnload <- function(libpath) .Last.lib()

