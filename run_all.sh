#!/bin/bash
echo "Starting Data Integration..."
jupyter nbconvert --to notebook --execute 01_data_integration.ipynb

echo "Starting Data Cleaning..."
jupyter nbconvert --to notebook --execute 02_cleaning.ipynb

echo "Starting EDA..."
jupyter nbconvert --to notebook --execute eda.ipynb

echo "Workflow Complete!"
