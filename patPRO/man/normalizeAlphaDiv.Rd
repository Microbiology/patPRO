\name{normalizeAlphaDiv}
\alias{normalizeAlphaDiv}
\title{
Normalize Alpha Diversity Values for Plotting.
}
\description{
This function normalizes the alpha diversity values of a single patient's time course
to the initial time point. The initial time point is used as 100 percent. This allows
for plotting of multiple alpha diversity metrics on a single plot, despite differences
in value magnitude.
}

\usage{
normalizeAlphaDiv(alpha.div.input,
	alpha.div.metric,
	subject.id.range,
	subject.id.col="SubjectID",
	tmpt.id.col="Time_point")
}

\arguments{
  \item{alpha.div.input}{
The \code{\link{data.frame}} from Qiime containing the alpha diversity information for the dataset. This should also include subject ID and time point information.
}
  \item{alpha.div.metric}{
The name(s) of the columns containing the alpha diversity metric information to be used for normalization.
}
  \item{subject.id.range}{

}
  \item{subject.id.col}{
Name of the subject ID column found in alpha.div.input. Default is "SubjectID".
}
 \item{tmpt.id.col}{
Name of the time point column found in alpha.div.input. Default is "Time_point".
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
data("PatProAlphaDiv",package="patPRO")
data("PatProMap",package="patPRO")
mergedMapAlpha <- mergeMapMetaData(map.file=PatProMap, 
	merging.file=PatProAlphaDiv, 
	map.sub.id="SubjectID", 
	map.tmpt="Time_point", 
	map.smpl.id="SampleID", 
	sample.id.col="SampleID")
testNormAlphaDiv <- normalizeAlphaDiv(mergedMapAlpha, c("chao1","shannon"), 1)
}
