### Created on 28 Mar 2020


### Bike Sharing


### Description
Over the past decade, bicycle-sharing systems have been growing in number and popularity in cities across the world. Bicycle-sharing systems allow users to rent bicycles on a very short-term basis for a price. This allows people to borrow a bike from point A and return it at point B, though they can also return it to the same location if they'd like to just go for a ride. Regardless, each bike can serve several users per day.

Thanks to the rise in information technologies, it is easy for a user of the system to access a dock within the system to unlock or return bicycles. These technologies also provide a wealth of data that can be used to explore how these bike-sharing systems are used.

In this project, I used data provided by Motivate, a bike share system provider for many major cities in the United States, to uncover bike share usage patterns. In this project the system usage between three large cities is used: Chicago, New York City, and Washington, DC.

### Area of interests
The following questions were answered:

1. What is the most common month and most common weekday for bike rentels in Washington?
2. What is the average travel time of males compared to females in New York?
3. What is the most common year of birth of males and females in Chicago and how many bike sharers were younger than 18 years or born later than 1999, respectively?

### Files used
chicago.csv
new_york_city.csv
washington.csv

### Datasets

Randomly selected data for the first six months of 2017 are provided for all three cities. Udacity performed some data wrangling to condense these files to the below core columns. Thus, all three of the data files contain the same core six columns:

* Start Time (e.g., 2017-01-01 00:07:57)
* End Time (e.g., 2017-01-01 00:20:53)
* Trip Duration (in seconds - e.g., 776)
* Start Station (e.g., Broadway & Barry Ave)
* End Station (e.g., Sedgwick St & North Ave)
* User Type (Subscriber or Customer)

The Chicago and New York City files also have the following two columns:

* Gender
* Birth Year

### Credits
Thank you [Motivate](https://www.motivateco.com/) for providing the data and also special thanks to [Udacity](https://www.udacity.com/course/programming-for-data-science-nanodegree-with-R--nd118) for making this great project possible.
