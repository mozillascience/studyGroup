# We've now learned some of the basic tools for building a shiny app. Now complete the tasks to add additional bells and whistles to the shiny app.
# After you have finished with your app, you can deploy it to the world to see. There are a number of options for this, which I won't go into detail because it depends on your personal preference for how you want the data shared (See https://shiny.rstudio.com/tutorial/lesson7/)

library(shiny)	#First load shiny library
load("../pcas.RDATA")	#Load data

#Define a server for the Shiny app
shinyServer(function(input, output) {
	output$paramchkbxgrp <- renderUI({
		if (is.null(input$var))
		return()

		#Check box group
		#Depending on input$var, we'll generate a different UI component and send it to the client.
		switch(input$var,
			"colless" = checkboxGroupInput("PARAMS", "",
				choices = c("Low" = "loIc",
					"Mid" = "midIc",
					"High" = "hiIc"),
				selected = c("loIc","midIc","hiIc")
			),
			"numsp" = checkboxGroupInput("PARAMS", "",
				choices = c("16 Species" = 16,
						"64 Species" = 64,
						"256 Species" = 256),
				selected = c(16,64,256)
			),
			"spatial" = checkboxGroupInput("PARAMS", "",
				choices = c("True" = "TRUE",
						"False" = "FALSE"),
				selected = c("TRUE","FALSE")
			)
		)
	})
	  
	#Create a reactive Shiny plot to send to the ui.r called "pcaplot"
	output$pcaplot <- renderPlot({
		#Match user's variable input selection by subsetting for when foo$Var==input$var
		fbar<-droplevels(foo[which(foo$Var==input$var),])
		
		#Generate colors to correspond to the different Variables' parameters. E.g., for the variable "colless", different colors for "loIc","midIc", and "hiIc"
		cols<-c("#1f77b4","#ff7f0e","#2ca02c")[1:length(levels(fbar$param))]
		
		#If the param is not selected, set the color value to grey with transparency
		cols[which(!(levels(fbar$param) %in% input$PARAMS))]<- rgb(0,0,0, alpha=25,maxColorValue=255)
		
		#Render the scatterplot of PCA
		plot(PC2 ~ PC1, data=fbar, type="n", xlab="PC1", ylab="PC2")

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
#1. Create two sliderInput objects to adjust the x- and y-axes of the plot depending on the Variable selected. To do so:
#	a. Within the sidebarPanel of the ui.R script, add two uiOutput objects, containing the outputId names of "sliderX" and "sliderY" (see ui.R)
#	b. In script.R, create the output$sliderX and output$sliderY objects with the function renderUI. The renderUI function allows the function within to be reactive.
#		i. within the renderUI wrapper, use the sliderInput function:
#			sliderInput(inputId, label, min, max, value)
#			>inputId: "SLIDERX" for the x-axis; "SLIDERY" for the y-axis
#			>label: "h5("x-axes")" for the x-axis; "h5("y-axes")" for the y-axis
#			>min: subset the object foo (with the function "subset") for the minimum (use function "min") value of PC1 (for x-axis) or PC2 (for y-axis) when Var==input$var
#			>max: subset the object foo (with the function "subset") for the maximum (use function "max") value of PC1 (for x-axis) or PC2 (for y-axis) when Var==input$var
#			>value: the concatenated values of the two aforementioned min and max values: subset the object foo for the minimum/maximum value of PC1/PC2 when Var==input$var
#	c. For the scatterplot (plot) of PCA within the output$pcaplot function, change the plot parameters "xlim" and "ylim" to change with the input$SLIDERX and input$SLIDERY values.
#2. After evaluating the plot function, add red (col = "red") dotted lines (lty = 2) at x=0 (h=0) & y=0 (v=0) with the function "abline". 
#3. Implement the percent variation explained into the plot axes. 
#	a. First, within the output$pcaplot's renderPlot function, create an object "pcaper" to subset pca_percent for when pca_percent$Var==input$var
#	b. Within the plot function, adjust the xlab and ylab parameters. With the "paste" function, for xlab, add "pcaper[2]" as the x-axis percent variation explained: xlab=paste("PCA Axis 1 (",pcaper[2],"%)")
#		Do the same for ylab, where instead use pcaper[3]
#4. Use the R expressions instead to display labels. Paste the following code into your script:
	# output$pcaplot <- renderPlot({
		# ...
		# for(i in levels(fbar$param)){
			# foo2<-subset(fbar,param==i)
			# labs<-paste("c(",paste("expression(",foo2$Rexpression,")",sep="",collapse=","),")",sep="")
			# text(PC2 ~ PC1, data=foo2, labels=eval(parse(text=labs)), col=cols[which(levels(fbar$param)==i)],  cex=input$cexSlider)
		# }
		# ...
	# })

#HINTS
# 1.b 
# shinyServer(function(input, output) {
	# output$paramchkbxgrp <- renderUI({...})
	
	#********ADD THIS SCRIPT********
	# #X-axis
	  	# output$sliderX <-renderUI({
			# sliderInput(inputId="SLIDERX", 
				# label = h5("x-axes"), 
				# min = min(subset(foo,Var==input$var)[,"PC1"]), 
				# max = max(subset(foo,Var==input$var)[,"PC1"]), 
				# value = c(min(subset(foo,Var==input$var)[,"PC1"]),max(subset(foo,Var==input$var)[,"PC1"])))
		# })
	# #Y-axis
	  	# output$sliderY <-renderUI({
			# sliderInput(inputId="SLIDERY", 
				# label = h5("y-axes"), 
				# min = min(subset(foo,Var==input$var)[,"PC2"]), 
				# max = max(subset(foo,Var==input$var)[,"PC2"]), 
				# value = c(min(subset(foo,Var==input$var)[,"PC2"]),max(subset(foo,Var==input$var)[,"PC2"])))
		# })
	#*******************************
	
	# output$pcaplot <- renderPlot({...})
# })

#1.c.	
#	output$pcaplot <- renderPlot({
#		...
#	plot(PC2 ~ PC1, data=fbar, type="n", xlab="PC1", ylab="PC2", xlim=input$SLIDERX, ylim=input$SLIDERY)
#		...
# })
#2.	
#	output$pcaplot <- renderPlot({
#		...
#	plot(PC2 ~ PC1, data=fbar, type="n", xlab="PC1", ylab="PC2", xlim=input$SLIDERX, ylim=input$SLIDERY)
#	abline(h=0,v=0,col="red",lty=2)
#		...
# })
#
#3.	
#	output$pcaplot <- renderPlot({
#		fbar<-droplevels(...)

#		pcaper<-pca_percent[which(pca_percent$Var==input$var),]
#		
#		plot(PC2 ~ PC1, data=fbar, type="n", xlim=input$SLIDERX, ylim=input$SLIDERY,
#			xlab=paste("PCA Axis 1 (",pcaper[2],"%)"),
#			ylab=paste("PCA Axis 2 (",pcaper[3],"%)"))
#		
#		...
#	})
