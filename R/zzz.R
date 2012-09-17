## Startup functions and global constants
###############################################################################

kSynapseRAnnotationTypeMap <- list(
  stringAnnotations = "character",
  longAnnotations = "integer",
  doubleAnnotations = "numeric",
  dateAnnotations = "POSIXt"
)


.onLoad <- function(libname, pkgname){
  .setCache("curlOptsGithub", list(low.speed.time=60, low.speed.limit=1, connecttimeout=300, followlocation=TRUE, ssl.verifypeer=TRUE, verbose = FALSE))
  .setCache("curlOptsGithubRaw", list(httpHeader = c(Accept = "application/vnd.github.raw"), low.speed.time=60, low.speed.limit=1, connecttimeout=300, followlocation=TRUE, ssl.verifypeer=TRUE, verbose = FALSE))
  .setCache("curlHeaderGithub", c(Accept = "application/vnd.github.raw"))
  .setCache("curlWriterGithub", getNativeSymbolInfo("_writer_write", PACKAGE="rGithubClient")$address)
  .setCache("curlReaderGithub", getNativeSymbolInfo("_reader_read", PACKAGE="rGithubClient")$address)
  
  ## install cleanup hooks upon shutdown
  reg.finalizer(topenv(parent.frame()),
                function(...) .Last.lib(),
                onexit=TRUE)
  reg.finalizer(getNamespace("rGithubClient"),
                function(...) .Last.lib(),
                onexit=TRUE)
}

.onUnload <- function(libpath) .Last.lib()


