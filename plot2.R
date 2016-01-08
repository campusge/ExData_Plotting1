#script to make the 2nd plot

# create file plot 2 
png("plot2.png", 
    width = 480, height = 480, units = "px" # actually not needed (default values)
)

# do the plot (note that weekdays depend on the language of your OS)
plot(data$Time, data$Global_active_power, type = "l", xlab ="", ylab = "Global Active Power (kilowatts)")


# close the file
dev.off()