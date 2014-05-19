my.file.copy <-
function(from, to) {
    todir <- dirname(to)
    if (!isTRUE(file.info(todir)$isdir)) dir.create(todir, recursive=TRUE)
    file.copy(from = from,  to = to)
}
