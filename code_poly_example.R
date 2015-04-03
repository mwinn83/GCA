# Example of how to use the `code_poly` function

library(ggplot2)
library(dplyr)

code_poly_URL <- "https://raw.githubusercontent.com/mwinn83/GCA/master/code_poly.R"

source(code_poly_URL)


# Generate some fake data
my_data_A <- data.frame(Time = seq(0, 1500, 2), Group="A") %>%
  mutate(Response = 1000 + 
                    ((Time-750)*2) + 
                    (((Time-750)^2)*-0.00025) +
                    (((Time-750)^3)*-0.0000015))

my_data_B <- data.frame(Time = seq(0, 1500, 2), Group="B") %>%
  mutate(Response = 1000 + 
                    ((Time-750)*1.5) + 
                    (((Time-750)^2)*-0.00035) +
                    (((Time-750)^3)*-0.0000010))

# put it together in one data.frame
my_data <- rbind(my_data_A, my_data_B)
rm(my_data_A, my_data_B)

# view the data plot
ggplot(my_data, aes(x=Time, y=Response, color=Group))+
  geom_point()

# add polynomials to the data frame
my_data.poly <- code_poly(df=my_data, predictor="Time", poly.order=3, 
                          orthogonal=TRUE, draw.poly=TRUE)

