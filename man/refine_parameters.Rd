\name{refine_parameters}
\alias{refine_parameters}
\title{Refine parameter estimates using MLE}
\description{Refine the L-moment parameter estimates using MLE and a genetic algorithm.}
\usage{refine_parameters(flowdata, paramdata, distr, fix.skew = NULL)}
\arguments{
  \item{flowdata}{flow duration data to be used for fitting, as created by get_peakavg().}
  \item{paramdata}{parameter data to be refined, as created by get_parameters() }
  \item{distr}{distribution to be fitted, either log Pearson III ('lp3') or lognormal ('ln3').}
  \item{fix.skew}{optional: If distr='lp3', skewness value to be fixed. If NULL, skewness 
estimate will be refined with other parameters.}
}
\details{The function uses the Maximum Likelihood Estimation functionality
provided by the fitdistrplus package in conjunction with the genetic 
optimization algorithm provided by the rgenoud package. Note that most of
rgenoud parameters are hardcoded in the function. If different settings are 
required, refine_parameters() will need to be redefined by the user.

uses a smaller population but computes the gradient
to determine convergence and allows the number of generations to be extended
if the algorithm is converging. }
\value{a list containing 1) a table of parameter values for each flow duration,
2) a table of information criterion values, 3) a table of standard errors. }

\author{Who wrote it}





