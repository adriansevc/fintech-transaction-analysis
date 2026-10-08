-- Fintech Transaction Analysis
-- 04: Account Investigation
-- Identify failed transactions by customer and account

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    a.account_id,
    t.transaction_date,
    t.amount,
    t.transaction_type,
    t.status,
    t.failure_reason

FROM customers AS c

JOIN accounts AS a
    ON c.customer_id = a.customer_id

JOIN transactions AS t
    ON a.account_id = t.account_id

WHERE t.status = 'failed'

ORDER BY c.customer_id, t.transaction_date;
