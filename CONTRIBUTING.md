## Welcome!
Thanks for visiting the GitHub repo for `githubr`. Please feel free to use, re-use, and/or contribute to the package!

### How to report a bug or suggest an improvement
Any and all issues can be logged using the [issue tracker associated with this repository](https://github.com/brian-bot/rGithubClient/issues). Don't worry about tagging the issue with labels or assigning it to anyone - the maintainer of the package will take care of that.

When reporting a bug, please provide as much information as possible, including:
- the code that produced the error
- the error message from the R console
- any information returned by `traceback()`
- the enviroment in which the error occurred (`sessionInfo()` output)

When suggesting an improvement, please provide as much context as to _why_ the improvement is important (e.g. relevant use cases).

### How to make contributions
 1. Make a fork of the repository into your personal GitHub account
 2. Make code changes, following the style guidelines below
 3. Add test coverage for your additions
 4. Update any documentation in the man/ directory
 5. Make sure the package builds and installs successfully
 6. Make sure the test suite passes (instructions below)
 7. Submit a pull request
 8. Do a celebratory dance!
 
![Dance!](http://49.media.tumblr.com/43da2f03dbb1f790d92d4c96578ed797/tumblr_n08mcqTOgW1qm7cjco1_250.gif)

### Style guide
Development for githubr has mostly been done using the [RStudio](https://www.rstudio.com) IDE, which provides a great environment for developing R packages (and editing markdown, like this) - and, while not necessary, I suggest other developers do the same. Some of the stylistic suggestions are defaults in RStudio.

Suggestions:
- indent two spaces (soft tab)
- any exported functions are located in separate file in the R/ directory
- all classes should be definted in `AllClasses.R`
- all generic S4 methods should be specified in `AllGenerics.R`
- re-use building blocks in the package, such as `githubRestGET()`

### How to test the client
The RUnit package is used for developing tests. The testing framework is located [here](R/test_githubr.R) and while the actual tests can be found in the [unitTests directory](inst/unitTests). Additional tests should be added to this directory with the file following this regular expression: `^test_.*\\.R$` and the functions inside those files following this regular expression `^unitTest.+`. 

To run all of the unit tests, build and install the package with any changes you have made:

```r
R CMD BUILD githubr
R CMD INSTALL githubr_<version>.tar.gz
```

and then run the following commands in R:

```r
require(githubr)
setGithubToken("myTokenFromGithub12345678")
githubr:::.unitTests()
```

### Thank you section!
Many people have provided invaluable feedback in the development of githubr - can't wait to add more! Here is a rolling list:
- Erich Huang (@erichhuang)
- Bruce Hoff (@brucehoff)
- Madeleine Bonsma (@mbonsma)
- Benjamin Logsdon (@blogsdon)
- Kenneth Daily (@kdaily)
