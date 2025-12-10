# Banxware DE Assignment- 2023 Sales Data Case Study



## Project Structure

* `dbt_banxware_assignment/`: The dbt project containing all transformation logic.
  * `models/`: SQL transformations
  * `seeds/`: Raw CSV data files
* `queries/`: Standalone SQL queries answering the 4 business questions.
* `DECISIONS.md`: Documentation of architectural choices and assumptions.

## How to Run This Project

### Prerequisites

* Python 3.10+
* dbt-snowflake (`pip install dbt-snowflake`)
* A Snowflake account

### Setup

1. **Clone the repository:**

   ```bash
   git clone https://github.com/Eashwar-22/banxware-data-assignment.git
   cd banxware-data-assignment
   ```
2. **Configure Credentials:**
   Create a `~/.dbt/profiles.yml` file with the Snowflake details (see `PROBLEM.md` for template).
3. **Run the Pipeline:**

   ```bash
   cd dbt_banxware_assignment
   dbt deps
   dbt seed  # Loads raw data
   dbt run   # Transforms data
   dbt test  # Validates data quality
   ```

### Analysis

To view the answers to the business questions, execute the `.sql` files located in the `queries/` folder directly in your Snowflake worksheet.
