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
