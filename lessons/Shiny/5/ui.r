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
				min = 0, max=5, value=1),
				uiOutput(outputId="sliderX"),
				uiOutput(outputId="sliderY")
			),		
			#Create a spot for the plot
			mainPanel(
				 plotOutput(outputId="pcaplot",  width="500px",height="500px")
			)
		)

    )
)


 