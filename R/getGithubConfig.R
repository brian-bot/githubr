## PULL GLOBAL AUTHORIZATION ON A USERS MACHINE IF AVAILABLE
## AUTHOR: BRIAN M. BOT
#####

.getGithubConfig <- function(){
  configFile <- file.path(Sys.getenv("HOME"), ".gitconfig")
  
  if( !file.exists(configFile) ){
    return(NULL)
  } else{
    parseFile <- readLines(configFile)
    
    ## CHECK TO SEE IF THERE IS A GITHUB ENTRY - IF NOT RETURN NULL
    if( !any(parseFile == "[github]") ){
      return(NULL)
    } else{
      githubStart <- which(parseFile == "[github]") + 1
      idx <- which(substr(parseFile,1,1) == "[")
      
      if( any(idx > githubStart) ){
        githubEnd <- idx[ idx >= githubStart ][1] - 1
      } else{
        githubEnd <- length(parseFile)
      }
      keyVal <- strsplit(parseFile[ githubStart:githubEnd ], " = ", fixed=T)
      keys <- sapply(keyVal, "[[", 1)
      vals <- sapply(keyVal, "[[", 2)
      
      keys <- sub("\t", "", keys, fixed=T)
      outList <- list()
      for( i in 1:length(keyVal) )
        outList[[keys[i]]] <- vals[i]
      
      return(outList)
    }
  }
}


