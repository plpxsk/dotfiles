## -*- mode: R -*- ============================================================
## WHAT         R init file
## HOW          
## NOTES        
## AUTHOR       [AMA!] Pawel Paczuski [pavopax.com]  
## ============================================================================


## I seem to need this to get graphics to work on Mac OS X
options(device="quartz")
## number of columns in R output (at least in ESS)
## default on my setup was around 80
options("width"=100)

## get thee to a temp directory for play
go.tempo <- function() setwd("~/tempo")


## lsos from stack overflow
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



## Describe data - need psych() package
dd.dd <- function(data){
  describe(data)[,c(1:5,8:10)]  
}

dd.ddb <- function(data, group){
  t1 <- describeBy(data, group=data$group)
  print(summary(data$group))
  dimm <- dim(t1)
  for (i in 1:dimm){
    print(t1[[i]][,c(1:5,8:10)])
  }
}
