# AI Retail Data Agent

An autonomous LLM agent built with n8n, Groq (Llama 3), and PostgreSQL that answers natural language questions about 1M+ rows of retail transaction data — using tool-calling to dynamically generate and execute SQL, then return structured analytical outputs through a chat interface.

## What It Does

You type a question in plain English. The agent reasons about it, writes a SQL query against the retail database, executes it, and returns a clean structured answer — no manual query writing required.

**Example queries:**
- "What were the top 10 products by revenue in Q4 2010?"
- "Which countries had the highest average order value last year?"
- "Show me monthly sales trends across 2010–2011."

## Architecture

```
User (chat) → n8n Agent Node → Groq (Llama 3) → Tool Call: Execute SQL → PostgreSQL → Structured Response
```

- **LLM:** Groq API (Llama 3) for fast inference and tool-calling
- **Orchestration:** n8n for workflow automation and agent logic
- **Database:** PostgreSQL (Docker) storing 1M+ retail transactions
- **Data Pipeline:** Two-stage n8n ingestion workflow handling chunked Excel imports (250K rows at a time) across two dataset sheets, joined into a unified `all_retail_data` view

## Dataset

[UCI Online Retail Dataset](https://archive.ics.uci.edu/dataset/502/online+retail+ii) — 1M+ transactions from a UK-based retailer across 2009–2011, covering invoices, products, quantities, prices, and customer locations.

## Setup

### Prerequisites
- Docker Desktop
- n8n (local or cloud)
- Groq API key (free at [console.groq.com](https://console.groq.com))

### 1. Database Setup
```bash
# Start PostgreSQL via Docker
docker run --name retail-db -e POSTGRES_PASSWORD=yourpassword -p 5432:5432 -d postgres

# Run schema setup
psql -h localhost -U postgres -d postgres -f setup.sql
```

### 2. Data Ingestion
1. Download the dataset: [Online Retail II.xlsx](https://archive.ics.uci.edu/dataset/502/online+retail+ii)
2. Import `data_ingestion1.json` and `data_ingestion2.json` into n8n
3. Run each ingestion workflow in chunks of ~250K rows to manage memory

### 3. Run the Agent
1. Import `forecasting_agent.json` into n8n
2. Add your Groq API key to the Chat Model node
3. Open the n8n chat interface and start asking questions

## Project Structure

```
├── setup.sql               # Creates retail table + all_retail_data view
├── data_ingestion1.json    # n8n workflow: ingest 2009-2010 sheet
├── data_ingestion2.json    # n8n workflow: ingest 2010-2011 sheet
├── forecasting_agent.json  # n8n agentic workflow with LLM + SQL tool
└── README.md
```
