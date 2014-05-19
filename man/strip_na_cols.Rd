\name{strip_na_cols}
\alias{strip_na_cols}
\title{Remove NA columns.}
\description{remove columns that only contain NA values.}
\usage{strip_na_cols(d)}
\arguments{
  \item{d}{a dataframe.}
}

\value{the supplied dataframe, but with NA columns removed.}

\author{Who wrote it}




\examples{
#  d = data.frame(w=seq(0, 10), x=c(rep(NA, 6), seq(5)), 
#                 y=rep(NA, 11), z=seq(0, 20, 2))
#  strip_na_cols(d)
}
