\name{strip_na_cols}
\alias{strip_na_cols}
\title{Remove NA columns.}
\description{remove columns that only contain NA values.}
\usage{strip_na_cols(d)}
\arguments{
  \item{d}{a dataframe.}
}

\value{the supplied dataframe, but with NA columns removed.}

\author{Michael Koohafkan}




\examples{
data(usgstraces)
usgs.wyear = split_by_wateryear(usgstraces)
strip_na_cols(usgs.wyear)
}
