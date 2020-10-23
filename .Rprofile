# COMMON R-profile
# Paul Paczuski 
# https://github.com/pavopax/dotfiles

## I seem to need this to get graphics to work on Mac OS X
## disable if using jupyter r kernel to prevent flashing window
## options(device="quartz")

options("width"=120)
options(max.print = 2000)

## applies to emacs only
local({
  r <- getOption("repos")
  ##r["CRAN"] <- "https://cran.cnr.berkeley.edu/"
  r["CRAN"] <- "https://cran.rstudio.com/"
  options(repos = r)
})


## utility functions (only used in R console)
h <- function(x) head(x)
g <- function(x) glimpse(x)
s <- function(x) summary(x)
l <- function(x) length(x)
u <- function(x) unique(x)
adf <- function(x) as.data.frame(x)

## lsos()
## https://github.com/nfultz/stackoverflow/blob/master/R/lsos.R
.ls.objects <- function (pos = 1, pattern, order.by,
                        decreasing=FALSE, head=FALSE, n=5) {
    napply <- function(names, fn) sapply(names, function(x)
                                         fn(get(x, pos = pos)))
    names <- ls(pos = pos, pattern = pattern)
    obj.class <- napply(names, function(x) as.character(class(x))[1])
    obj.mode <- napply(names, mode)
    obj.type <- ifelse(is.na(obj.class), obj.mode, obj.class)
    obj.prettysize <- napply(names, function(x) {
                           capture.output(print(object.size(x), units = "auto")) })
    obj.size <- napply(names, object.size)
    obj.dim <- t(napply(names, function(x)
                        as.numeric(dim(x))[1:2]))
    vec <- is.na(obj.dim)[, 1] & (obj.type != "function")
    obj.dim[vec, 1] <- napply(names, length)[vec]
    out <- data.frame(obj.type, obj.size, obj.prettysize, obj.dim)
    names(out) <- c("Type", "Size", "PrettySize", "Rows", "Columns")
    if (!missing(order.by))
        out <- out[order(out[[order.by]], decreasing=decreasing), ]
    if (head)
        out <- head(out, n)
    out
}

# shorthand
lsos <- function(..., n=10) {
    .ls.objects(...)
}

lsoss <- function(..., n=10) {
    .ls.objects(..., order.by="Size", decreasing=TRUE, head=TRUE)
}
