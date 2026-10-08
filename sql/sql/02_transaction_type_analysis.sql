-- Fintech Transaction Analysis
-- 02: Transaction Type Analysis
-- Compare Card Payments and Transfers

SELECT
    transaction_type,
    COUNT(*) AS total_transactions,

    SUM(
        CASE
            WHEN status = 'completed' THEN 1
            ELSE 0
        END
    ) AS completed,

    SUM(
        CASE
            WHEN status = 'failed' THEN 1
            ELSE 0
        END
    ) AS failed,

    ROUND(
        SUM(
            CASE
                WHEN status = 'completed' THEN 1
                ELSE 0
            END
        ) * 100.00 / COUNT(*),
        2
    ) AS success_rate

FROM transactions
GROUP BY transaction_type;
