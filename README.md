# Netflix_Titles_EDA

## 📜 Project Overview

This repository contains an Exploratory Data Analysis (EDA) project focused on the Netflix Titles dataset. The dataset includes information about movies and TV shows available on Netflix, and the goal is to uncover trends, patterns, and insights into the content library. This project specifically uses SQL to manipulate and analyze the dataset, with a focus on content types, ratings, release years, genres, and countries.

## 📂 Dataset Information

- **Dataset Source**: Kaggle  
  The dataset used for this analysis was sourced from Kaggle and contains information about Netflix's catalog of titles. It includes attributes like show type, title, release year, duration, genres, ratings, and more. You can access the dataset on Kaggle (search for "Netflix Titles Dataset").

- **Key Attributes**:
  - `show_id`: A unique identifier for each title.
  - `type`: Content type (e.g., Movie, TV Show).
  - `title`: Title of the content.
  - `director`: Director(s) of the content.
  - `cast`: Cast members in the content.
  - `country`: Country of production.
  - `date_added`: Date the title was added to Netflix.
  - `release_year`: Year the title was released.
  - `rating`: Rating (e.g., TV-MA, PG-13).
  - `duration`: Duration in minutes for movies or seasons for TV shows.
  - `listed_in`: Genres or categories the title belongs to.
  - `description`: Brief description of the content.

## 🚀 Objectives

- **Data Cleaning**: Handle missing values, duplicate entries, and ensure consistency across the dataset.
- **Data Analysis**: 
  - Identify the most popular content types (Movies vs. TV Shows).
  - Investigate the trends in content addition over the years.
  - Analyze the distribution of ratings, genres, and countries.
  - Explore the relationship between content duration and genre.
- **Visualization**:
- Visualize the distribution of content types (Movies vs. TV Shows) to understand the content landscape on Netflix.
- Display trends in the number of titles added to Netflix over the years to analyze Netflix's content growth.
- Show the distribution of content ratings to understand how different titles are rated.
- Explore the top directors and most popular genres based on the number of titles.

## 🔧 Tools and Libraries Used

- **SQL**: The dataset is analyzed using SQL queries for filtering, aggregation, and summarizing key patterns in the data.
- **Python**: For further analysis and visualization.
- **Libraries** (for visualizations):
  - Pandas
  - Matplotlib
  - Seaborn

## 📝 SQL Script Details

The provided SQL script (`EDA_on_Netflix_Titles.sql`) contains all the queries used to manipulate and explore the dataset. Here’s an overview of the SQL process:

1. **Data Cleaning**:
   - Removing rows with missing `title` or `type`.
   - Standardizing the `release_year` format.
   - Converting the `duration` column to a consistent format.

2. **Exploratory Queries**:
   - Query to get a count of Movies vs. TV Shows.
   - Query to identify the most common genres and their distribution.
   - Query to analyze Netflix’s content addition trends by year.
   - Query to explore the country-wise distribution of content.

3. **Aggregations**:
   - Aggregating content by `rating` to see how content is rated.
   - Grouping by `release_year` and `type` to identify trends over time.
   - Calculating average duration by genre.

## 📊 Insights & Highlights

- **Content Distribution**: The dataset provides insights into the proportion of movies versus TV shows available on Netflix.
- **Release Trends**: An analysis of Netflix’s content addition trends over the years.
- **Genres and Ratings**: Exploration of how genres are distributed and the ratings associated with each genre.
- **Country-wise Content**: Distribution of Netflix titles across different countries, revealing global trends.
- **Duration Analysis**: Insights into how content duration varies across genres and types (movies vs. TV shows).

## 🛠️ How to Use

1. **Clone the repository** to your local machine:
   ```bash
   git clone https://github.com/yourusername/EDA-on-Netflix-Titles.git
   ```
2. **Set up a database**: Import the dataset into a SQL database (MySQL, SQLite, or PostgreSQL) using the CSV or relevant format.
3. **Run the SQL script**: Execute the SQL script (`EDA_on_Netflix_Titles.sql`) in your SQL environment to perform data cleaning, transformation, and analysis.
4. **Optional Analysis with Python**: For additional visualization, you can export the cleaned data and use Python for further analysis and to create charts with libraries like Matplotlib or Seaborn.
