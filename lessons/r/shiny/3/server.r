#We've now added interactivity to the plot. The user can (a) specify the Variable (Var) scenario they wish to plot the PCA of, and (b) adjust the text's cex values. The server.r script now includes code to add colors that correspond to each selected variable's parameter values (param), as well as a legend.

library(shiny)	#First load shiny library
load("../pcas.RDATA")	#Load data

#Define a server for the Shiny app
shinyServer(function(input, output) {

	#Create a reactive Shiny plot to send to the ui.r called "pcaplot"
	output$pcaplot <- renderPlot({
		#Match user's variable input selection by subsetting for when foo$Var==input$var
		fbar<-droplevels(foo[which(foo$Var==input$var),])
		
		#Generate colors to correspond to the different Variables' parameters. E.g., for the variable "colless", different colors for "loIc","midIc", and "hiIc"
		cols<-c("#1f77b4","#ff7f0e","#2ca02c")[1:length(levels(fbar$param))]
		
		#Render the scatterplot of PCA
		plot(PC2 ~ PC1, data=fbar,  type="n", xlab="PC1", ylab="PC2")

		#For each of the different parameter values (different colors), plot the text names of the metrics
		for(i in levels(fbar$param)){
			foo2<-subset(fbar,param==i)
			text(PC2 ~ PC1, data=foo2, labels=foo2$metric, col=cols[which(levels(fbar$param)==i)],  cex=input$cexSlider)
		}
		#Add a legend for the different parameter values (with corresponding colors) of the selected Variable
		legend("topright", fill=cols, legend=levels(fbar$param))
  })
})

#TASKS:
#1. Depending on the variable that people choose (input$var), we now want to display the chosen variable's parameter (param) values as a check box group. Even though logically we would begin with the checkboxGroupInput function on the ui.R script to display check box options, first remember what the capabilities of the user side (ui.R) are. ui.R cannot evaluate/process information, but only displays output values calculated on the server side (server.R). In other words, the ui.R only takes in the values a user specifies and then sends this information to be evaluated/processed on the server side. 
#	So to create a checkboxgroup of param values that will change based on what the user selects for a variable (input$var), our first step is to evaluate what the user selects as a variable. This evaluation can only take place on the server side. We therefore need to create an object on the server side (output$paramchkbxgrp) that will evaluate the user's Variable selection (input$var), which will then decide which check box options to display.  This decision of what to display is then fed back to the ui.R with the object uiOutput. 

#	1.a. Depending on what Variable is selected by the user (input$var), generate a different set of check box options to display (with the function checkboxGroupInput). For instance, if "colless" is selected as the variable, display the parameters values that correspond to "colless", e.g., loIc, midIc and hiIc. This switch function takes the given value (input$var) and then evaluates it. When input$var=="colless", then it evaluates the checkboxGroupInput function with the choices of  c("Low" = "loIc", "Mid" = "midIc", "High" = "hiIc"). 
#Use the following script as a framework for the paramchkbxgrp object:

	#	output$paramchkbxgrp <- renderUI({
			# if (is.null(input$var))
			  # return()
		## Depending on input$var, we'll generate a different
		## UI component and send it to the client.
			# switch(input$var,
			# "colless" = checkboxGroupInput(inputId = "PARAMS", label = "",
				# choices = c(
					# "Low" = "loIc",
					# "Mid" = "midIc",
					# "High" = "hiIc"
					# ),
				# selected = c("loIc","midIc","hiIc")),	
			##Fill in the ellipses with the corresponding parameter values 
			# "numsp" = checkboxGroupInput(...),
			# "spatial" = checkboxGroupInput(...),
			# )
		  # })
			
	# })
#2. When certain checkboxes are unselected, display the text as grey with some transparency. To do this, within the renderPlot function, adjust the cols object such that the unselected are black with high transparency (display as grey). To do this for the cols object, subset for when input$PARAMS is not in levels(fbar$PARAMS):
#	cols[which(!(levels(fbar$param) %in% input$PARAMS))]
#Then assign all of these instances as black rgb(0,0,0, maxColorValue=255) with very high transparency rgb(0,0,0, alpha =25, maxColorValue=255):
#	cols[which(!(levels(fbar$param) %in% input$PARAMS))]<- rgb(0,0,0, alpha=25,maxColorValue=255)

# #HINTS
# 1.a 	Drop-down menu to select Factor	
	# output$paramchkbxgrp <- renderUI({
		# if (is.null(input$var))
		  # return()

		# # Depending on input$var, we'll generate a different
		# # UI component and send it to the client.
		# switch(input$var,
		  # "colless" = checkboxGroupInput("PARAMS", "",
			# choices = c("Low" = "loIc",
						# "Mid" = "midIc",
						# "High" = "hiIc"
						# ),
			# selected = c("loIc","midIc","hiIc")),
		  # "numsp" = checkboxGroupInput("PARAMS", "",
			# choices = c("16 Species" = 16,
						# "64 Species" = 64,
						# "256 Species" = 256),
			# selected = c(16,64,256)),
		  # "spatial" = checkboxGroupInput("PARAMS", "",
			# choices = c("True" = "TRUE",
						# "False" = "FALSE"),
			# selected = c("TRUE","FALSE")),
		# )
	  # })


# 2. 
# output$pcaplot <- renderPlot({
		# #Match user's variable input selection by subsetting for when foo$Var==input$var
		# fbar<-droplevels(foo[which(foo$Var==input$var),])
		
		# #Generate colors to correspond to the different Variables' parameters. E.g., for the variable "colless", different colors for "loIc","midIc", and "hiIc"
		# cols<-c("#1f77b4","#ff7f0e","#2ca02c")[1:length(levels(fbar$param))]
		
		# #***********************ADD THIS TO EXISTING SCRIPT *************************
		# #If the param is not selected, set the color value to grey with transparency
		# cols[which(!(levels(fbar$param) %in% input$PARAMS))]<- rgb(0,0,0, alpha=25,maxColorValue=255)
		# #****************************************************************************
		
		# #Render the scatterplot of PCA
		# plot(PC2 ~ PC1, data=fbar, type="n", xlab="PC1", ylab="PC2")

		# #For each of the different parameter values (different colors), plot the text names of the metrics
		# for(i in levels(fbar$param)){
			# foo2<-subset(fbar,param==i)
			# text(PC2 ~ PC1, data=foo2, labels=foo2$metric, col=cols[which(levels(fbar$param)==i)],  cex=input$cexSlider)
		# }
		
		# #Add a legend for the different parameter values (with corresponding colors) of the selected Variable
		# legend("topright", fill=cols, legend=levels(fbar$param))
		
  # })


