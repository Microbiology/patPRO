\name{plotBacterialLoad}
\alias{plotBacterialLoad}
\title{
Plot Supplemental Bacterial Load Information.
}
\description{
Plot the supplemental bacterial load data, which would have been obtained by qPCR for the
16S rRNA gene. Because this data is straightforward relative to the other data types, it 
will not require much formatting before plotting.
}

\usage{
plotBacterialLoad(input.bac.load, 
	subject.id, 
	subject.id.col="SubjectID", 
	bac.load.col="bac_load", 
	tmpt.id.col="Time_point", 
	y.lab="Bacterial Load", 
	x.lab="Time Point", 
	plot.title, 
	mean.mark=FALSE)
}

\arguments{
  \item{input.bac.load}{
The \code{\link{data.frame}} containing the bacterial load information, as well as the subject IDs and time points associated with those load data points.
}
  \item{subject.id}{
The subject identification that will be plotted. If this value is specified as blank (ie ""), then the function will assume the input data frame is of mean values, and will not attempt to select a specific subject to plot.
}
  \item{subject.id.col}{
Name of the subject ID column. Default is "SubjectID".
}
  \item{bac.load.col}{
Name of the bacterial load value column. Default is "bac_load".
}
 \item{tmpt.id.col}{
Name of the time point column. Default is "Time_point".
}
 \item{y.lab}{
Name of the y axis label to be used in the plot. Default is "Absolute Abundance".
}
 \item{x.lab}{
Name of the x axis label to be used in the plot. Default is "Time Point".
}
 \item{plot.title}{
The desired plot title.
}
 \item{mean.mark}{
Allows the user to define whether this is used to plot mean values (including standard error; set to TRUE) or if this is for a single subject. Default is FALSE.
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
data("PatProBacLoad",package="patPRO")
data("PatProMap",package="patPRO")
mergedMapBacLoad <- mergeMapMetaData(map.file=PatProMap, 
	merging.file=PatProBacLoad, 
	map.sub.id="SubjectID", 
	map.tmpt="Time_point", 
	map.smpl.id="SampleID", 
	sample.id.col="SampleID")
# Plot individual subject
bacLoad <- plotBacterialLoad(mergedMapBacLoad, 
	1, 
	bac.load.col="Num_Bacteria", 
	plot.title="Subject One Bacterial Load")
# Plot subject means
BacMean <- patientMean(x=mergedMapBacLoad, 
	sub.range=c(1:5), 
	metric.col="", 
	abundance.val="Num_Bacteria")
bacLoadMean <- plotBacterialLoad(BacMean, 
	"", 
	bac.load.col="Num_Bacteria", 
	plot.title="Mean Bacterial Load For Subjects 1-5", 
	mean.mark=TRUE)
}
