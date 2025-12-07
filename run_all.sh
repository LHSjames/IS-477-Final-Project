#!/bin/bash

set -e

echo "Starting Data Integration..."
jupyter nbconvert --to notebook --execute --inplace 01_data_integration.ipynb

echo "Starting Data Cleaning..."
jupyter nbconvert --to notebook --execute --inplace 02_cleaning.ipynb

echo "Starting EDA..."
jupyter nbconvert --to notebook --execute --inplace EDA.ipynb

echo "Starting Modeling..."
jupyter nbconvert --to notebook --execute --inplace 03_modeling.ipynb

echo "Workflow Complete! All notebooks ran successfully."
