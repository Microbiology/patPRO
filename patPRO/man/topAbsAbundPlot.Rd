\name{topAbsAbundPlot}
\alias{topAbsAbundPlot}
\title{
Plot Top Taxa Abundance Normalized to Bacterial Load.
}
\description{
Uses the results from the top.abs.abund.data.frame function for graphing relative 
abundance of the top taxonomy normalized under the absolute bacterial load calculated 
from qPCR results.
}

\usage{
topAbsAbundPlot(rel.abund.df, 
	patient.id, 
	subject.id.col="SubjectID", 
	tmpt.id.col="Time_point", 
	abs.abund.id.col="absolute_abund", 
	bac.id.col="Bacteria", 
	bac.load.col="bac_load", 
	y.lab="Relative Abundance of Bacterial Load", 
	x.lab="Time Point", 
	plot.title, 
	mark.events=FALSE, 
	mark.times, 
	mark.text="", 
	color.brewer.set="", 
	color.manual.set="", 
	legend.text.size = 7)
}

\arguments{
  \item{rel.abund.df}{
The \code{\link{data.frame}} from the top.abs.abund.data.frame function which will be used for plotting the top taxa.
}
  \item{patient.id}{
The patient identifier to specify the case which should be visualized.
}
  \item{subject.id.col}{
Name of the subject ID column. Default is "SubjectID".
}
 \item{tmpt.id.col}{
Name of the time point column. Default is "Time_point".
}
 \item{abs.abund.id.col}{
Name of the column containing the normalized relative abundance information. Default is "absolute_abund".
}
 \item{bac.id.col}{
Name of the column containing the taxonomic identifiers for the dataset. Default is "Bacteria".
}
 \item{bac.load.col}{
Name of the column containing the bacterial load information. Default is "bac_load".
}
 \item{y.lab}{
Name of the y axis label to be used in the plot. Default is "Relative Abundance of Absolute Abundance".
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
normTopTaxa <- topAbsAbundPlot(absAbundOutDf, 
	1, 
	bac.load.col="Num_Bacteria", 
	plot.title="Subject One Normalized Taxonomy", 
	color.brewer.set="Set2", 
	mark.events=TRUE, 
	mark.times=c(2,6), 
	mark.text="Surgery", 
	legend.text.size = 8)
}
