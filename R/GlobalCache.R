## GETTING AND SETTING CACHES

.getCache <- function(key){
  cache <- new("GlobalCache")
  cache@env[[key]]
}

## package-local 'setter'
.setCache <-function(key, value){
  cache <- new("GlobalCache")
  cache@env[[key]] <- value
}

# as.environment.GlobalCache <- function(x){
#   x@env
# }
# 
# objects.GlobalCache <- function(name, all.names = FALSE, pattern=NULL){
#   objects(envir = as.environment(name), all.names, pattern)
# }
