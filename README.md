# Compliance and Safety Analytics for Food Facilities System

## Overview
This project is focused on developing a comprehensive data analytics and reporting system for food facility inspections in Sonoma County, California. Utilizing datasets from official sources, the system is designed to model, process, and visualize inspection data to enhance food safety management and oversight.

## Objectives
- **Data Acquisition and Staging**: Retrieve and stage inspection data for further processing.
- **Data Modeling**: Design and implement a dimensional data model suitable for analytical processing.
- **Data Integration**: Populate the dimensional model using ETL processes.
- **Analytics and Reporting**: Develop BI dashboards for insightful data visualization and decision-making.

## Components
1. **Data Collection**:
   - Source: Sonoma County Open Data portal and provided files in different formats.(https://data.sonomacounty.ca.gov/Health/Food-Facility-Inspections/8r44-w5qd/about_data)
   - Data includes inspection results, violation codes, and establishment details.

2. **Data Staging and Profiling**:
   - Loading data into staging tables with audit columns.
   - Data profiling to understand data types, min/max values, and cleansing requirements.

3. **Dimensional Modeling**:
   - Identifying Facts and Dimensions.
   - Defining relationships and data grain.
   - Creating Surrogate keys and standard schema columns.

4. **ETL Process**:
   - Designing and executing Talend jobs to load data into the dimensional model.
   - Handling of special data formats and normalization of violation codes.

5. **BI Dashboard Development**:
   - Creating dashboards in Power BI and Tableau.
   - Insights on inspection results, violation categories, and trends over time.

6. **Enhanced Analytics Features**:
   - Violation categorization and scoring system for inspections.
   - Inspection result determination based on violation scores.
   - Geographical data utilization for mapping inspections.

## Technologies Used
- SQL Server and MySQL for database management.
- Talend for ETL processes.
- Power BI and Tableau for data visualization.
- ER/Studio for data modeling.


## Getting Started
- Ensure access to the data sources and necessary software tools.
- Follow the project structure for organizing the work.
- Refer to individual component documentation for detailed steps and guidelines.


