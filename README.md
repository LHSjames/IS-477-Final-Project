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
