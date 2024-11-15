library(ggplot2)

df <- read.table("data/q2_data.tsv", header = FALSE, col.names = c("X","Y","Category"))
#print (df)
ggplot(df, aes(x=X,y=Y,color=Category,group=Category)) + 
	geom_line(linewidth=1) + 
	geom_point(size=2) + 
	labs(title = "line plot with categories", x = "X-axis", y = "Y-axis") + 
	theme_minimal()
