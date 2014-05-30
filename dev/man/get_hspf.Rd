\name{get_hspf}
\alias{get_hspf}
\title{Import HSPF data}
\description{Load a CSV file of copied HSPF output. This function is essentially 
a wrapper for read.csv() that assumes a specific arrangement and format.}
\usage{get_hspf(f)}
\arguments{
  \item{f}{a relative or absolute file path, e.g. 'C:/data/file.csv'}
}
\details{The file is expected to be in a specific format, i.e. a direct
copy-paste of flow data from the HSPF program. As of May 2014, the ouput
consists of 7 header lines followed by 3 columns: a column of dates in 
format DD/MM/YYYY, a column of accretion values in units of cubic-feet per 
second, and a column of flows in units of acre-feet per day.

Flow is converted to cubic feet per second for consistency
with output from get_forecast() and get_waterdata(). The accretion 
column is ignored.

The output is formatted to match the output of
get_waterdata(), so that the HSPF data can be reformatted 
using to_calendaryear() and to_wateryear() for manipulation using flowdurr.}
\value{a dataframe containing three columns: 'GMT', 'WYD', and 'flow'.}

\author{Michael Koohafkan}




\examples{
data(hspftraces)
fakedata = data.frame(GMT=format(hspftraces$GMT,'\%m/\%d/\%Y'))
fakedata['accretion'] = -1
fakedata['flow'] = hspftraces$flow*86400/43560
tmp = tempfile(fileext ='.csv')
write.table(matrix(rep('HEADERLINE', 7), ncol=1), file=tmp, sep=',',
            row.names=FALSE, col.names=FALSE)
write.table(fakedata, file=tmp, sep=',', append=TRUE, 
            row.names=FALSE, col.names=FALSE)
head(get_hspf(tmp))
}
