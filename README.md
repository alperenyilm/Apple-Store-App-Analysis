
# Apple Store App Analysis

## Table of Contents
- [Project Overview](#project-overview)
- [Technologies Used](#technologies-used)
- [Dataset](#dataset)
  - [Database Structure](#database-structure)
  - [Data Cleaning and Preparation](#data-cleaning-and-preparation)
- [Exploratory Data Analysis (EDA)](#exploratory-data-analysis-eda)
- [Data Analysis](#data-analysis)
- [Results/Findings](#resultsfindings)
- [Recommendations](#recommendations)
- [Limitations](#limitations)

### Project Overview
This project analyzes Apple Store apps to uncover trends, patterns, and relationships within the app marketplace. The data includes information about app sizes, prices, user ratings, genres, and more. PowerBI & SQL are utilized for querying and manipulating the dataset, while visualizations help highlight significant insights.
![image](https://github.com/user-attachments/assets/c8d432a8-ba17-46d0-a808-a4aa4f6b7c72)
![image](https://github.com/user-attachments/assets/d41f0a23-ec93-4fcd-bb7b-5c0e888ca639)

### Technologies Used
- **PowerBI**: For data manipulation, visualization, and statistical analysis.
- **SQL**: To query and extract insights from the dataset.

### Dataset
The dataset used in this project contains information about apps on the Apple Store (July 2017) , including app descriptions, sizes, prices, and user ratings. The dataset has been sourced from [here](https://www.kaggle.com/datasets/ramamet4/app-store-apple-data-set-10k-apps/data?select=AppleStore.csv) and available for download.

### **Database Structure**
The database comprises two key tables:
1. **AppleStore**:
   - Contains details of apps such as `id`, `track_name`, `price`, `user_rating`, `prime_genre`, and others.
2. **appleStore_description**:
   - Provides descriptions of each app and includes columns like `id`, `track_name`, `size_bytes`, and `app_desc`.

#### Data Relationships
- The `id` column is the primary key and is used to join both tables, enabling a comprehensive view of app details and descriptions.

### Data Cleaning and Preparation
- Ensured there were no missing values across columns.
- Verified data types were consistent, allowing for straightforward analysis.
- Utilized DAX (Data Analysis Expressions) in PowerBI for data transformation and preparation, including creating calculated columns and measures to enhance data analysis capabilities.

### Exploratory Data Analysis (EDA)
The EDA phase focused on understanding the distribution and relationships within the dataset:
- **App Prices**: Most apps are either free or priced very low, following a freemium model.
- **User Ratings**: The majority of apps have ratings between 3 and 5, indicating generally positive user feedback.
- **Genre Analysis**: Certain genres, such as "Productivity" and "Music," show higher average ratings.

### Data Analysis
SQL queries were used to dive deeper into the dataset:
- **Dataset Overview**:
  - Queried all records from `AppleStore` and `appleStore_description` tables to understand the dataset structure.
  - Checked for any missing values in crucial columns such as `id`, `track_name`, and `prime_genre`.

- **App Count**:
  - The total number of apps and descriptions in the dataset were counted to ensure consistency across tables.

- **App Pricing Analysis**:
  - Counted the number of paid and free apps:
    - **Paid Apps**: Calculated the total count of apps priced above zero.
    - **Free Apps**: Calculated the total count of apps priced at zero.
  - Analyzed the maximum, minimum, and average price of paid apps to get an overview of the pricing strategy.

- **Genre Distribution**:
  - The distribution of apps by genre was analyzed to determine which genres are most represented in the dataset. This insight helps in understanding market saturation and app availability across different categories.

- **User Ratings Analysis**:
  - The maximum, minimum, and average user rating were calculated to understand the general user satisfaction level.
  - The average user rating was further broken down by genre to identify which app categories have the highest and lowest average ratings.

- **Average Price by Genre**:
  - The average price of apps was calculated by genre to identify which categories have higher or lower average prices, helping to reveal pricing strategies across genres.

- **Language Diversity and Ratings**:
  - Analyzed the average user rating based on the number of languages an app supports. The apps were grouped as:
    - Less than 10 languages
    - Between 10 and 20 languages
    - More than 20 languages
  - This analysis emphasized that apps with broader language support tend to receive higher user ratings, highlighting the importance of accessibility.

- **Description Length and User Rating**:
  - The relationship between the length of an app’s description and its average user rating was analyzed. Descriptions were categorized as:
    - **Short**: Less than 100 characters
    - **Medium**: Between 100 and 400 characters
    - **Long**: More than 400 characters
  - The analysis showed that apps with longer descriptions tend to have higher ratings, indicating that detailed information positively impacts user perception.

- **Top and Bottom Rated Apps**:
  - Identified the top 5 and bottom 5 apps based on user ratings. This provides insight into the best and worst performing apps in the dataset, helping to understand what may contribute to their high or low ratings.

DAX Analysis for Apple Store Dataset:
- **Average App Price**: This measure calculates the average price of apps that are not free (price > 0).
- **Average Rating by App Type**: This measure calculates the average user rating across all apps.
- **Free Apps**: This measure counts the total number of free apps (where the price is zero).
- **Language Diversity**: This measure categorizes apps based on the number of languages they support.
- **Paid Apps**: This measure counts the number of paid apps (where the price is greater than zero).
- **Total Apps**: This measure counts the total number of apps available in the dataset.
- **Description Length**: This measure categorizes the apps based on the length of their description as "Short", "Medium", or "Long".
- **App Type**: This measure classifies apps as either "Paid" or "Free" based on their price, helping to distinguish between different types of user engagement and expectations for each category.


### Results/Findings
1. The freemium model dominates the app marketplace, with most apps being free or priced minimally.
2. Paid apps generally receive higher user ratings, indicating that users expect and value quality in paid apps.
3. Apps that support multiple languages (between 10-20) are rated higher, suggesting that global accessibility is a significant factor in user satisfaction.
4. Apps with longer descriptions receive higher ratings, indicating that detailed information and transparency positively impact user perception and satisfaction.
5. The classification of apps as "Paid" or "Free" using the `App Type` measure confirms that there is a significant difference in user engagement and expectations between these two categories.


### Recommendations
- **Improve Accessibility**: Developers should support multiple languages to enhance user satisfaction and app ratings, as apps supporting between 10-20 languages tend to receive higher ratings.
- **Focus on Quality for Paid Apps**: Ensure paid apps deliver high value to justify the cost and maintain positive user feedback. Higher user ratings for paid apps indicate that users expect quality and are willing to pay for it.
- **Analyze Successful Genres**: Leverage insights from high-performing categories like "Productivity" and "Music" to enhance other app types. Focusing on the features that make these genres successful could help improve app performance in other categories.
- **Enhance App Descriptions**: Since apps with longer and more detailed descriptions receive higher ratings, developers should provide comprehensive and informative descriptions to attract and retain users.
- **Adjust Pricing Strategy**: Evaluate and possibly adjust app prices based on genre-specific insights. For example, genres with higher average prices might justify premium pricing, while others may benefit from a freemium model to attract a larger user base.
- **Monitor and Optimize User Engagement**: Regularly analyze user ratings and feedback, especially in top and bottom performing apps, to understand what drives high satisfaction or dissatisfaction. Use these insights to refine app features and support.

### Limitations
- The analysis is based solely on user ratings and app metadata, without considering external factors such as marketing efforts, app engagement metrics (e.g., downloads, active users), or advertising spend, which could significantly impact user ratings.
- The dataset lacks information on user demographics (e.g., age, location), which could provide more personalized and granular insights into app preferences and behavior patterns.
- The impact of app updates or versions on ratings was not fully explored. The dataset does not contain version history or change logs, which limits the ability to analyze whether updates positively or negatively influence user satisfaction.
- Only apps present in the dataset at the time of collection were analyzed, meaning any new apps released or removed apps are not accounted for, potentially skewing the results.
- The genre analysis may be limited as the "prime_genre" field does not provide a detailed breakdown of subcategories, making it challenging to capture nuanced differences within broader genres (e.g., differentiating between subtypes of "Games").

