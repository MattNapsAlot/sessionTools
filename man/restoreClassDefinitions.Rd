\name{restoreClassDefinitions}
\alias{restoreClassDefinitions}
\title{
Restore Session Class Definitions
}
\description{
Restores the class definitions from an R binary file to the specified environment.
}
\usage{
restoreClassDefinitions(file = "session.RData", envir = .GlobalEnv, clean = TRUE, srcEnv)
}
\arguments{
\item{file}{
path to an R binary file
}
\item{envir}{
the environment into which the class definitions should be restored.
}
\item{clean}{
boolean indicating whether the environment should be purged of existing class definitions prior to restoring
}
\item{srcEnv}{
environment from which to restore class definitions. if this argument is provided the "file" arguments is ignored.
}
}

\value{
This method is executed for its side-effects.
}
\author{
Matthew D. Furia \email{matt.furia@sagebase.org}

\url{https://github.com/MattNapsAlot}
}

\examples{
## make some objects
aMatrix <- diag(10)
letters <- c("a", "b", "c")

## save the session
sessionFile <- tempfile(fileext=".rbin")
saveSession(list = ls(), file = sessionFile)

## create an environment where they can be restored
env <- new.env()

## define an S4 class
setClass("foo", where = env)

## restore the objects leaving "goo"
restoreClassDefinitions(file = sessionFile, envir = env, clean = FALSE)
ls(env)

## restore the objects again, this time delete all objects from env first
restoreClassDefinitions(file = sessionFile, envir = env, clean = TRUE)
ls(env)
}
