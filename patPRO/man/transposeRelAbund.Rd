\name{transposeRelAbund}
\alias{transposeRelAbund}
\title{
Transpose a Data Frame.
}
\description{
This function will transpose a data frame, with the result maintained as a data frame 
(unlike other functions which work with matrices).  Although this was written with 
relative abundance tables in mind, it may be applied to other data frame types.
}
\usage{
transposeRelAbund(x, 
	sample.id.col="SampleID")
}

\arguments{
  \item{x}{
The relative abundance \code{\link{data.frame}} (or other type of \code{\link{data.frame}}) to be transposed.
}
  \item{sample.id.col}{
The Sample ID column name from data frame x. Default is "SampleID".
}
}

\details{
\tabular{ll}{
Package: \tab patPRO\cr
Type: \tab Package\cr
Version: \tab 1.0.0\cr
Date: \tab 2015-09-18\cr
License: \tab GPLv3\cr
}
An overview of how to use the package, including the most important functions, is included in the supplemental R notebook patPROExampleWorkflow.html.
}
\author{
Geoffrey Hannigan <ghanni@upenn.edu>, Loesche MA, Hodkinson BP, Mehta S, Elizabeth Grice <egrice@upenn.edu>
}
\references{
patPRO: An R package for the visualization of longitudinal microbiome data. Hannigan GD, Loesche MA, Hodkinson BP, Mehta S, Grice EA.
}
\keyword{ package }

\examples{
data("PatProOTU",package="patPRO")
transTestRelAbund <- transposeRelAbund(PatProOTU)
}
