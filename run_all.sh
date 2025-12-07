#!/bin/bash

# Stop immediately if an error occurs
set -e

echo "Starting reproducible workflow..."

# Step 1: Data Integration
echo "Running 01_data_integration.ipynb..."
python -m nbconvert --to notebook --execute --inplace 01_data_integration.ipynb

# Step 2: Cleaning
echo "Running 02_cleaning.ipynb..."
python -m nbconvert --to notebook --execute --inplace 02_cleaning.ipynb

# Step 3: EDA
echo "Running EDA.ipynb..."
python -m nbconvert --to notebook --execute --inplace EDA.ipynb

# Step 4: Modeling
echo "Running 03_modeling.ipynb..."
python -m nbconvert --to notebook --execute --inplace 03_modeling.ipynb

echo "Workflow completed successfully!"