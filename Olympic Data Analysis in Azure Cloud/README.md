**Olympic Data Analysis on Azure**


Using a wide range of Azure services, the Tokyo Olympic Data Analysis on Azure project offers a complete method for evaluating and displaying Olympic Games data. The goal of this project is to demonstrate how previous Olympic data can be used to obtain insights by utilising cloud computing and Azure's data services. Large-scale Olympic data processing, transformation, and analysis are made possible by this project's combination of Azure Databricks, Azure Data Factory, and other Azure resources. It is scalable and effective.

**Table of Contents**
Introduction
Architecture
Technologies Used
Getting Started
Prerequisites
Data Ingestion
Data Processing
Conclusion



**Introduction**

Building an end-to-end data analysis pipeline on the Azure cloud platform is demonstrated via the Olympic Data Analysis on Azure project. This involves taking in unprocessed Olympic data, converting it into an appropriate format, conducting analysis, and producing perceptive visuals. In order to accomplish these objectives, the project offers an example of how to integrate and make use of Azure Databricks, Azure Data Factory, and other Azure services.


**Architecture**


<img width="858" alt="image" src="https://github.com/RiddhiVora23/Portfolio/assets/114712420/f9c21344-ab75-43b3-a83a-152f0e90028a">


**Architecture Components**
The architecture of the project consists of the following components:

**Azure Databricks:** Used for data processing, transformation, and analysis. It provides a collaborative and interactive environment for running Spark-based jobs.

**Azure Data Factory:** Manages and orchestrates the data workflow. It is responsible for data ingestion from various sources, data transformation, and scheduling of jobs.

**Azure Storage:** Serves as the data lake for storing raw and processed data. It can also host intermediate results generated during the analysis.

**Azure SQL Database:** Stores the cleaned and transformed data, making it accessible for visualization and reporting.

**Power BI:** Connects to the Azure SQL Database to create interactive and visually appealing dashboards for data exploration.



**Technologies Used**

Azure Databricks
Azure Data Factory
Azure Storage
Azure SQL Database
Azure Synapse Analytics
Getting Started
Prerequisites


**Before you begin, make sure you have the following prerequisites:**

Azure subscription
Azure Databricks workspace
Azure Data Factory instance
Data Ingestion
DataFactory: Explain how data is ingested here.


**Data Processing**

**Databricks:** Explain the data processing stage and how raw Olympic data is cleaned and transformed into a structured format suitable for analysis. Mention Azure Databricks' distributed computing capabilities for efficient processing.


