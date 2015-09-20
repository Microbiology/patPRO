\name{topRelAbundDataFrame}
\alias{topRelAbundDataFrame}
\title{
Format Top Taxa Data Frame for Graphing.
}
\description{
Prepare the data frame for graphing of the relative abundances of the defined top taxa 
using the transposed output (originally from Qiime) using 'transposeRelAbund'.
}

\usage{
topRelAbundDataFrame(x, 
	top.taxa.num, 
	subject.id.col="SubjectID", 
	sample.id.col="SampleID", 
	tmpt.id.col="Time_point")
}

\arguments{
  \item{x}{
The transposed relative abundance \code{\link{data.frame}} to be used for graphing of microbial relative abundances.
}
  \item{top.taxa.num}{
The number of top taxa requested.
}
  \item{subject.id.col}{
Name of the subject ID column found in x. Default is "SubjectID".
}
  \item{sample.id.col}{
Name of the sample ID column found in x. Default is "SampleID".
}
 \item{tmpt.id.col}{
Name of the time point column found in x. Default is "Time_point".
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
data("PatProMap",package="patPRO")
transTestRelAbund <- transposeRelAbund(PatProOTU)
mergedMapTransRA <- mergeMapMetaData(map.file=PatProMap, 
	merging.file=transTestRelAbund, 
	map.sub.id="SubjectID", 
	map.tmpt="Time_point", 
	map.smpl.id="SampleID", 
	sample.id.col="SampleID")
top5_rel_abund <- topRelAbundDataFrame(x=mergedMapTransRA, top.taxa.num=5)
}
