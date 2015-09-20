\name{topAbsAbundDataFrame}
\alias{topAbsAbundDataFrame}
\title{
Format and Normalize Top Taxa and Bac Load for Plotting.
}
\description{
Calcualte the top taxa relative abundance normalized to the overall bacterial load. 
Prepare the data frame for graphing.
}

\usage{
topAbsAbundDataFrame(rel.abund, 
	bac.load, 
	bac.load.id="bac_load", 
	abund.id.col="Abundance", 
	subject.id.col="SubjectID", 
	tmpt.id.col="Time_point", 
	bacteria.id.col="Bacteria")
}

\arguments{
  \item{rel.abund}{
The transposed relative abundance \code{\link{data.frame}} to be used for graphing of microbial relative abundances.
}
  \item{bac.load}{
The \code{\link{data.frame}} containing the bacterial load information, as well as the subject IDs and time points associated with those load data points.
}
  \item{bac.load.id}{
Name of the bacterial load value column. Default is "bac_load".
}
  \item{abund.id.col}{
Name of the column containing the relative abundance values for the top taxa relative abundance. Default is "Abundance".
}
  \item{subject.id.col}{
Name of the subject ID column. Default is "SubjectID".
}
 \item{tmpt.id.col}{
Name of the time point column. Default is "Time_point".
}
 \item{bacteria.id.col}{
Name of the column to contain the bacterial load values. Default is "Bacteria".
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
data("PatProBacLoad",package="patPRO")
transTestRelAbund <- transposeRelAbund(PatProOTU)
mergedMapTransRA <- mergeMapMetaData(map.file=PatProMap, 
	merging.file=transTestRelAbund, 
	map.sub.id="SubjectID", 
	map.tmpt="Time_point", 
	map.smpl.id="SampleID", 
	sample.id.col="SampleID")
top5RelAbund <- topRelAbundDataFrame(x=mergedMapTransRA, top.taxa.num=5)
mergedMapBacLoad <- mergeMapMetaData(map.file=PatProMap, 
	merging.file=PatProBacLoad, 
	map.sub.id="SubjectID", 
	map.tmpt="Time_point", 
	map.smpl.id="SampleID", 
	sample.id.col="SampleID")
absAbundOutDf <- topAbsAbundDataFrame(top5RelAbund, mergedMapBacLoad, bac.load.id="Num_Bacteria")
}
