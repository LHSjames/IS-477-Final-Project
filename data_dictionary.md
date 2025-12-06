# Data Dictionary

## Dataset Information
* **File Name:** `cleaned_chicago_data.csv`
* **Description:** This dataset is the result of integrating Chicago Airbnb listings, reviews, and neighborhood data. It contains detailed information on individual listings joined with their historical review activity.
* **Source:** Derived from [Inside Airbnb](http://insideairbnb.com/get-the-data.html) (Chicago Dataset).
* **License:** Creative Commons CC BY-NC-SA 4.0.
* **Record Count:** > 466,000 records.

## Variable Descriptions

| Column Name | Data Type | Description | Example / Notes |
| :--- | :--- | :--- | :--- |
| `listing_id` | Integer | Unique identifier for the Airbnb listing. Used to join reviews to listings. | `12345` |
| `date` | Date | The date the review was posted. | `2023-10-31` |
| `neighbourhood` | String | The official Chicago neighborhood name where the listing is located. | `Hyde Park`, `Loop` |
| `room_type` | String | The category of the listing accommodation. | `Entire home/apt`, `Private room` |
| `price` | Float | The nightly rental price in USD. Cleaned to remove `$` and `,` characters. | `150.00` |
| `minimum_nights` | Integer | The minimum number of nights required to book the listing. | `2` |
| `reviews_per_month`| Float | The average number of reviews the listing gets per month (proxy for activity). | `3.45` |
| `availability_365` | Integer | The number of days the listing is available for booking in the next 365 days. | `180` |

## Data Cleaning Notes
* **Missing Values:** Rows with missing `price` values were dropped.
* **Formatting:** `price` was converted from a string (e.g., "$1,200.00") to a numeric float (1200.00).
* **Exclusions:** The `neighbourhood_group` column was dropped as it contained entirely null values.
