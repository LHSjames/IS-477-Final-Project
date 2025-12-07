# Chicago Airbnb Market Analysis

## Contributors
* **JJ Park (jjp11):** Data Engineer. Collected and integrated the listings, reviews, and neighborhood datasets. Built the data cleaning pipeline to remove nulls and format currency. Created the project structure and `.gitignore` to ensure compliance.
* **James Lee (hosangl2):** Data Analyst. Performed Exploratory Data Analysis (EDA) on the cleaned dataset. Created visualizations for price distribution and room type analysis. Interpreted findings to guide future modeling strategies.

## Summary
**Project Overview and Motivation**

The rise of the gig economy has fundamentally transformed urban housing markets, with platforms like Airbnb acting as a central driver of this shift. In cities like Chicago, short-term rentals have created a complex ecosystem where property owners act as micro hoteliers, balancing pricing strategies against occupancy rates and regulatory constraints. The motivation for this project, titled Chicago Airbnb Market Analysis, stems from a desire to understand the underlying mechanics of this marketplace. Specifically, we sought to determine what actually drives the value of a listing. We investigated whether value is driven purely by location, the physical privacy of the room type, or more dynamic factors like host activity. Understanding these drivers is critical not only for potential hosts seeking to maximize revenue but also for policymakers trying to understand how short-term rentals interact with local housing dynamics.

**Research Objectives**

Our primary research goal was to perform a data-intensive examination of the Chicago market by moving beyond simple descriptive statistics and towards an integrated and multifaceted view of the ecosystem. We defined three core research questions to guide our analysis. First, we investigated the geographic influence to determine the measurable impact of neighborhood categorization on pricing power and minimum stay requirements. Second, we analyzed listing attributes to identify which physical features, specifically room type, serve as the strongest predictors of price. Third, we examined market activity to understand how pricing and availability correlate with booking frequency, using review density as a proxy for success.

**Methodological Approach**

For the methods, we did not rely on a single flat file. Instead, we architected a relational dataset by integrating three distinct sources from Inside Airbnb, including static Listings data regarding property attributes, dynamic Reviews data regarding historical activity, and official Neighborhood metadata for geographic standardization. The technical execution was divided into clear phases. First, a data engineering pipeline was established to merge these sources using relational keys. This allowed us to map temporal review data onto static property features. Second, a rigorous cleaning process was applied. We identified that the dataset contained significant missing values in critical financial columns. We specifically removed approximately 35,550 records that lacked valid price data to ensure our subsequent financial analysis was statistically sound. We also standardized currency formats and filtered out entirely null columns, such as the neighborhood group field.

**Key Findings and Insights**

Our Exploratory Data Analysis revealed that the Chicago Airbnb market is defined by strict hierarchies and geographic premiums. Regarding price distribution, we found the market is heavily skewed to the right. While the vast majority of listings remain affordable, a long tail of high-priced outliers exists. This skews the mean and suggests that a small number of luxury properties operate in a completely different market segment than the typical host. Regarding the privacy premium, we found that Room Type is a definitive price differentiator. Entire home and apartment listings command a significant median price premium over private rooms. This validates the hypothesis that privacy is the primary luxury commodity in this market. Finally, our analysis of neighborhood dynamics showed that location acts as a strict multiplier on price. Downtown and Near North Side neighborhoods do not just have higher prices, but they also  often enforce different minimum stay requirements. This suggests a more professionalized hosting environment compared to outlying residential areas.

**Conclusion**

This project successfully transformed raw and disjointed data into a clean and integrated asset that reveals the structural drivers of the Chicago short-term rental market. The findings highlight that price is not a random variable but a function of specific and identifiable factors, primarily privacy and location. These insights provide a robust foundation for the next logical step, which is developing a predictive machine learning model to estimate listing prices based on these validated features.

## Data Profile
**Data Source and Scope**
The data for this project was obtained from Inside Airbnb, an independent, non-commercial watchdog project that tracks the impact of short-term rentals on residential communities. We utilized a snapshot of the Chicago market, specifically selecting three distinct files that allow for a relational reconstruction of the hosting ecosystem. These files were downloaded directly from the Inside Airbnb archive and represent a verified snapshot of market conditions. To ensure the integrity of our analysis, we verified that the snapshot represents a consistent time period, allowing us to correlate listing availability with review activity without temporal mismatch. The final integrated dataset includes information on **8,604 unique listings**, **464,254 historical reviews**, and the official geographic boundaries of Chicago's **77 community areas**.

**Dataset 1: Listings (chicago_airbnb_listings.csv)**
The primary dataset, `listings.csv`, serves as the backbone of our relational model. It functions as a dimension table containing the static attributes of every unique listing available on the platform during the snapshot window. This file is the most granular source of information, providing row-level detail for each property. The dataset contains **8,604 records** and **18 columns**. The key identifying field is `id`, which serves as the primary key for joining with other datasets.

The attributes within this file can be categorized into three critical segments:
1. **Physical Specifications:** Columns such as `room_type` (e.g., "Entire home/apt" vs. "Private room"), `name`, and `license` describe the physical and legal status of the unit. This segment is essential for categorizing the inventory and understanding the "privacy premium" discussed in our findings.
2. **Financial and Operational Data:** This includes the `price`, `minimum_nights`, and `availability_365` columns. Our initial profiling revealed data quality issues here: specifically, the `price` column contained **923 null values** (approximately 10.7% of the total), and the `neighbourhood_group` column was found to be 100% empty (8,604 nulls). These discoveries directly informed our cleaning strategy, necessitating the removal of incomplete records to ensure accurate financial modeling.
3. **Host Metadata:** Fields like `host_id`, `host_name`, and `calculated_host_listings_count` provide context on the operator. These metrics allow us to distinguish between casual sharers and commercial operators managing multiple units.

**Dataset 2: Reviews (chicago_airbnb_reviews.csv)**
To measure market activity, we utilized the `reviews.csv` file. Unlike the static listings file, this dataset represents a longitudinal record of transaction history. It contains **464,254 individual records**, each representing a unique review left for a listing. The file structure is lean, containing only `listing_id` (foreign key) and `date`.

The primary value of this dataset lies in its temporal nature. By analyzing the `date` column, we constructed time-series metrics to estimate booking frequency. Since Airbnb does not publish actual booking data, the frequency of reviews serves as the industry-standard proxy for occupancy and demand. This dataset allowed us to move beyond simple pricing analysis and investigate the relationship between a listing’s physical attributes and its actual performance in the marketplace over time.

**Dataset 3: Neighborhoods (chicago_airbnb_neighbourhoods.csv)**
The third dataset, `neighbourhoods.csv`, is a reference table containing the official list of Chicago community areas. It contains **77 records**, corresponding to the city's official neighborhood divisions. While the Listings dataset contains a `neighbourhood` column, it is often subject to user-entry variance or informal naming conventions.

This reference file allows us to validate and standardize the geographic data, ensuring that our analysis aligns with official city planning zones. It acts as a lookup table, ensuring that when we group metrics by location, we are using a consistent and statistically valid set of boundaries rather than arbitrary user-defined labels. Notably, the `neighbourhood_group` column in this file was also found to be entirely null, confirming our decision to drop this feature during the cleaning phase.

**Data Integration and Lineage**
The construction of the final analytical dataset required a multi-stage integration process. We adopted a star-schema approach where the Listings file acted as the central fact table. We executed a left join with the Reviews data to aggregate activity metrics (such as reviews per month) onto the listing. We subsequently joined this result with the Neighborhoods file to validate geographic labels. The identification of 100% null values in the `neighbourhood_group` columns across both datasets was a critical finding, streamlining our feature selection process by eliminating redundant or empty variables early in the pipeline.

**Ethical and Legal Constraints**
Ethical use of this data is paramount. The source data is provided by Inside Airbnb under a **Creative Commons CC BY-NC-SA 4.0 License** (Attribution-NonCommercial-ShareAlike). We have strictly adhered to these terms in the following ways. First, regarding **Non-Commercial Use**, this project is strictly academic. No insights derived here will be sold or used for commercial advantage. Second, regarding **Attribution**, we have explicitly cited Inside Airbnb as the source in our documentation and report. Third, regarding **Privacy**, we acknowledge that while the data is public, it represents real individuals. The source data anonymizes guest information, and listing locations are "fuzzed" by Airbnb to protect privacy (showing a circular area rather than an exact address). We respected this by not attempting to reverse-engineer exact addresses. Finally, to comply with "Redistribution" constraints and GitHub file size limits, the raw CSV files are not included in this repository. They are listed in our `.gitignore` file, and we have provided a checksum-verified acquisition workflow for reproducibility.

## Data Quality
**Overview of Assessment Framework**
Ensuring the reliability of our analysis required a rigorous assessment of the input data. We evaluated the integrated dataset against a framework of **Completeness** (is data missing?), **Validity** (does the data conform to expected formats?), and **Consistency**. This assessment revealed critical issues with missing financial data and redundant geographic columns that dictated our cleaning strategy.

**1. Completeness and Missing Data**
The most significant challenge was missing values in key analytical columns.
* **Pricing Data:** We identified records that contained null values in the `price` column. Since price is our primary dependent variable for modeling, these records were deemed "fatally incomplete." Imputing these values was rejected to avoid introducing artificial noise into our ground-truth target variable.
* **Geographic Grouping:** Both the `neighbourhood_group` and `neighbourhood_group_neighborhood` columns were found to be **100% null**. This is a known artifact of the Inside Airbnb data for Chicago, which relies on specific "Community Areas" (`neighbourhood`) rather than larger borough-style groups.
* **Review History:** A small subset of listings (1,568 records) had null values for 'date' and 'reviews_per_month'. These represent listings with zero reviews. Unlike the pricing data, this "missingness" is informative because it identifies new or inactive inventory. Consequently, these records were retained to preserve a complete view of market supply.

**2. Cleaning Pipeline and Actions**
Our cleaning process (see `02_cleaning.ipynb`) focused on structural refinement and strict filtering of invalid financial records.
* **Schema Refinement:** We dropped the empty columns `neighbourhood_group` and `neighbourhood_group_neighborhood` to reduce memory overhead and eliminate redundant null features.
* **Financial Filtering:** We executed a strict drop operation on any row missing `price` data. This ensured that every record in our final analysis has a valid, confirmed price.
* **Result:** The final, cleaned dataset (`cleaned_chicago_data.csv`) contains **430,486 integrated records**. Each record represents a review event enriched with the static properties of the listing, or a listing with no reviews, ready for the next stage of analysis.

## Findings
Our Exploratory Data Analysis (EDA) yielded the following key insights:
* **Price Distribution:** As seen in `fig_price_hist.png`, listing prices are significantly right-skewed. The majority of listings are affordable, but a long tail of high-priced outliers exists.
* **Room Type Impact:** As shown in `fig_price_by_room.png`, "Entire home/apt" listings command a significantly higher median price compared to "Private rooms" or "Shared rooms."
* **Neighborhood Effects:** Location is a critical determinant. Price and minimum-stay requirements vary strongly by neighborhood, suggesting that geographic features are essential for any predictive pricing model.
* **Booking Frequency:** Listings with moderate pricing and consistent availability correlate with higher review counts, suggesting these are the most "active" segment of the market.
* **Predictive Modeling:** We trained a Linear Regression model to predict listing prices. The model achieved an **R² score of 0.050**, indicating that price variation is highly complex and not solely determined by basic features.
* **Key Drivers:** Despite the low overall predictive power, the model identified clear premium factors.
    * **Room Type:** "Hotel rooms" are by far the most expensive category, adding an estimated **$3,757** to the nightly price compared to the baseline.
    * **Location:** Neighborhoods like **Near North Side** (+$624) and **The Loop** (+$226) command significant premiums, confirming our hypothesis that downtown locations drive higher prices.

## Future Work
* **Predictive Modeling:** The next logical step is to implement the regression model (originally planned) to predict listing prices based on the features identified in our EDA (room type, neighborhood, availability).
* **External Data Integration:** Integrating socioeconomic data (e.g., median household income by neighborhood) could explain *why* certain neighborhoods command higher prices beyond just geography.
* **NLP on Reviews:** Analyzing the text of reviews (sentiment analysis) could provide a quality metric that goes beyond simple star ratings.
* **Model Improvement:** The high RMSE ($1,291) and low R² suggest that the dataset likely contains extreme high-price outliers that skew a linear model. Future work would involve:
    1. **Removing Outliers:** Filtering out listings priced above $2,000/night to stabilize the model.
    2. **Advanced Modeling:** Testing non-linear models like **Random Forest** or **XGBoost** to capture complex pricing dynamics.

## Reproducing
To reproduce these results, follow these steps:

1.  **Get the Data:**
    * Download the input data from our Box folder here: https://uofi.box.com/s/g45h7ykpftjyvth3agwfl3zd9roou95z
    * *Note: Data is hosted on Box to comply with GitHub file size limits and licensing.*

2.  **Save Data:**
    * Place the downloaded CSV files in a folder named `data/` in the root of this repository.

3.  **Install Dependencies:**
    * Run the following command to install required libraries:
        ```bash
        pip install -r requirements.txt
        ```

4.  **Run Analysis:**
    * **Step 1:** Run `01_data_integration.ipynb` to merge the three source files.
    * **Step 2:** Run `02_cleaning.ipynb` to clean nulls and format data.
    * **Step 3:** Run `EDA.ipynb` to generate the statistics and visualizations (Figures 1 & 2).

## References
* **Data Source:** [Inside Airbnb](http://insideairbnb.com/get-the-data.html) (Chicago Dataset).
* **Tools:** Python, Pandas, Matplotlib, Seaborn, Jupyter Notebooks.
