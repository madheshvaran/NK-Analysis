library(dplyr)

receptor <- read.table("Raw Data/Correlation IL2RB Mature NK.txt", header = TRUE, sep = "\t")
#Run this code for all other cytokine receptor files
str(receptor)
colnames(receptor)[colnames(receptor) == "target.gene"] <- "Gene"

list <- read.csv("Raw Data/Genes_correlated_with_sepsis.csv")
str(list)

result <- filter(receptor, Gene %in% list$Gene)
result$entrez <- NULL
result$target.probe <- NULL
result$source.probe <- NULL
result <- merge(result, list)

result <- result[with(result, order(Score)), ]

write.csv(result, file = "Results/IL2RB Result.csv")