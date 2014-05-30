\name{get_waterdata}
\alias{get_waterdata}
\title{Download daily flow data from USGS.}
\description{download flowdata from a USGS gauge using the waterData package.}
\usage{get_waterdata(startdate = NULL, enddate = NULL, locid = "11173200")}
\arguments{
  \item{startdate}{start date of record, string of form "YYYY-MM-DD".}
  \item{enddate}{end date of record, same format as startdate.}
  \item{locid}{the station id, default is Arroyo Hondo '11173200'.}
}
\details{flow data is downloaded using the waterData package for R.
Daily mean flow data (parameter code 00060, stat code 00003) is specified.}
\value{a continuous time series from the waterData package.}

\author{Michael Koohafkan}




\examples{
get_waterdata(startdate='2011-10-01', enddate='2013-09-30', locid='11173200')
}
