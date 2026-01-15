# Industrial Analytics Project — Mexico Toy Store (Maven Toys)

This repository contains an end-to-end **Industrial Analytics / Demand Management** project based on the **Maven Toys (Mexico Toy Store Warehouse)** dataset.  
It covers:

- Data loading & preparation (CSV + optional SQL staging)
- Exploratory analytics & visualizations
- Clustering (KMeans)
- Forecasting models (baseline + Random Forest + RNN/GRU)
- Saved model artifacts + plots for reporting

Link to the dataset:
mavenanalytics.io/data-playground

### 0) Prerequisites

- **Python 3.10+** (3.12 works if your packages support it)
- **Jupyter Notebook / JupyterLab**
- Optional but recommended for the SQL step:
  - **MySQL Server**
  - **MySQL Workbench**

> If you skip the SQL part, you can still run most notebooks directly from `data/*.csv`.

---

## 1) Create and activate a virtual environment

### Windows (PowerShell)

cd C:\Users\Flo\Documents\Arbeit\HFU_Study\0_IndusAnal\Proj

python -m venv venv
.\venv\Scripts\Activate.ps1

## 2) Install dependencies
pip install --upgrade pip
pip install -r requirements.txt

jupyter lab

## 3) (Optional but recommended) Load the dataset into MySQL

This repo includes a SQL workflow for reproducible queries and a clean staging layer.

### 3.1 Start / prepare MySQL

Make sure MySQL Server is running

Open MySQL Workbench and confirm you can connect

### 3.2 Run the loader notebook

sql/mysql_loader.ipynb

## 4) Run the main project notebook (entry point)

src/analytics_Project_Structure.ipynb

## 5) Run the model notebooks you care about

For example begin with the Notebook about RNN in the src folder