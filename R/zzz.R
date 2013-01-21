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
}

.onUnload <- function(libpath) .Last.lib()


.userAgent<-function(){
  myOwnVersion<-packageDescription("rGithubClient", fields="Version")
  paste("rGithubClient", myOwnVersion, sep="/")
}
