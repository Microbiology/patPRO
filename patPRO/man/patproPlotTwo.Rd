\name{patproPlotTwo}
\alias{patproPlotTwo}
\title{
Generate Patient Profile of Two Plots.
}
\description{
Use this function to generate a patient profile containing two figures. The figures 
included are the alpha diversity and top taxa plots over time. This should be used when 
there is no bacterial load data, or when the normalized top taxa plot is used.
}

\usage{
patproPlotTwo(alpha.div.plot, 
	norm.top.taxa.plot, 
	patpro.plot.title, 
	legend.one.h=0.70, 
	legend.two.h=0.30)
}

\arguments{
  \item{alpha.div.plot}{
The alpha diversity plot to be used in the patient profile.
}
  \item{norm.top.taxa.plot}{
The normalized or non-normalized taxonomic relative abundance plot to be included in the patient profile.
}
  \item{patpro.plot.title}{
The desired plot title.
}
  \item{legend.one.h}{
Allows the user to manually set the height of the first figure legend (decimal digit between 0 and 1). Very important if adjusting legend text size. Defalut is 0.70.
}
  \item{legend.two.h}{
Allows the user to manually set the height of the second figure legend (decimal digit between 0 and 1). Very important if adjusting legend text size. Defalut is 0.30.
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
# Absolute Abundance Estimation
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
normTopTaxa <- topAbsAbundPlot(absAbundOutDf, 
	1, 
	bac.load.col="Num_Bacteria", 
	plot.title="Subject One Normalized Taxonomy", 
	color.brewer.set="Set2", 
	mark.events=TRUE, 
	mark.times=c(2,6), 
	mark.text="Surgery", 
	legend.text.size = 8)
patproPlotTwo(alphaDivPlot, normTopTaxa, "Subject One Profile")
}
