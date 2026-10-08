-- Fintech Transaction Analysis
-- 03: Failure Analysis
-- Distribution of failed transaction reasons

SELECT
    failure_reason,
    COUNT(*) AS failed_payments,

    ROUND(
        COUNT(*) * 100.0 / (
            SELECT COUNT(*)
            FROM transactions
            WHERE failure_reason IS NOT NULL
        ),
        2
    ) AS failure_percentage

FROM transactions
WHERE failure_reason IS NOT NULL
GROUP BY failure_reason
ORDER BY failed_payments DESC;
