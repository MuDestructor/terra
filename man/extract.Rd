\name{extract}

\docType{methods}

\alias{extract}
\alias{extract,SpatRaster,SpatLayer-method}
\alias{extract,SpatRaster,matrix-method}

\alias{[,SpatRaster,SpatLayer,missing-method}
\alias{[,SpatRaster,missing,missing-method}
\alias{[,SpatRaster,numeric,missing-method}
\alias{[,SpatRaster,missing,numeric-method}
\alias{[,SpatRaster,numeric,numeric-method}


\title{Extract values from a SpatRaster}

\description{
Extract values from a SpatRaster for the locations of a SpatVector
} 

\usage{
\S4method{extract}{SpatRaster,SpatLayer}(x, y, fun="", ...)
\S4method{extract}{SpatRaster,matrix}(x, y, fun="", ...)
}

\arguments{
\item{x}{SpatRaster}
\item{y}{SpatVector (for points, lines, polygons), or 2-column matrix (x, y; for points)}
\item{fun}{character. function to summarize the data. Currently ignored}
\item{...}{additional arguments. None implemented}
}

\value{data.frame}

\seealso{\link{values}}

\examples{
r <- rast(ncol=5, nrow=5)
values(r) <- 1:25
xy <- rbind(c(0,0), c(1,1))
p <- vect(xy)

extract(r, xy)
extract(r, p)

r[1,]
r[5]
r[,5]

r[c(0:2, 99:101)]

f <- system.file("exdata/test.tif", package="terra")
r <- rast(f)

xy <- cbind(179000, 330000)
xy <- rbind(xy-100, xy, xy+1000)
extract(r, xy)

p <- vect(xy)
g <- geom(p)
g

extract(r, p)

x <- r + 10
extract(x, p)

i <- cellFromXY(r, xy)
x[i]
r[i]

y <- c(x,x*2,x*3)
y[i]

}

\keyword{methods}
\keyword{spatial}
