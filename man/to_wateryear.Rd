\name{to_wateryear}
\alias{to_wateryear}
\title{Hydrologic date conversion.}
\description{converts a date to a water year.}
\usage{to_wateryear(thedate)}
\arguments{
  \item{thedate}{a date created by as.Date('YYYY-MM-DD') or a string of form 'YYYY-MM-DD'.}
}

\value{an interger of form YYYYDDD, e.g. 2014-01-01 is 2014001.}

\author{Who wrote it}




\examples{
#  to_wateryear(as.Date(Sys.time()))
#  to_wateryear('2013-10-01')
#  to_wateryear('2014-09-30')
#  to_wateryear('2012-09-30')
}
