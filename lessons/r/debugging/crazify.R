
reverseLetters <- function(word){
  vec <- strsplit(word, "")
  vec <- rev(unlist(vec))
  revStr <- paste(vec, collapse = "")
  return(revStr)
}

reverseWords <- function(phrase){
  vec <- strsplit(phrase, " ")
  vec <- rev(unlist(vec))
  revStr <- paste(vec, collapse = " ")
}

crazify <- function(phrase){
  revPhrase <- reverseWords(phrase)
  vec <- strsplit(revPhrase, " ")
  for(i in 1:length(vec)){
      vec[i] <- reverseLetters(vec[i]) #vec[i]
  }
  return(paste(vec, collapse = " "))
}

crazify("here i am")

# Challenge: try calling confuseTheCustomers() on the myMenu object below. 
# It fails! Try using the debugger to fix it

# The output should look like:
# Titles                                   Descriptions
# 1 Sandwich  ## hcihwdnas otamot dna ecuttel ,nocaB ##
# 2     Soup      ## puos keel dna moorhsum fo maerC ## 

#' print a crazified version of the descriptions in a menu 
#' stored as a dataframe, but not the titles of the entries in the menu
#' @param dataframe where column 1 is the name of the food and column 2 is the description
confuseTheCustomers<-function(menu){
  colnames(menu)<-c("Titles","Descriptions")
  menu$Descriptions <- crazify(menu$Descriptions) 
  print(menu)
}
myMenu <- data.frame(
  titles = c("Sandwich","Soup"),
  descriptions = c("## Bacon, lettuce and tomato sandwhich ##",
                   "## Cream of mushroom and leek soup ##")
  )
#print(myMenu)
#confuseTheCustomers(myMenu)
