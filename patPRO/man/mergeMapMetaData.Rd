\name{mergeMapMetaData}
\alias{mergeMapMetaData}
\title{
Merge Mapping and Data Files
}
\description{
This function merges mapping file metadate (mapping file information formatted according
to Qiime specifications) with dataset output from Qiime, including alpha diversity,
bacterial relative abundance, and bacterial load (this must be aquired outside of
standard Qiime sequencing methods). Merge the necessary mapping file columns (subject ID
and time point which could be days, etc) into the datasets for alpha diversity,
bacterial load, and taxa relative abundance.
}
\usage{
mergeMapMetaData(map.file, 
	merging.file, 
	map.sub.id="SubjectID", 
	map.tmpt="Time_point", 
	map.smpl.id="SampleID", 
	merge.smpl.id, 
	sample.id.col="SampleID", 
	subject.id.col="SubjectID", 
	tmpt.id.col="Time_point")
}

\arguments{
  \item{map.file}{
The mapping file \code{\link{data.frame}} used for upfront Qiime analyses and formatted according to Qiime specifications.
}
  \item{merging.file}{
The \code{\link{data.frame}} containing the alpha diversity, bacterial load, or relative abundance information that will be merged with the mapping file metadata.
}
  \item{map.sub.id}{
Name of the subject ID column found in the Qiime mapping file. Default is "SubjectID".
}
  \item{map.tmpt}{
Name of the time point column found in the Qiime mapping file. Default is "Time_point".
}
 \item{map.smpl.id}{
Name os the sample ID column found in the Qiime mapping file. Default is "SampleID".
}
  \item{sample.id.col}{
Desired name of the Sample ID column for the final merged \code{\link{data.frame}}. Default is "SampleID".
}
  \item{subject.id.col}{
Desired name of the Subject ID column for the final merged \code{\link{data.frame}}. Default is "SubjectID".
}
  \item{tmpt.id.col}{
Desired name of the Time Point column for the final merged \code{\link{data.frame}}. Default is "Time_point".
}
  \item{merge.smpl.id}{
Desired name of the sample ID column in the file to be merged with. This has no default.
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
}

