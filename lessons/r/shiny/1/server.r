#Here we first familiarize ourselves with the basic layout of the Shiny user interface. It is important to note, that while we set-up interactivity, user interactivity is not included within this first shiny App activity.

#ui.R
#	1. After initially loading the shiny library and relevant data, the overall UI is wrapped within the shinyUI function
#	2. Next, we define a page that is fluid (fluidPage)--that can change based on the user's input. For this page, we name it with a title (titlePanel)
#	3. The set-up of the page is one based on a template (sidebarLayout): a sidebar (sidebarPanel; on the left, from which the user will make their selections); and a main Panel (mainPanel) which is changes based on the user's input in the left side-bar panel
#	4. The mainPanel will display the PCA of the metrics, which is identified as "pcaplot". This object is created/assigned within the server.R script.

#server.R
#	1. The shiny library and relevant data is first loaded
#	2. We define the server for the Shiny app as something with both objects that are input (from the ui.R) and output (from the server.R)
#	3. We create a reactive Shiny plot that is output from server.R to ui.R with the function renderPlot. renderPlot is an reactive function that can take input data from the ui.R script and feed it into the server.R script. It then actively updates the information within its function. We name the object that has the renderPlot function to plot the PCAs as "pcaplot". "pcaplot" is then output and displayed through the ui.R within the plotOutput function.

library(shiny)	#First load shiny library
load("../pcas.RDATA")	#Load data

#Define a server for the Shiny app
shinyServer(function(input, output) {

	#Create a reactive Shiny plot to send to the ui.r called "pcaplot"
	output$pcaplot <- renderPlot({
		#Render the scatterplot of PCA
		plot(PC2~PC1, data=foo)	
  })
})
#TASKS:
#1. Change the plot's x- and y-axis label names to "PC1" and "PC2". 
#2. Instead of plotting points, plot the metrics as text points instead 

#HINTS:
#1. use "xlab" and "ylab" within the function "plot" to change the axes labels
#2. For the function "plot", enter the parameter "type="n"" to create a blank plot that maintains the axes labels and plotting parameters:
#	plot(PC2 ~ PC1, data=foo, type="n", xlab="PC1", ylab="PC2")
#Next use the function "text" to plot the text values. Use "foo$metric" as the label values
#	text(PC2 ~ PC1, data=foo, labels=foo$metric)
