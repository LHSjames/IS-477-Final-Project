# Chicago Airbnb Market Analysis

## Contributors
* **JJ Park (jjp11):** Data Engineer. Collected and integrated the listings, reviews, and neighborhood datasets. Built the data cleaning pipeline to remove nulls and format currency. Created the project structure and `.gitignore` to ensure compliance.
* **James Lee (hosangl2):** Data Analyst. Performed Exploratory Data Analysis (EDA) on the cleaned dataset. Created visualizations for price distribution and room type analysis. Interpreted findings to guide future modeling strategies.

## Summary
* **Goal:** The goal of this project is to perform a data-intensive examination of the Chicago Airbnb market by integrating static property attributes, dynamic review activity, and official neighborhood metadata.
* **Motivation:** Understanding the drivers of listing prices and popularity is critical for both hosts and policymakers. This project seeks to reveal how location and property features influence market dynamics.
* **Research Questions:**
    1. What is the measurable impact of neighborhood categorization on listing price and minimum stay requirements?
    2. Which listing features (e.g., room type, price) are the strongest predictors of booking frequency?
    3. Are there specific neighborhood factors that correlate with host turnover?
* **Findings:** Our analysis reveals that the market is heavily right-skewed in terms of price, with a clear hierarchy based on room type. Neighborhood location serves as a strong differentiator for both price and minimum stay requirements. Listings with moderate pricing and consistent availability tend to receive the most frequent reviews.

**Project Overview and Motivation** The rise of the "gig economy" has fundamentally transformed urban housing markets, with platforms like Airbnb acting as a central driver of this shift. In cities like Chicago, short-term rentals have created a complex ecosystem where property owners act as micro-hoteliers, balancing pricing strategies against occupancy rates and regulatory constraints. The motivation for this project, "Chicago Airbnb Market Analysis," stems from a desire to understand the underlying mechanics of this marketplace. Specifically, we sought to determine what actually drives the value of a listing: Is it purely location (neighborhood), the physical privacy of the room type, or more dynamic factors like host activity? Understanding these drivers is critical not only for potential hosts seeking to maximize revenue but also for policymakers trying to understand how short-term rentals interact with local housing dynamics.

**Research Objectives** Our primary research goal was to perform a data-intensive examination of the Chicago market by moving beyond simple descriptive statistics and towards an integrated, multi-faceted view of the ecosystem. We defined three core research questions to guide our analysis:

* **Geographic Influence:** What is the measurable impact of neighborhood categorization on pricing power and minimum stay requirements?

* **Listing Attributes:** Which physical features—specifically room type—serve as the strongest predictors of price?

* **Market Activity:** How do pricing and availability correlate with booking frequency (using review density as a proxy)?

**Methodological Approach:** To answer these questions, we did not rely on a single flat file. Instead, we architected a relational dataset by integrating three distinct sources from Inside Airbnb: static Listings data (property attributes), dynamic Reviews data (historical activity), and official Neighborhood metadata (geographic standardization).

The technical execution was divided into clear phases. First, a data engineering pipeline was established to merge these sources using relational keys (id, listing_id, and neighbourhood). This allowed us to map temporal review data onto static property features. Second, a rigorous cleaning process was applied. We identified that the dataset contained significant missing values in critical financial columns; specifically, we removed approximately 35,550 records that lacked valid price data to ensure our subsequent financial analysis was statistically sound. We also standardized currency formats and filtered out entirely null columns such as neighbourhood_group.

**Key Findings and Insights:** Our Exploratory Data Analysis (EDA) revealed that the Chicago Airbnb market is defined by strict hierarchies and geographic premiums.

* **Price Distribution:** The market is heavily right-skewed. While the vast majority of listings remain affordable, a "long tail" of high-priced outliers exists, skewing the mean and suggesting that a small number of luxury properties operate in a completely different market segment than the typical host.

* **The Privacy Premium:** We found that "Room Type" is a definitive price differentiator. "Entire home/apt" listings command a significant median price premium over "Private rooms," validating the hypothesis that privacy is the primary luxury commodity in this market.

* **Neighborhood Dynamics:** Location acts as a strict multiplier on price. Downtown and Near North Side neighborhoods do not just have higher prices; they often enforce different minimum stay requirements, suggesting a more professionalized hosting environment compared to outlying residential areas.

**Conclusion** This project successfully transformed raw, disjointed data into a clean, integrated asset that reveals the structural drivers of the Chicago short-term rental market. The findings highlight that "price" is not a random variable but a function of specific, identifiable factors—primarily privacy (room type) and location (neighborhood). These insights provide a robust foundation for the next logical step: developing a predictive machine learning model to estimate listing prices based on these validated features.

## Data Profile
We utilized three distinct datasets from **Inside Airbnb**, integrated to create a comprehensive view of the market.
* **Dataset 1: Listings (`chicago_airbnb_listings.csv`)**
    * **Description:** Contains static attributes of properties including price, room type, and physical specifications.
    * **Key Fields:** `id`, `price`, `room_type`, `neighbourhood`.
* **Dataset 2: Reviews (`chicago_airbnb_reviews.csv`)**
    * **Description:** Contains historical review dates, used here to measure listing activity and popularity over time.
    * **Key Fields:** `listing_id`, `date`.
* **Dataset 3: Neighborhoods (`chicago_airbnb_neighbourhoods.csv`)**
    * **Description:** Official list of Chicago neighborhoods used to validate and standardize geographic data.
    * **Key Fields:** `neighbourhood`.
* **Ethical & Legal:** The data is sourced from Inside Airbnb under a **Creative Commons CC BY-NC-SA 4.0 License**. We strictly adhered to this by using the data for non-commercial academic purposes only and providing clear attribution. Raw data is excluded from this repository via `.gitignore` to prevent redistribution.

## Data Quality
* **Assessment:**
    * The `neighbourhood_group` column was found to be entirely null.
    * Significant missing values were found in `price` and `last_review` columns.
    * Data required type conversion (e.g., currency strings to floats).
* **Cleaning:**
    * We executed a two-stage relational merge (Listings + Reviews, then + Neighborhoods).
    * We dropped entirely empty columns (like `neighbourhood_group`).
    * We removed approximately 35,550 records that lacked valid price data to ensure accurate financial analysis.
    * The final dataset contains over 466,000 integrated records ready for analysis.

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
