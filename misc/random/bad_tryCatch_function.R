fn <- function(a, b){
  tryCatch(if (TRUE){
  stop("Hello")}
  )
  return(a + b)
}

a <- fn(1, 2)
print(a)

if (is.double(a) == TRUE) {
  print("a is a double")
}