\name{plotTopTaxaMean}
\alias{plotTopTaxaMean}
\title{
Plot the Mean Relative Abundance of Top Taxa.
}
\description{
Uses the results from the top.rel.abund.data.frame and the patient.mean function for 
graphing relative abundance of the top taxonomy. This is used seperate from the 
plotTopTaxaMean function because it uses mean values.
}

\usage{
plotTopTaxaMean(top.taxa.data.frame, 
	tmpt.id.col="Time_point", 
	y.lab="Percent Relative Abundance", 
	x.lab="Time Point", plot.title, 
	mark.events=FALSE, 
	mark.times, 
	mark.text="", 
	color.brewer.set="", 
	color.manual.set="", 
	legend.text.size = 7)
}

\arguments{
  \item{top.taxa.data.frame}{
The \code{\link{data.frame}} from the top.rel.abund.data.frame function which will be used for plotting the top taxa.
}
 \item{tmpt.id.col}{
Name of the time point column found in x. Default is "Time_point".
}
 \item{y.lab}{
Name of the y axis label to be used in the plot. Default is "Percent Relative Abundance".
}
 \item{x.lab}{
Name of the x axis label to be used in the plot. Default is "Time Point".
}
 \item{plot.title}{
The desired plot title.
}
 \item{mark.events}{
Specify whether arrows will be used to specify specific time events. Set as TRUE for using arrows. Default is FALSE.
}
 \item{mark.times}{
The time points to be marked with arrows when mark.events=TRUE. These numbers need to be set as a vector.
}
 \item{mark.text}{
The text to be used to annotate the arrow markers when mark.events=TRUE.
}
 \item{color.brewer.set}{
Name of the color brewer palet to use for plot coloring. Default value uses default colors.
}
 \item{color.manual.set}{
Name of the manually specified color palet to use for plot coloring. Default value uses default colors.
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
topTaxaMean <- patientMean(x=top5RelAbund, sub.range=c(1:5), metric.col="Bacteria")
topTaxaMeanPlot <- plotTopTaxaMean(topTaxaMean, 
	plot.title="Mean Taxonomy For Subjects 1-5", 
	color.brewer.set="Set2", 
	legend.text.size = 8)
}
