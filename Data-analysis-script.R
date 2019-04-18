# R script to analyse data from nerve recording experiments
# Code by Leonardo Silvestri and Yuan Wei 

# Packages
#library(ggplot2)
#library(signal)

# Input variables
dataDir <- "2019_04_12_Rabbit_experiment_5"
dataFilename <- "Optical.txt"

# Read data from file (assumes a certain format)
inputFile<- paste(dataDir,"/",dataFilename,sep="")
infoString <- read.table(inputFile,skip=0, nrows = 9, sep="=", header=FALSE, stringsAsFactors = FALSE) # Read first 9 lines

