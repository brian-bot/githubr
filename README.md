## rGithubClient
### a convenience package to talk to github through the R programming language

purpose is to allow users to:
* use github as a version control system for analysis code instead of enterprise software development
* store code centrally for sourcing into an analysis environment
* allow easy sharing and forking of code that may be useful for others

current status
* only deal with publicly available repos (no OAuth)
* get away from downloading files and move towards sourcing in files

current issue / most likely thing to change
* how best to 'source' in files via sourceRepoFile - into new environment - into global environment - etc.
