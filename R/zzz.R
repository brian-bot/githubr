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
  
  ## LOOK FOR A .gitconfig FILE AND SEE IF CONTAINS GITHUB TOKEN
  checkConfig <- .getGithubConfig()
  if( is.null(checkConfig) ){
    packageStartupMessage("  no github configuration available locally - github API limits 60 calls per hour for unauthorized requests")
  } else{
    for(this in names(checkConfig)){
      .setGithubCache(this, checkConfig[[this]])
    }
    packageStartupMessage("  github configuration file found locally - will use for authentication when appropriate")
  }
}

.onUnload <- function(libpath) .Last.lib()

