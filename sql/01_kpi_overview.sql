-- Fintech Transaction Analysis
-- 01: KPI Overview
-- Calculates overall transaction performance

SELECT
    COUNT(*) AS total_transactions,

    SUM(
        CASE
            WHEN transaction_type = 'Card Payment' THEN 1
            ELSE 0
        END
    ) AS total_card_payments,

    ROUND(
        SUM(
            CASE
                WHEN status = 'failed' THEN 1
                ELSE 0
            END
        ) * 100.00 / COUNT(*),
        2
    ) AS failure_rate,

    SUM(
        CASE
            WHEN status = 'failed' THEN 1
            ELSE 0
        END
    ) AS failed_transactions,

    SUM(
        CASE
            WHEN status = 'completed' THEN 1
            ELSE 0
        END
    ) AS completed_transactions,

    SUM(
        CASE
            WHEN status = 'completed' THEN amount
            ELSE 0
        END
    ) AS transaction_volume,

    ROUND(
        SUM(
            CASE
                WHEN status = 'completed' THEN 1
                ELSE 0
            END
        ) * 100.00 / COUNT(*),
        2
    ) AS success_rate

FROM transactions;
