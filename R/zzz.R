## Startup functions and global constants
###############################################################################

kCertBundle <- "certificateBundle/cacert.pem"

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
  .setGithubCache("httpheader", character())
  .setGithubCache("Accept", "application/json")
  .setGithubCache("User-Agent", .userAgent())
  .setGithubCache("low.speed.time", 60)
  .setGithubCache("low.speed.limit", 1)
  .setGithubCache("connecttimeout", 300)
  .setGithubCache("followlocation", TRUE)
  .setGithubCache("ssl.verifypeer", TRUE)
  .setGithubCache("verbose", FALSE)
  .setGithubCache("cainfo", file.path(libname, pkgname, kCertBundle))
}

.onUnload <- function(libpath) .Last.lib()

.userAgent <- function(){
  return(paste("rGithubClient", packageDescription("rGithubClient", fields="Version"), sep="/"))
}
