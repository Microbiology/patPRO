\name{patientMean}
\alias{patientMean}
\title{
Calculate Mean Patient Values.
}
\description{
This function is used to create a data frame of the mean microbiome values from data 
frames for the top taxonomic relative abundance, normalized alpha diversity, and 
bacterial load. The resulting data frame is easy to use in downstream plotting 
applications. The means are calculated for each sampling time point.
}
\usage{
patientMean(x, 
	sub.range, 
	subject.id.col="SubjectID", 
	tmpt.id.col="Time_point", 
	metric.col="Bacteria", 
	abundance.val="Abundance")
}

\arguments{
  \item{x}{
The desired \code{\link{data.frame}} (top taxonomy, alpha diversity, or bacterial load) containing the values with which the means will be calculated.
}
  \item{sub.range}{
The numeric range of subject IDs for which the mean values are to be calcualted.
}
  \item{subject.id.col}{
The Sunject ID column name from data frame x. Default is "SubjectID".
}
  \item{tmpt.id.col}{
The time point ID column name from data frame x. Default is "Time_point".
}
  \item{metric.col}{
The metric ID column name from data frame x. This column includes the taxonomic IDs or alpha diversity metric categories. Default is "Bacteria".
}
  \item{abundance.val}{
The abundance column name from data frame x. This column includes the values which will be used to calcualte means across the categories and time points. Default is "Abundance".
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
# Relative Abundance Mean
data("PatProOTU",package="patPRO")
data("PatProMap",package="patPRO")
transTestRelAbund <- transposeRelAbund(PatProOTU)
mergedMapTransRA <- mergeMapMetaData(map.file=PatProMap, 
  merging.file=transTestRelAbund, 
  map.sub.id="SubjectID", 
  map.tmpt="Time_point", 
  map.smpl.id="SampleID", 
  sample.id.col="SampleID")
top5RelAbund <- topRelAbundDataFrame(x=mergedMapTransRA, top.taxa.num=5)
topTaxaMean <- patientMean(x=top5RelAbund, 
  sub.range=c(1:5), 
  metric.col="Bacteria")
# Alpha Diversity Mean
data("PatProAlphaDiv",package="patPRO")
data("PatProMap",package="patPRO")
mergedMapAlpha <- mergeMapMetaData(map.file=PatProMap, 
  merging.file=PatProAlphaDiv, 
  map.sub.id="SubjectID", 
  map.tmpt="Time_point", 
  map.smpl.id="SampleID", 
  sample.id.col="SampleID")
testNormAlphaDivForMean <- normalizeAlphaDiv(mergedMapAlpha, c("chao1","shannon"), 1:5)
AlphaDivMean <- patientMean(x=testNormAlphaDivForMean, 
  sub.range=c(1:5), 
  metric.col="variable", 
  abundance.val="value")
# Bacterial Load Mean
data("PatProBacLoad",package="patPRO")
data("PatProMap",package="patPRO")
mergedMapBacLoad <- mergeMapMetaData(map.file=PatProMap, 
  merging.file=PatProBacLoad, 
  map.sub.id="SubjectID", 
  map.tmpt="Time_point", 
  map.smpl.id="SampleID", 
  sample.id.col="SampleID")
BacMean <- patientMean(x=mergedMapBacLoad, 
  sub.range=c(1:5), 
  metric.col="", 
  abundance.val="Num_Bacteria")
}
