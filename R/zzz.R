## Startup functions and global constants
###############################################################################

kCertBundle <- "certificateBundle/cacert.pem"

.onLoad <- function(libname, pkgname){
  
  ## SET GITHUB CACHE AND START OPTIONS
  .setGithubCache("opts", list())
  .setGithubCache("githubEndpoint", "https://api.github.com/")
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

.userAgent <- function(){
  return(paste("rGithubClient", packageDescription("rGithubClient", fields="Version"), sep="/"))
}
