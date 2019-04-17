# R script to analyse data from nerve recording experiments
# Code by Leonardo Silvestri and Yuan Wei 

# Packages
#library(ggplot2)
#library(signal)

# Input variables
dataDir <- "2019_04_12_Rabbit_experiment_5"
dataFilename <- "2019_04_15_DVdetector.txt"

# Read data from file (assumes a certain format)
inputFile<- paste(dataDir,"/",dataFilename,sep="")
infoString <- read.table(inputFile,skip=0, nrows = 9, sep="=", header=FALSE, stringsAsFactors = FALSE) # Read first 9 lines
dataTime <- strptime(strsplit(infoString[[2]][[2]],"\t")[[1]][[3]],format="%d/%m/%Y %H:%M:%S") # Reads time data was collected
dataTable <- read.table(inputFile,skip=9, sep="\t", header=FALSE)

