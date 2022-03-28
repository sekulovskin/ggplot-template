#===============================
#  ggplot template
#  inspired by: http://r-statistics.co/Complete-Ggplot2-Tutorial-Part1-With-R-Code.html
#==============================

library(ggplot2)

# You can set the theme from the beginning, before you actually start plotting 

theme_set(theme_bw())  # you can change theme_bw to theme_classic and so on

#Access the ggplot cheat sheet by: RStudio -> Help -> Cheat Sheets -> Data Visualization with ggplot2

###### 1 Define the plot----------------------------------
  
g <- ggplot(data, aes(x = , y = )) +
  geom_

#for a full list of geoms see, eg: http://sape.inf.usi.ch/quick-reference/ggplot2/geom)

# If you have aesthetics representing factor variables within the plot:
#(more advanced options for this agre given in step 6, line 122)

# If you want to adjust the legend add:
 + theme(legend.position="")  #where inside the "": none; top, bottom, side....

# to change the color palette add

palette <- ""

# to see available palettes:
#library(RColorBrewer)
head(brewer.pal.info, 10)  # show 10 palettes

 + scale_colour_brewer(palette = palette) 


# Just changing the color without mapping it to a variables (just exclude aes)

  + geom_point(col = "red", size = 3)


###### 2 Adjusting the axes ---------------------------------

  
## 2A Deleting points (not recommended)

  g + xlim(c(min = , max = )) + ylim(c(min = , max = ))


## 2B Zooming in

#Instead of completely deleting the values outside of the range, we can zoom-in instead 

  g + coord_cartesian(c(min = , max = )) + ylim(c(min = , max = ))


###### 3 Adding titles, labels and subtitles -----------------------

title <- ""
subtitle <- ""
x <- ""
y <- ""
caption <- ""

 g + labs(title = title, subtitle = subtitle, x = x, y = y, caption = caption)

###### 4 Change axes text and ticks--------------------------

# set the breaks
min.x <- 
max.x <- 
by.x <- 

min.y <- 
max.y <- 
by.y <-

 g + scale_x_continuous(breaks=seq(min.x, max.x, by.x)) +
      scale_y_continuous(breaks=seq(min.x, max.x, by.x))

# add labels

 g + scale_x_continuous(breaks=seq(min.x, max.x, by.x), labels = letters[1:11]) +
  scale_y_continuous(breaks=seq(min.x, max.x, by.x), labels = letters[1:11])

###### 5 Reverse the scale------------------------------

 g + scale_x_reverse() +
  scale_y_reverse()

###### 6 Customize the plot through the theme-------------------

## Customizing plot and axis titles 

# vjust ->  controls the vertical spacing between title (or label) and plot.
# hjust ->  controls the horizontal spacing. Setting it to 0.5 centers the title.
# family-> is used to set a new font
# face  ->  sets the font face ("plain", "italic", "bold", "bold.italic")
 
 g + theme(plot.title=element_text(size=20, 
                                         face="bold", 
                                         family="American Typewriter",
                                         color="tomato",
                                         hjust=0.5,
                                         lineheight=1.2),  # title
                 plot.subtitle=element_text(size=15, 
                                            family="American Typewriter",
                                            face="bold",
                                            hjust=0.5),  # subtitle
                 plot.caption=element_text(size=15),  # caption
                 axis.title.x=element_text(vjust=10,  
                                           size=15),  # X axis title
                 axis.title.y=element_text(size=15),  # Y axis title
                 axis.text.x=element_text(size=10, 
                                          angle = 30,
                                          vjust=.5),  # X axis text
                 axis.text.y=element_text(size=10))  # Y axis text

###### 7 Modifying the legend-------------------


#### 7A: change the legend title (I am using the labs() method for this)

 g + labs(color="your factor variable", size="your conttinuous variable") 
#this is just an example, of course you can change the aesthetics type, based on what you've specified in geom_..


####7B: change legend labels and colors for categories: 

 g + scale_color_manual(name="your factor variable", 
                             labels = c("", ""), 
                             
                             values = c(""="blue", 
                                        ""="red"))

#### 7C: change the order of the legend:

 g + guides(colour = guide_legend(order = 1),
                 size = guide_legend(order = 2))  #as previously the aesthetics color/size can be changed ti the desired ones specified in goem

### 7D: Style

 g + theme(legend.title = element_text(size=, color = ""), #the size and color of the title of the legend
                legend.text = element_text(size=), #the size of the elements within the legend 
                legend.key = element_rect(fill='springgreen')) + #background color of the legend 
  
  
### 7E: Remove legend or change its position 
  
  
  # No legend 
 g + theme(legend.position="None") + labs(subtitle="No Legend")

# Legend to the left 
 g + theme(legend.position="left") + labs(subtitle="Legend on the Left")

# legend at the bottom and horizontal 
 g + theme(legend.position="bottom", legend.box = "horizontal") + labs(subtitle="Legend at Bottom")

# legend at bottom-right, inside the plot 
 g + theme(legend.title = element_text(size=12, color = "salmon", face="bold"),
           legend.justification=c(1,0), 
           legend.position=c(0.95, 0.05),  
           legend.background = element_blank(),
           legend.key = element_blank()) 

# legend at top-left, inside the plot 
 g + theme(legend.title = element_text(size=12, color = "salmon", face="bold"),
           legend.justification=c(0,1), 
           legend.position=c(0.05, 0.95),
           legend.background = element_blank(),
           legend.key = element_blank()) 


###### 8 Adding text and/or labels within the plot-------------------

### 8A: Adding text around the points (in the case of a scatter plot, but it also generalizes to lineplots and so on)

# Plot text and label ------------------------------------------------------
 g + geom_text(aes(label== "your labels defined in a variable of a data frame"), size=2, data = "the data frame") + theme(legend.position = "None")   # text

 g + geom_label(aes(label== "your labels defined in a variable of a data frame"), size=2, data = "the data frame", alpha=0.25) + theme(legend.position = "None")  # label

# Using ggrapel package  ------------
library(ggrepel)
 
 g + geom_text_repel(aes(label == "your labels defined in a variable of a data frame"), size=2, data= "the data frame") + theme(legend.position = "None")   # text

 g + geom_label_repel(aes(label == "your labels defined in a variable of a data frame"), size=2, data= "the data frame") + theme(legend.position = "None")   # label


### 8B: Adding test/annotations anywhere in the plot 

library(grid)
my_text <- "Text"
my_grob = grid.text(my_text, x=0.7,  y=0.8, gp=gpar(col="firebrick", fontsize=14, fontface="bold"))

 g + annotation_custom(my_grob)



###### 9 Facetting ------------------------------

### 9A Facet wrap:

# variable = variable on which you wish to divide the plot into multiple subplots 
# Facet wrap with common scales
 g + facet_wrap( ~ variable, nrow=3) + labs(title="", caption = "", subtitle="")  

# Facet wrap with free scales
 g + facet_wrap( ~ variable, scales = "free") + labs(title="", caption = "", subtitle="")


### 9B Facet grid: (here you cannot manually choose the number of rows and columns, but it gives more space for the actual plots)

 g + facet_grid("variable in rows" ~ "variable in columns") 

### EXTRA: it is possible to plot multiple gird plots toghether 
library(gridExtra)

 g + facet_grid("variable in rows" ~ "variable in columns")  
 g + facet_grid("variable in rows" ~ "variable in columns")  

grid.arrange(gg1, gg2, ncol=2)

###### 10 Background ------------------------------

### 10A: Plot background 

 g + theme(panel.background = element_rect(fill = 'khaki'),
                panel.grid.major = element_line(colour = "burlywood", size=1.5),
                panel.grid.minor = element_line(colour = "tomato", 
                                                size=.25, 
                                                linetype = "dashed"),
                panel.border = element_blank(),
                axis.line.x = element_line(colour = "darkorange", 
                                           size=1.5, 
                                           lineend = "butt"),
                axis.line.y = element_line(colour = "darkorange", 
                                           size=1.5)) 

## Add margins 

 g + theme(plot.background=element_rect(fill="salmon"), 
                plot.margin = unit(c(2, 2, 1, 1), "cm"))

### 10B: remove axes , border, text and ticks 

 g + theme(panel.grid.major = element_blank(), 
                panel.grid.minor = element_blank(), 
                panel.border = element_blank(),
                axis.title = element_blank(), 
                axis.text = element_blank(),
                axis.ticks = element_blank())


###### 11 Add an image within the plot ------------------------------

library(grid)
library(png)

img <- png::readPNG("location of image")  
g_pic <- rasterGrob(img, interpolate=TRUE)

 g + theme(panel.grid.major = element_blank(), 
                panel.grid.minor = element_blank(), 
                plot.title = element_text(size = rel(1.5), face = "bold"),
                axis.ticks = element_blank()) + 
  annotation_custom(g_pic, xmin=5, xmax=7, ymin=30, ymax=45)


 
 #===================================================================
 # Advanced features 
 #===================================================================
 
 
 ###### 12 Encircling (best with scatterplots)------------------------------
 
 # install 'ggalt' pkg
 # devtools::install_github("hrbrmstr/ggalt")
 
 library(ggalt)
 
 #you need to construct a data set that is defines the part you want to encircle 
 
 data_select <- 
   
   
   g + geom_encircle(aes(x=x, y=y), #the same as in g 
                      data=data_select, 
                      color="red", 
                      size=2, 
                      expand=0.08)
 
 
 
 
 ##### 13 Count charts --------------------------------
 
 g + geom_count(col="tomato3", show.legend=F) 
 
 
 #### 14 Marginal plots --------------------------
 library(ggExtra)
 
 ## 14 A Histograms 
 
 ggMarginal(g, type = "histogram", fill="transparent")
 
 ## 14 B Boxplots 
 
 ggMarginal(g, type = "boxplot", fill="transparent")
 
 ## 14 C Density plots 
 
 ggMarginal(g, type = "density", fill="transparent")
 
 
 #### 15 Time series plots --------------------
 
 ## 15 A  for one category 
 
 g <- ggplot(data, aes(x=x)) + 
   geom_line(aes(y= y))
             
 ## 15 B  for multiple categories 
 
 g <- ggplot(data, aes(x=x)) + 
   geom_line(aes(y= y, col = factor))
                         
 

#### Plot

plot()

#### Save

ggsave("")
  
