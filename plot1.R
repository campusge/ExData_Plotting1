#  script to load data and make the 1st plot

# load required packages
# create a list of packages 
packages <- c("data.table", "dplyr")

# apply to each package the function require that load the package
sapply(packages, require, character.only=TRUE, quietly=TRUE)


# insert a flag to set if the data should be downloaded: it should be done only once.
download_data = FALSE


# set the address of the file
url.file <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

# working dir
path.wd <- getwd()

# name of the data folder (if empty string or NULL data in the current directory)
dir.data <- "data"

# path where data folder will be placed
path.data <- file.path(path.wd, dir.data)

# if the directory is set and does not exist, than create it
if(!nchar(dir.data) | !is.null(dir.data)){
        if (!file.exists(dir.data)){
                dir.create(dir.data)
        }
}

# name of the zip file containing the data
name.data <- "household_power_consumption"
zipped.data <- paste0(name.data,".zip")
unzipped.data <- paste0(name.data,".txt")

# full path of the data zip
zipped.data.fullpath <- file.path(path.data,zipped.data)
unzipped.data.fullpath <- file.path(path.data,unzipped.data)

# if data were still not downloaded
if(download_data) {
        # download data
        download.file(url = url.file,destfile = data.fullpath)
        # unzip data
        unzip(data.fullpath,exdir=path.data)
}

# read data
data <- fread(unzipped.data.fullpath, sep = ";", na.strings="?") %>%
        # convert time and date in right format
         mutate(Time = as.POSIXct(strptime(paste0(Date,Time),format = "%d/%m/%Y%H:%M:%S")),
                Date = as.Date(Time)) %>% 
        # select dates
        filter(Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02" ))

# create file plot 1 
png("plot1.png", 
    width = 480, height = 480, units = "px" # actually not needed (default values)
    )

# do the plot
hist(data$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)",ylab = "Frequency",main = "Global Active Power")

# close the file
dev.off()

