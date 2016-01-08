#script to make the 3rd plot


# create file plot 3 
png("plot3.png", 
    width = 480, height = 480, units = "px" # actually not needed (default values)
)

# do the plot (note that weekdays depend on the language of your OS)
plot(data$Time,  data$Sub_metering_1, type = "l",             xlab ="", ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_2, type = "l",col = "red"  )
lines(data$Time, data$Sub_metering_3, type = "l",col = "blue" )

legend("topright",legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty = 1)

# close the file
dev.off()