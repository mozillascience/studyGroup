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
 
#Define the overall UI
shinyUI(
	#Use a fluid Bootstrap layout
	fluidPage(
		#Give the page a title
		titlePanel("Title"),
		#Define page with a sidebar panel and main panel
		sidebarLayout(
			#Sidebar Panel
			sidebarPanel(
				#We will fill this out later
			),		
			#Create a spot for the plot
			mainPanel(
				plotOutput("pcaplot")
			)
		)

    )
 )
 
 #TASK:
 #1. Change the title to something more relevant, e.g., "PCA of Metrics"
 
 
 
 
 
 
 
 