
#' Print a right-angle triangle of height triangleHeight, 
#' with the right angle at the top left 
#' @param triangleHeight integer height of the triangle
printTriangle <- function(triangleHeight){
  
  stars<-""
  for(i in 1:triangleHeight){
    for(j in i:triangleHeight){
      stars <- paste(stars,"*")
    }
    print(stars)
  }
  
}

printTriangle(3)