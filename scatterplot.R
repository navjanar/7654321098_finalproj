movies <- read.csv("movies.csv")
setwd("C:/Users/Owner/Documents/nodcnw/INFO_201/info final project/")

hiyo <- subset(movies, budget != 0 & revenue != 0)

hey <- hiyo[sample(nrow(hiyo), 10), ]


library(ggplot2)
# Basic scatter plot


ggplot(hey, aes(x=budget, y=revenue, label=title))
 + geom_point(size=4, shape=16, colour="blue") 
 + labs(y= "Revenue", x = "Budget") 
 + geom_text(aes(label=title),hjust=-.1, vjust=.3) 
 + ggtitle("Budget vs Revenue Comparison")
