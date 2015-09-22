# buildDocs package available from github.com/hafen
library(buildDocs)

# Set the working directory to the package
setwd("~/github/introR/docs")

buildDocs(
   docsLoc = ".",
   outLoc = "../",
   copyrightText = "Battelle Memorial Institute",
   editHref = "https://github.com/lhsego/introR",
   knit = TRUE
)          
