#Author: Nick Duellman 

# This code is designed to generate three separate line graphs for the Hart Pond Phosphorus data by examining location, measurements, and depth



# Install packages

install.packages("ggplot2")
install.packages("tidyverse")
install.packages("tidyr")
install.packages("readr")

library(tidyverse)
library(tidyr)
library(ggplot2)
library(readr)


# Location: Dock Surface and Bottom

# Import data

phos_data <-read.csv('https://raw.githubusercontent.com/duellmannj/Phosphorus_data_HartPond/refs/heads/main/Phos_csv_dock%20-%20Dock.csv')

# Transform data using tidyr package

phos.df <- pivot_longer(phos_data, cols = 2:4, names_to = "Phosphorus Type", values_to = "Value")
head(phos.df)

# Generate line graphs using ggplot



p <- ggplot(phos.df, aes(x = Date, y = Value, color = `Phosphorus Type`, linetype = Depth, group = interaction(`Phosphorus Type`, Depth))) +
    geom_line(linewidth = 1) +
    geom_point(size = 2) +
    facet_wrap( ~ `Phosphorus Type`) +
    labs( title = "Phosphorus Measurements of the Dock Surface and Bottom in Hart Pond across sampling period",
          x = "Date",
          y = "Value",
          color = "Phosphorus Type",
          linetype = "Depth") +
    theme_classic() +
    theme(
      plot.title = element_text(hjust = 0.5),
      legend.position = "right"
    )

print(p)


# Location: Dam Surface and Bottom

phos_data <- read.csv('https://raw.githubusercontent.com/duellmannj/Phosphorus_data_HartPond/refs/heads/main/Phos_csv_dock%20-%20Dam.csv')

phos.df <- pivot_longer(phos_data, cols = 2:4, names_to = "Phosphorus Type", values_to = "Value")
head(phos.df)



p <- ggplot(phos.df, aes(x = Date, y = Value, color = `Phosphorus Type`, linetype = Depth, group = interaction(`Phosphorus Type`, Depth))) +
  geom_line(linewidth = 1) +
  geom_point(size = 2) +
  facet_wrap( ~ `Phosphorus Type`) +
  labs( title = "Phosphorus Measurements of the Dam Surface and Bottom in Hart Pond across sampling period",
        x = "Date",
        y = "Value",
        color = "Phosphorus Type",
        linetype = "Depth") +
  theme_classic() +
  theme(
    plot.title = element_text(hjust = 0.5),
    legend.position = "right"
  )

print(p)








# Location: Stream

phos_data <- read.csv('https://raw.githubusercontent.com/duellmannj/Phosphorus_data_HartPond/refs/heads/main/Phos_csv_dock%20-%20Stream.csv')

phos.df <- pivot_longer(phos_data, cols = 2:4, names_to = "Phosphorus Type", values_to = "Value")
head(phos.df)

p <- ggplot(phos.df, aes(x = Date, y = Value, color = `Phosphorus Type`, linetype = Depth, group = interaction(`Phosphorus Type`, Depth))) +
  geom_line(linewidth = 1) +
  geom_point(size = 2) +
  facet_wrap( ~ `Phosphorus Type`) +
  labs( title = "Phosphorus Measurements of the Stream Surface in Hart Pond across sampling period",
        x = "Date",
        y = "Value",
        color = "Phosphorus Type",
        linetype = "Depth") +
  theme_classic() +
  theme(
    plot.title = element_text(hjust = 0.5),
    legend.position = "right"
  )

print(p)







