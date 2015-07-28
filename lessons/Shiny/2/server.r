#Here, we add interactivity to the plot. In the sidebarPanel in the ui.R, we add a sliderInput widget, which allows the user to (a) select a value from the ui interface, which is then (b) fed to the server script. The server script then (c) readjusts the plot with the new input value and (d) feeds the output plot to the ui interface.

library(shiny)	#First load shiny library
load("../pcas.RDATA")	#Load data

#Define a server for the Shiny app
shinyServer(function(input, output) {

	#Create a reactive Shiny plot to send to the ui.r called "pcaplot"
	output$pcaplot <- renderPlot({
		#Render the scatterplot of PCA
		plot(PC2~PC1, data=foo, type="n", xlab="PC1", ylab="PC2")
		text(PC2~PC1, data=foo, labels=foo$metric, cex=input$cexSlider)
  })
})

#TASKS:
#1. The PCA plot (pcaplot) currently is showing all the values, disregarding the different variables (Var: colless, lambdaE, lambdaR, Landscape, Numsp, Repulsion, Spatial). We however would like to show the PCA plot for each variable scenario. 
#To do so:
#	a. Complete Task 3 in ui.r to create the selectInput drop-down menu, which we will call 'var'
#	b. subset the foo dataframe for only instances when foo$Var==input$var


#HINTS
#1. output$pcaplot <- renderPlot({
#		#Subset for input$var and assign this subset to new object, "fbar"
#		fbar<-droplevels(foo[which(foo$Var==input$var),])
#		
#		#Change "foo" to "fbar" for the plot and text
#		plot(PC2 ~ PC1, data=fbar, type="n", xlab="PC1", ylab="PC2")
#		text(PC2 ~ PC1, data=fbar, labels=fbar$metric, cex=input$cexSlider)
#  })



