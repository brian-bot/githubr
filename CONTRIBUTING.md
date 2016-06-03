## Welcome!
Thanks for visiting the GitHub repo for `githubr`. Please feel free to use, re-use, and/or contribute to the package!

### How to report a bug or suggest an improvement
Any and all issues can be logged using the [issue tracker associated with this repository](https://github.com/brian-bot/githubr/issues). Don't worry about tagging the issue with labels or assigning it to anyone - the maintainer of the package will take care of that.

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
The `testthat` package is used for developing tests. A test file lives in tests/testthat/. Its name must start with test and follows [these guidelines](http://r-pkgs.had.co.nz/tests.html).

All of the tests will be run as part of `R CMD check`, or can be run interactively using `devtools::test()`.

For integration tests which require a GitHub token for authentication, include the function `checkGithubToken()` at the beginnings of each `test_that()` call. This will skip these tests if no token has been provided.

### Thank you section!
Many people have provided invaluable feedback in the development of githubr - can't wait to add more! Here is a rolling list:
- Erich Huang (@erichhuang)
- Bruce Hoff (@brucehoff)
- Madeleine Bonsma (@mbonsma)
- Benjamin Logsdon (@blogsdon)
- Kenneth Daily (@kdaily)
