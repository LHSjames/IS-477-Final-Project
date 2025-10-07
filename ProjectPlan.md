# IS 477 Project
## Overview
The overall goal of this project is to conduct a detailed, data-driven analysis of the Chicago Airbnb market. This will be achieved by integrating three distinct datasets—static property features, dynamic review activity, and official neighborhood metadata—to create a comprehensive view of the market. The final deliverable will include a statistical analysis of key factors and a predictive model designed to identify drivers of listing success and guest satisfaction.

#Research Question(s)
What is the measurable impact of neighborhood categorization (as defined by the city data) on the average listing price, minimum stay requirements, and overall availability of listings in Chicago?

Which listing features (e.g., room type, price, number of beds) are the strongest predictors of a listing's booking frequency, using the count and density of historical reviews as a proxy for success?

Are there specific, measurable neighborhood factors that correlate with host turnover or the proportion of professional, multi-listing hosts in the city?

## Team
JJ Park & James Lee

JJ Park:

James Lee:

## Datasets
I will use three files from the Chicago Inside Airbnb dataset, which will be integrated for a comprehensive analysis:

Dataset 1: Chicago Listing Features (chicago_airbnb_listings.csv). This file contains the static property data, including price, room type, and keys for integration: id and neighbourhood.

Dataset 2: Chicago Review Summary (chicago_airbnb_reviews.csv). This file contains the historical dates of all reviews, which is essential for measuring listing activity and success over time. The integration key is listing_id.

Dataset 3: Chicago Neighborhood Metadata (chicago_airbnb_neighbourhoods.csv). This file provides the official list of Chicago neighborhoods and is critical for standardizing and validating geographic analysis. The integration key is neighbourhood.

Integration Plan: Data integration will occur using two distinct relational joining steps. First, the review data will be merged with the primary listing data using a JOIN on the listing IDs (id and listing_id). Second, the combined listing data will then be validated and augmented by performing a second JOIN with the neighborhood metadata on the neighbourhood name column. This multi-step process will create a single, unified dataset for analysis.

## Timeline
The project will proceed through the following phases:

Phase 1: Project Planning. Target Completion Date: [Current Date].

Phase 2: Data Acquisition & Integration. Target Completion Date: [4-5 days from now]. Task includes loading all three files and executing the two-stage relational joins.

Phase 3: Data Cleaning & Feature Engineering. Target Completion Date: [5-7 days from now]. Task includes cleaning null values, standardizing currency, and calculating new time-series features like average days between reviews.

Phase 4: Exploratory Data Analysis (EDA). Target Completion Date: [10-12 days from now]. Task involves visualizing price distributions, review density, and performing initial comparative statistics across different neighborhoods.

Phase 5: Model Selection & Training. Target Completion Date: [14-16 days from now]. Task is to implement a predictive model (e.g., Regression or Classification) to predict a performance metric.

Phase 6: Model Evaluation & Final Report Draft. Target Completion Date: [18-20 days from now]. Task is to evaluate the model and finalize the comprehensive written report.

## Constraints
Known constraints that may impact the project timeline or scope include:

Data Scope: The analysis is limited to data collected within the Chicago metro area, which limits the generalizability of conclusions to other cities or regions.

Missing Data: The neighborhood grouping column (neighbourhood_group) in the listings data is entirely null and cannot be used. Other columns like price and last_review have non-null counts below the total number of entries, requiring careful handling of missing values.

Review Detail: The analysis is restricted to the review summary file and cannot incorporate deep Natural Language Processing (NLP) of raw review text unless a more detailed file is sourced later.

## Gaps
Areas requiring future input or potential refinement include:

Model Selection: The final predictive model architecture is currently undecided and will be chosen after the initial EDA results reveal the best target variable and data distribution.

External Data: The analysis would be enhanced by integrating external socioeconomic data (e.g., median household income by neighborhood) if time and resources permit its acquisition and integration.
