#We've now added interactivity to the plot. The user can (a) specify the Variable (Var) scenario they wish to plot the PCA of, and (b) adjust the text's cex values. The server.r script now includes code to add colors that correspond to each selected variable's parameter values (param), as well as a legend.

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
#1. Depending on the variable that people choose (input$var), we now want to display the chosen variable's parameter (foo$param) values as a check box group. Even though logically we would begin with the checkboxGroupInput function on the ui.R script to display check box options, first remember what the capabilities of the user side (ui.R) are. ui.R cannot evaluate/process information, but only displays output values calculated on the server side (server.R). In other words, the ui.R only takes in the values a user specifies and then sends this information to be evaluated/processed on the server side. 
#	So to create a checkboxgroup of param values that will change based on what the user selects for a variable (input$var), our first step is to evaluate what the user selects as a variable. This evaluation can only take place on the server side. We therefore need to create an object on the server side (output$paramchkbxgrp) that will evaluate the user's Variable selection (input$var), which will then decide which check box options to display. This decision of what to display is then fed back to the ui.R with the object uiOutput. 
#	1.a. With the function uiOutput, display the computation result of the output function paramchkbxgrp
 
#HINTS:
#1.a. Place the following snippet of code in ui.R within the sidebarPanel, after the selectInput for the variables:
#	uiOutput(outputId="paramchkbxgrp")

 