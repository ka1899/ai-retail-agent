-- 1. Create the main table for the UCI 352 Online Retail dataset
-- This matches the schema used in the n8n ingestion workflow
CREATE TABLE IF NOT EXISTS retail_10_11 (
    invoice VARCHAR(20),
    stock_code VARCHAR(20),
    description TEXT,
    quantity INTEGER,
    invoice_date TIMESTAMP,
    price NUMERIC,
    customer_id VARCHAR(20),
    country VARCHAR(50)
);

-- 2. Create the View that the AI Agent interacts with
-- We use a View to provide a clean, abstracted layer for the LLM
CREATE OR REPLACE VIEW all_retail_data AS 
SELECT 
    invoice,
    stock_code,
    description,
    quantity,
    invoice_date,
    price,
    customer_id,
    country
FROM retail_10_11;

-- 3. Optimization Index (Optional but recommended for 500k+ rows)
-- This helps the AI Agent get results much faster
CREATE INDEX IF NOT EXISTS idx_invoice_date ON retail_10_11(invoice_date);
CREATE INDEX IF NOT EXISTS idx_description ON retail_10_11(description);
