# We've now learned some of the basic tools for building a shiny app. Now complete the tasks to add additional bells and whistles to the shiny app.
# After you have finished with your app, you can deploy it to the world to see. There are a number of options for this, which I won't go into detail because it depends on your personal preference for how you want the data shared (See https://shiny.rstudio.com/tutorial/lesson7/)

library(shiny)	#First load shiny library
load("../pcas.RDATA")	#Load data

#Define the overall UI
shinyUI(
	#Use a fluid Bootstrap layout
	fluidPage(
		#Give the page a title
		titlePanel("PCA of Metrics"),
		#Define page with a sidebar panel and main panel
		sidebarLayout(
			#Sidebar Panel
			sidebarPanel(
				#Create drop-down menu to select Variable to plot PCA for
				selectInput(inputId='var', label = h3('Variable'),
					choices = c(
						"Colless" = "colless",
						"Species Pool Size" = "numsp",
						"Spatially Contiguous" = "spatial"
						)
					),
				#Check box group, contingent upon previous drop-down menu selection
				uiOutput(outputId="paramchkbxgrp"),
				#Create a slider that will adjust the cex value of the text displayed called "cexSlider".
				sliderInput(inputId = "cexSlider", label=h4("Adjust cex"),
				min = 0, max=5, value=1)
			),		
			#Create a spot for the plot
			mainPanel(
				plotOutput("pcaplot")
			)
		)

    )
)

#TASKS:
#1. Create the ability to zoom in or out of the plots. Create two sliderInput objects to adjust the x- and y-axes of the plot depending on the Variable selected. To do so:
#	a. Within the sidebarPanel of the ui.R script, add two uiOutput objects, containing the outputId names of "sliderX" and "sliderY"
#	b. In script.R, create the output$sliderX and output$sliderY objects with the function renderUI. (see script.R)
#2. Change the plot width. For plotOutput(outputId="pcaplot"), add width (width = "750px") and height (height = "650px") parameters
 
#HINTS:
#1.a. 
# sidebarPanel(
	# selectInput(inputId='var', ...),
	# uiOutput(outputId="paramchkbxgrp"),
	# sliderInput(inputId = "cexSlider", ...),
	# #********ADD THIS SCRIPT********
	# uiOutput(outputId="sliderX"),
	# uiOutput(outputId="sliderY")
	# #*******************************
# )
#2. plotOutput(outputId="pcaplot",  width="750px",height="750px")
 
