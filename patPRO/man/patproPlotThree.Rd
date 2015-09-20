\name{patproPlotThree}
\alias{patproPlotThree}
\title{
Generate Patient Profile of Three Plots.
}
\description{
Use this function to generate a patient profile containing three figures. The figures 
included are the alpha diversity, bacterial load, and top taxa plots over time. This 
should be used when bacterial load information is available, and the normalized relative
abundance plot is not desired.
}

\usage{
patproPlotThree(alpha.div.plot, 
	bac.load.plot, 
	top.taxa.plot, 
	patpro.plot.title, 
	legend.one.h=0.77, 
	legend.two.h=0.25)
}

\arguments{
  \item{alpha.div.plot}{
The alpha diversity plot to be used in the patient profile.
}
  \item{bac.load.plot}{
The bacterial load plot to be used in the patient profile.
}
  \item{patpro.plot.title}{
The desired plot title.
}
  \item{legend.one.h}{
Allows the user to manually set the height of the first figure legend (decimal digit between 0 and 1). Very important if adjusting legend text size. Defalut is 0.77.
}
  \item{legend.two.h}{
Allows the user to manually set the height of the second figure legend (decimal digit between 0 and 1). Very important if adjusting legend text size. Defalut is 0.25.
}
  \item{top.taxa.plot}{
The relative abundance plot to be used in the patient profile.
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
# Plot individual patient
data("PatProAlphaDiv",package="patPRO")
data("PatProMap",package="patPRO")
data("PatProOTU",package="patPRO")
data("PatProBacLoad",package="patPRO")
# Alpha Diversity
mergedMapAlpha <- mergeMapMetaData(map.file=PatProMap, 
  merging.file=PatProAlphaDiv, 
  map.sub.id="SubjectID", 
  map.tmpt="Time_point", 
  map.smpl.id="SampleID", 
  sample.id.col="SampleID")
testNormAlphaDiv <- normalizeAlphaDiv(mergedMapAlpha, c("chao1","shannon"), 1)
alphaDivPlot <- plotNormalizedAlphaDiv(testNormAlphaDiv, 
  c("chao1","shannon"), 
  plot.title="Subject One Diversity", 
  color.brewer.set="Set2", 
  legend.text.size = 12)
# Bacterial Load
mergedMapBacLoad <- mergeMapMetaData(map.file=PatProMap, 
  merging.file=PatProBacLoad, 
  map.sub.id="SubjectID", 
  map.tmpt="Time_point", 
  map.smpl.id="SampleID", 
  sample.id.col="SampleID")
bacLoad <- plotBacterialLoad(mergedMapBacLoad, 
  1, 
  bac.load.col="Num_Bacteria", 
  plot.title="Subject One Bacterial Load")
# Taxa Relative Abundance
transTestRelAbund <- transposeRelAbund(PatProOTU)
mergedMapTransRA <- mergeMapMetaData(map.file=PatProMap, 
  merging.file=transTestRelAbund, 
  map.sub.id="SubjectID", 
  map.tmpt="Time_point", 
  map.smpl.id="SampleID", 
  sample.id.col="SampleID")
top5RelAbund <- topRelAbundDataFrame(x=mergedMapTransRA, top.taxa.num=5)
topTaxa <- plotTopTaxa(top5RelAbund, 
  1, 
  plot.title="Subject One Taxonomy", 
  color.brewer.set="Set2", 
  mark.events=TRUE, 
  mark.times=c(2,6), 
  mark.text="Surgery", 
  legend.text.size=8)
# Plot three
patproPlotThree(alphaDivPlot, bacLoad, topTaxa, "Subject One Profile")
}
