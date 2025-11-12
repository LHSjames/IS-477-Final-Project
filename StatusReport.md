# Interim Status Report (Milestone 3)

## 1. Task Updates

Here is an update on the tasks from our original project plan:

* **Phase 1: Project Planning**
    * **Status:** Completed
    * **Description:** The initial `ProjectPlan.md` was submitted for Milestone 2. Feedback has been reviewed and is addressed in Section 3 of this report.
    * **Artifacts:** `ProjectPlan.md`

* **Phase 2: Data Acquisition & Integration**
    * **Status:** In Progress
    * **Description:** As the Data Engineer (JJ), I have written the `01_data_integration.ipynb` notebook to perform the two-stage data merge.
    * **Artifacts:** `01_data_integration.ipynb`

* **Phase 3: Data Cleaning & Feature Engineering**
    * **Status:** Not Started
    * **Description:** This task will begin once the integrated dataset from Phase 2 is finalized.

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

| Task | Original Target Date | Status | Updated Due Date | Assigned To |
| :--- | :--- | :--- | :--- | :--- |
| Project Planning | Oct 7, 2025 | Completed | N/A | Both |
| Data Acquisition | ~Oct 12, 2025 | **In Progress** | Nov 17, 2025 | JJ Park |
| Data Cleaning | ~Oct 14, 2025 | Not Started | Nov 22, 2025 | JJ Park |
| EDA | ~Oct 19, 2025 | Not Started | Nov 27, 2025 | James Lee |
| Model Selection | ~Oct 23, 2025 | Not Started | Dec 3, 2025 | James Lee |
| Model Evaluation | ~Oct 27, 2025 | Not Started | Dec 8, 2025 | James Lee |
| **Final Submission** | **N/A** | **Not Started** | **Dec 10, 2025** | **Both** |

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

## 4. Individual Contributions


JJ Park:
* Authored the `01_data_integration.ipynb` notebook to perform the two-stage data merge.
* Successfully ran the integration to combine the `listings`, `reviews`, and `neighbourhoods` datasets.
* Generated the final `integrated_chicago_data.csv` file.
* Created the `.gitignore` file to prevent large data files from being committed to the repository, per project requirements.
