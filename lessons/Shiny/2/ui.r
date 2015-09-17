#Here, we add interactivity to the plot. In the sidebarPanel in the ui.R, we add a sliderInput widget, which allows the user to (a) select a value from the ui interface, which is then (b) fed to the server script. The server script then (c) readjusts the plot with the new input value and (d) feeds the output plot to the ui interface.

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
				#3.a. Add selectInput function here
				#Create a slider that will adjust the cex value of the text displayed called "cexSlider".
				sliderInput(inputId = "cexSlider", label="Adjust cex",
				min = 0, max=1, value=1)
			),		
			#Create a spot for the plot
			mainPanel(
				plotOutput("pcaplot")
			)
		)

    )
)

#TASKS:
#1. Change the size of label of the cexSlider with the wrapper, "h4"
#2. Adjust the maximum cexSlider cex size to 5
#3. The PCA plot (pcaplot) currently is showing all the values, disregarding the different variables (Var: colless, numsp, Spatial). We however would like to show the PCA plot for each variable scenario. 
#To do so:
#	a. Create a drop-down list of the variables with the function "selectInput" within the "sidebarPanel" function. 
#	b. Assign the selectInput object as 'var', and the label as "h3('Variable')"
#	c. for the choices, use:
		# choices = c(
			# "Colless" = "colless",
			# "Species Pool Size" = "numsp",
			# "Spatially Contiguous" = "spatial"
		# )
#	d. Link 'var' as input$var in server.r (refer to server.r)

 
#HINTS:
#1. sliderInput(..., label = h4("Adjust cex"))
#2. sliderInput(..., max = 5)
#3. selectInput(inputId='var', label = h3('Variable'),
		# choices = c(
			# "Colless" = "colless",
			# "Species Pool Size" = "numsp",
			# "Spatially Contiguous" = "spatial"
		# )
#	)

 