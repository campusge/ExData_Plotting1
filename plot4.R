# create file plot 4 
png("plot4.png", 
    width = 480, height = 480, units = "px" # actually not needed (default values)
)

# create array of plot cells
par(mfcol = c (2,2))


# 1st plot 
plot(data$Time, data$Global_active_power, type = "l", xlab ="", ylab = "Global Active Power")


# 2nd plot
plot(data$Time,  data$Sub_metering_1, type = "l",              xlab ="", ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_2, type = "l", col = "red"  )
lines(data$Time, data$Sub_metering_3, type = "l", col = "blue" )
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = 1)


# 3rd plot
plot(data$Time,  data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#4th plot
plot(data$Time,  data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")



# close the file
dev.off()