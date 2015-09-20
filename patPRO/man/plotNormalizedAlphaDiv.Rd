\name{plotNormalizedAlphaDiv}
\alias{plotNormalizedAlphaDiv}
\title{
Plot Normalized Alpha Diversity.
}
\description{
Plot the normalized alpha diversity data, over time, of the desired patient or patient 
group means. The patient patient.mean function must be used to calculate and format the 
normalized data for this plotting function. If only a single patient plot is desired, 
please use the patient mean function with only a single patient. This subroutine takes 
in the data frame output from normalize.alpha.div.
}

\usage{
plotNormalizedAlphaDiv(input.df, 
	alpha.div.metrics, 
	tmpt.id.col="Time_point", 
	y.lab="Normalized Alpha Diversity Value", 
	x.lab="Time Point", 
	plot.title, 
	color.brewer.set="", 
	color.manual.set="", 
	mean.mark=FALSE, 
	legend.text.size = 7)
}

\arguments{
  \item{input.df}{
The \code{\link{data.frame}} output from the diversity normalization subroutine normalize.alpha.div containing the alpha diversity information for the dataset. This will be the data frame used for plotting.
}
  \item{alpha.div.metrics}{
The name(s) of the alpha diversity metrics to be plotted.
}
 \item{tmpt.id.col}{
Name of the time point column found in alpha.div.input. Default is "Time_point".
}
 \item{y.lab}{
Name of the y axis label to be used in the plot. Default is "Normalized Alpha Diversity Value".
}
 \item{x.lab}{
Name of the x axis label to be used in the plot. Default is "Time Point".
}
 \item{plot.title}{
The desired plot title.
}
 \item{color.brewer.set}{
Name of the color brewer palet to use for plot coloring. Default value uses default colors.
}
 \item{color.manual.set}{
Name of the manually specified color palet to use for plot coloring. Default value uses default colors.
}
 \item{mean.mark}{
Allows the user to define whether this is used to plot mean values (including standard error; set to TRUE) or if this is for a single subject. Default is FALSE.
}
 \item{legend.text.size}{
Allows the user to manually set the figure legend text size digit. Default is size 7.
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
# Plot patient average
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
alphaDivPlotMean <- plotNormalizedAlphaDiv(AlphaDivMean, 
	c("chao1","shannon"), 
	plot.title="Mean Diversity For Subjects 1-5", 
	color.brewer.set="Set2", 
	mean.mark=TRUE, 
	legend.text.size = 12)
}
