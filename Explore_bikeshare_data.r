library(tidyverse) # Loading the package collection of tidyverse to simplify the code
ny = read.csv('new_york_city.csv')
wash = read.csv('washington.csv')
chi = read.csv('chicago.csv')

head(ny) # Printing the head of the data frame of ny

head(wash) # Printing the head of the data frame of wash

head(chi)  # Printing the head of the data frame of chi

str(wash) # Use this function to exlore the structure of the wash data frame (7 variables (columns) and 89051 observations(rows))

summary(wash) # To get statistical overview of the dataframe (df)"wash"

# Dropping missing values from df "wash"

wash <- na.omit(wash)

# Extracting the "Start.Time" column from wash to create a new df "month_df"

month_df <- data.frame(wash$Start.Time)

# Creating a new column for weekdays using the library "lubridate"

month_df <- mutate(month_df, month_start = months(as.Date(wash$Start.Time)))

 # Extracting the "Start.Time" column from the df"wash" to create a new df translating the start time into month-names

wkday_df <- data.frame(wash$Start.Time)

# Create a new column for weekdays using the library lubridate

wkday_df <- mutate(wkday_df, weekday_start = weekdays(as.Date(wash$Start.Time)))

# Counting the bike rentals per month

count(month_df, month_start)

# Plotting Months (Start Time)

# Creating Data & Aesthetics Layer

pl <- ggplot(data= month_df, aes(x = month_start)) + labs(fill = "User Type", title = 'Rental by month', x = "Months", y = "Number of rentals")

# Geometry layer plus changing colors

pl2 <- pl + geom_bar(aes(fill=wash$User.Type)) + scale_fill_hue(limits = c("Customer", "Subscriber")) +
theme(axis.text.x = element_text(angle = 45, hjust = 1))
# The main title, x and y axis labels
pl3 <- pl2 + theme(
plot.title = element_text(color="black", size=14, face="bold.italic"),
axis.title.x = element_text(color="black", size=14, face="bold"),
axis.title.y = element_text(color="black", size=14, face="bold"))

# Plotting of bar chart

print(pl3)

# Counting the bike rentals per weekday

count(wkday_df, weekday_start)

# Plotting Weekdays (Start Time)

# Data & Aesthetics Layer

pl <- ggplot(data= wkday_df, aes(x = weekday_start)) + labs(fill = "User Type", title = 'Rental by weekday', x = "Weekdays", y = "Number of rentals")

# Geometry layer plus changing colors

pl2 <- pl + geom_bar(aes(fill=wash$User.Type)) + scale_fill_hue(limits = c("Customer", "Subscriber")) +
theme(axis.text.x = element_text(angle = 45, hjust = 1))
# the main title, x and y axis labels
pl3 <- pl2 + theme(
plot.title = element_text(color="black", size=14, face="bold.italic"),
axis.title.x = element_text(color="black", size=14, face="bold"),
axis.title.y = element_text(color="black", size=14, face="bold"))

# Plotting of bar chart

print(pl3)


summary(ny) # To get statistical overview of the dataframe "ny"

# Calculation of the average trip duration using the aggregate function of the packahe "dplyr"

aggregate(Trip.Duration~Gender,ny,mean)

# Creating a new data frame

trip_df <- aggregate(Trip.Duration ~Gender,ny,mean)

trip_df

trip1_df = trip_df[-c(1),] # Removing the first row

trip1_df

# Converting the time from seconds to minutes and renaming the column

trip1_df <- transmute(trip1_df, Gender, Trip.Dur.Avg = Trip.Duration /60)

trip1_df

# Plotting average trip duration

# Data & Aesthetics Layer

trip2 <- ggplot(data= trip1_df, aes(x = Gender, y = Trip.Dur.Avg)) + labs(title = 'Average trip duration male vs. female', x = "Gender", y = "Trip duration in min")

# Geometry layer plus changing colors

trip3 <- trip2 + geom_col() +
theme_classic()
# The main title, x and y axis labels
trip4 <- trip3 + theme(
plot.title = element_text(color="black", size=14, face="bold.italic"),
axis.title.x = element_text(color="black", size=14, face="bold"),
axis.title.y = element_text(color="black", size=14, face="bold"))

# Plotting of bar chart

print(trip4)

head(chi)

summary(chi) # To get statistical overview of the dataframe "chi"

# Dropping missing values from df "chi"

chi <- na.omit(chi)

# Removing rows that are not of gender male or female using the filter function of the package dplyr

f_df <- filter(chi, Gender != "")

# Calculating the average of the birth year using the pipe and the dplyr package

chi %>%
    group_by(Gender) %>%
    summarize(Mean = mean(Birth.Year, na.rm=TRUE))

# Facet Plotting

# Creating Data & Aesthetics Layer

a <- ggplot(f_df, aes(x = Birth.Year)) + labs(title = "Distribution of Age / Birth Years", x = "Year of Birth", y = "Number of Individuals")

# Creation of a Histogram Plot

a + geom_histogram(aes(color = Gender, fill = Gender), binwidth = 1,stat ="bin", alpha=0.6) +
  theme_minimal() +
 facet_grid(rows=vars(Gender)) # Facet into rows based on Gender

# Creation of a Histogram Plot

# Creating Data & Aesthetics Layer

b <- ggplot(f_df, aes(x = Birth.Year))+ labs(title = "Distribution of Age / Birth Years", x = "Year of Birth", y = "Number of Individuals")

# Geometry layer

c <- b + geom_histogram(aes(color = Gender, fill = Gender), binwidth = 1,stat ="bin", alpha=0.6) +
  theme_classic()

# Plotting of histogram

print(c)
