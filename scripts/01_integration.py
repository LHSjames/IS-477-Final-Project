import pandas as pd
import os

# Define file paths (assumes data is in 'data/raw/')
LISTINGS_FILE = '../data/raw/chicago_airbnb_listings.csv'
REVIEWS_FILE = '../data/raw/chicago_airbnb_reviews.csv'
NEIGHBORHOODS_FILE = '../data/raw/chicago_airbnb_neighbourhoods.csv'
OUTPUT_FILE = '../data/processed/integrated_chicago_data.csv'

print("Starting data integration...")

# Load datasets
listings = pd.read_csv(LISTINGS_FILE)
reviews = pd.read_csv(REVIEWS_FILE)
neighborhoods = pd.read_csv(NEIGHBORHOODS_FILE)
print("Files loaded.")

# Step 1: Join Listings and Reviews
integrated_data = pd.merge(
    listings,
    reviews,
    left_on='id',
    right_on='listing_id',
    how='left',
    suffixes=('_listing', '_review')
)
print("Step 1/2: Listings and reviews merged.")

# Step 2: Join with Neighborhood Metadata
final_integrated_data = pd.merge(
    integrated_data,
    neighborhoods,
    on='neighbourhood',
    how='left',
    suffixes=('', '_neighborhood')
)
print("Step 2/2: Neighborhood data merged.")

# Save the final dataset
os.makedirs('../data/processed/', exist_ok=True)
final_integrated_data.to_csv(OUTPUT_FILE, index=False)
print(f"Integration complete! Final data saved to {OUTPUT_FILE}")
