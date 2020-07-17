library(dplyr)
library(reshape2)
library(readr)

receptor <- read.table("Raw Data/Correlation IL2RB Mature NK.txt", header = TRUE, sep = "\t")
str(receptor)
colnames(receptor)[colnames(receptor) == "target.gene"] <- "Gene"

list <- read.csv("Raw Data/Genes_correlated_with_sepsis.csv", header = FALSE)
colnames(list) <- "Gene"

result <- filter(receptor, Gene %in% list$Gene)
result$entrez <- NULL
result$target.probe <- NULL
result$source.probe <- NULL

write.csv(result, file = "Results/IL2RB Result.csv")