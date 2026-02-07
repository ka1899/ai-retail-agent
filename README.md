# AI-Driven Retail Data Agent
An autonomous agent built in n8n using Groq (Llama 3) and PostgreSQL to analyze 1 million+ rows of retail data.

## Features
- **Data Pipeline:** Ingests UCI Online Retail dataset via Excel to Postgres.
- **Agentic AI:** Uses LLM Tool-calling to generate and execute SQL queries.
- **Infrastructure:** Hosted locally via Docker Desktop.

## How to Run
1. Import `workflow.json` into n8n.
2. Run `setup.sql` in your Postgres instance.
3. Connect your Groq API key to the Chat Model node.

## The Dataset Source
Official Link: UCI Machine Learning Repository: Online Retail

Direct Download (.xlsx): Online Retail.xlsx (22.6 MB)

## Setup and Usage

### 1. Database Configuration
1. Ensure you have a **PostgreSQL** instance running (e.g., via Docker).
2. Run the provided `setup.sql` script to create the necessary table and view:
   ```bash
   psql -h localhost -U your_username -d your_database -f setup.sql

### Data Ingestion
Download the dataset from the UCI Repository.

Since the Excel file has two sheets we have two data injestion workflows, one for the year 2009 - 2010 and another for the year 2010-2011, which we join to create 'all_retail_data'
Import the data_injestion1.json and data_injestion2.json into n8n.

Run the Ingestion Workflow to populate the retail tables.

Note: It is recommended to import in chunks (e.g., 250,000 rows at a time) to manage memory usage.


### AI Agent Interaction
Provide your Groq API Key in the Chat Model node.

Use the chat interface to ask questions. The Agent will automatically query the all_retail_data view to provide answers.


