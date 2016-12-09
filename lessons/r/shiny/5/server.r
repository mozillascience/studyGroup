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
	
	#X-axis
	output$sliderX <-renderUI({
		sliderInput(inputId="SLIDERX", 
			label = h5("x-axes"), 
			min = min(subset(foo,Var==input$var)[,"PC1"]), 
			max = max(subset(foo,Var==input$var)[,"PC1"]), 
			value = c(min(subset(foo,Var==input$var)[,"PC1"]),max(subset(foo,Var==input$var)[,"PC1"])))
	})
	#Y-axis
	output$sliderY <-renderUI({
		sliderInput(inputId="SLIDERY", 
			label = h5("y-axes"), 
			min = min(subset(foo,Var==input$var)[,"PC2"]), 
			max = max(subset(foo,Var==input$var)[,"PC2"]), 
			value = c(min(subset(foo,Var==input$var)[,"PC2"]),max(subset(foo,Var==input$var)[,"PC2"])))
	})
		
	#Create a reactive Shiny plot to send to the ui.r called "pcaplot"
	output$pcaplot <- renderPlot({
		#Match user's variable input selection by subsetting for when foo$Var==input$var
		fbar<-droplevels(foo[which(foo$Var==input$var),])
		
		#Generate colors to correspond to the different Variables' parameters. E.g., for the variable "colless", different colors for "loIc","midIc", and "hiIc"
		cols<-c("#1f77b4","#ff7f0e","#2ca02c")[1:length(levels(fbar$param))]
		
		#If the param is not selected, set the color value to grey with transparency
		cols[which(!(levels(fbar$param) %in% input$PARAMS))]<- rgb(0,0,0, alpha=25,maxColorValue=255)
		
		#Subset the pca_percent function for when Var==input$var
		pcaper<-pca_percent[which(pca_percent$Var==input$var),]
		#Render the scatterplot of PCA
		plot(PC2 ~ PC1, data=fbar, type="n", xlim=input$SLIDERX, ylim=input$SLIDERY,
			xlab=paste("PCA Axis 1 (",pcaper[2],"%)"),
			ylab=paste("PCA Axis 2 (",pcaper[3],"%)"))
		abline(h=0,v=0,col="red",lty=2)

		#For each of the different parameter values (different colors), plot the text names of the metrics
		for(i in levels(fbar$param)){
			foo2<-subset(fbar,param==i)
			labs<-paste("c(",paste("expression(",foo2$Rexpression,")",sep="",collapse=","),")",sep="")
			text(PC2 ~ PC1, data=foo2, labels=eval(parse(text=labs)), col=cols[which(levels(fbar$param)==i)],  cex=input$cexSlider)
		}
		
		#Add a legend for the different parameter values (with corresponding colors) of the selected Variable
		legend("topright", fill=cols, legend=levels(fbar$param))
		
  })
})

