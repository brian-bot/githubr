## rGithubClient
### a convenience package to talk to github through the R programming language

-----

purpose is to allow users to:
* use github as a version control system for analysis code in addition enterprise software development
* store code centrally for sourcing into an analysis environment
* allow easy sharing and forking of code that may be useful for others

current status:
* primative OAuth available via the `setGithubAuth()` function if user provides username and password
* currently staying away from downloading files -- sticking with meta-information and ability to directly source in files
* `sourceRepoFile` sources code into the global environment, but allows users to pass optional arguments as specified in the `base::source()` function
