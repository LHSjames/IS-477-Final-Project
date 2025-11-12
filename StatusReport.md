# Interim Status Report (Milestone 3)

## 1. Task Updates

Here is an update on the tasks from our original project plan:

* **Phase 1: Project Planning**
    * **Status:** Completed
    * **Description:** The initial `ProjectPlan.md` was submitted for Milestone 2. Feedback has been reviewed and is addressed in Section 3 of this report.
    * **Artifacts:** `ProjectPlan.md`

* **Phase 2: Data Acquisition & Integration**
    * **Status:** Completed
    * **Description:** As the Data Engineer (JJ), I have written and successfully executed the 01_data_integration.ipynb notebook. The listings, reviews, and neighbourhoods datasets have been merged.
    * **Artifacts:** `01_data_integration.ipynb`

* **Phase 3: Data Cleaning & Feature Engineering**
    * **Status:** Completed
    * **Description:** As the Data Engineer (JJ), I have written and executed the `02_cleaning.ipynb` notebook. All empty columns were dropped, and rows with missing 'price' data were removed.
    * **Artifacts:** `02_cleaning.ipynb`

* **Phase 4: Exploratory Data Analysis (EDA)**
    * **Status:** Not Started
    * **Description:** James will begin the EDA once the cleaned data from Phase 3 is available.

* **Phase 5: Model Selection & Training**
    * **Status:** Not Started
    * **Description:** This task will follow the EDA.

* **Phase 6: Model Evaluation & Final Report Draft**
    * **Status:** Not Started
    * **Description:** This is the final stage of the project.

---

## 2. Updated Timeline

Our timeline has been adjusted to reflect the work remaining until the final deadline.

| Task | Status | Due Date | Assigned To |
| :--- | :--- | :--- | :--- |
| Project Planning | Completed | Oct 7, 2025 | Both |
| Data Acquisition | Completed | Nov 12, 2025 | JJ Park |
| Data Cleaning | Completed | Nov 12, 2025 | JJ Park |
| EDA | ~Oct 19, 2025 | Nov 27, 2025 | James Lee |
| Model Selection | Not Started | Dec 3, 2025 | James Lee |
| Model Evaluation | Not Started | Dec 8, 2025 | **Both**  |
| **Final Submission** | **Not Started** | - | **Both** |

---

## 3. Changes to Project Plan

Based on feedback received for Milestone 2, we are updating our project plan.

### Response to Milestone 2 Feedback

1.  **Dataset License and Attribution:**
    * **Feedback:** `Datasets [–1]: Please specify dataset license and confirm adherence to Inside Airbnb’s attribution policy.`
    * **Action:** We have reviewed the Inside Airbnb terms of use. The data is provided under a **Creative Commons CC BY-NC-SA 4.0 License**.
    * **Adherence:** We will adhere to this license by:
        1.  **Attribution:** Providing a clear citation to Inside Airbnb in our final `README.md`.
        2.  **Non-Commercial:** Using this data strictly for this academic course project.
        3.  We will not redistribute the raw data in our GitHub repository; our `.gitignore` file prevents this.

2.  **Addressing Gaps with Future Modules:**
    * **Feedback:** `Gaps [–1]: Briefly note future course modules (metadata, reproducibility, automation) that you’ll expand on later.`
    * **Action:** We will expand our project scope to explicitly include tasks from upcoming modules:
        * **Workflow Automation (cf. Module 11-12):** We will create a `run_all.sh` script or a Snakemake file to automate the end-to-end workflow (running integration, cleaning, and modeling).
        * **Reproducibility (cf. Module 13):** We will create a `requirements.txt` file to document all software dependencies.
        * **Metadata (cf. Module 15):** We will create a `data_dictionary.md` (codebook) for our final `integrated_chicago_data.csv` file.

---

## 4. Exploratory Data Analysis

### Artifacts: eda.ipynb, fig_price_hist.png, fig_price_by_room.png

### Description:

Exploratory Data Analysis (EDA) was completed using the cleaned Chicago Airbnb dataset. The goal was to understand the overall structure and main patterns in the data before modeling. We reviewed variable distributions, correlations, and neighborhood trends to uncover key insights.

Visualizations showed that listing prices are right-skewed, with most properties priced at the lower range and a few very high-priced outliers. Entire homes and apartments have significantly higher median prices than private or shared rooms. Neighborhood analysis revealed that price and minimum stay requirements vary strongly across locations, suggesting that neighborhood category is a meaningful factor for prediction.

We also examined correlations among numeric features such as price, availability, and reviews-per-month (a proxy for booking frequency). Early findings suggest that listings with higher availability and moderate pricing tend to receive more consistent reviews.

These results confirm that the dataset is ready for the modeling phase, and they provide a clear direction for feature selection and transformation (e.g., log-scaling price, encoding neighborhoods, and using review metrics as success indicators).

---

## 5. Individual Contributions


**JJ Park (Data Engineer):**
* Authored the `01_data_integration.ipynb` notebook to perform the two-stage data merge.
* Authored the `02_cleaning.ipynb` notebook to clean the integrated data by dropping empty columns and removing rows with missing prices.
* Successfully generated the `cleaned_chicago_data.csv` file, which is now ready for analysis.
* Created the `.gitignore` file to prevent large data files from being committed to the repository, per project requirements.
* Researched and addressed all feedback from Milestone 2 (dataset license, future modules).

* James Lee
